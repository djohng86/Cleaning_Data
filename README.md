Cleaning_Data
=============
For creating a tidy data set of wearable computing data originally from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files in this repo

README.md -- describes how the script works
CodeBook.md -- describes the variable
run_analysis.R -- R code

run_analysis.R goals

1. Merges the training and the test sets to create one data set. 
2. 2. Extracts the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis.R steps

Download a UCI HAR Dataset folder to the desktop. Can run run_analysis.R as long as the data is on desktop. 

Dependencies

run_analysis.R file will help you to install the dependencies automatically. It depends on reshape2 and data.table.
