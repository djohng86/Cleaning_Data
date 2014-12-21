---
title: "Cleaning data project"
author: "Dorhyun Johng"
date: "December 21, 2014"
output: html_document
---

```{r}
install.packages("data.table")
install.packages("reshape2")
library("data.table")
library("reshape2")
setwd("~/Desktop")
## Load the file. 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
## Load the data column names
colNames <- read.table("./UCI HAR Dataset/features.txt")[,2]
## Extract the measurements on the mean and std. dev. for each measurement.
features <- grepl("mean|std", colNames)
## Load the following data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) <- colNames
## Extract the features
X_test = X_test[,features]
## Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
## Combine data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
## Load the following data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) <- colNames
## Extract the features.
X_train = X_train[,features]
## Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
# Combine data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)
# Merge test and train data
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)
```
