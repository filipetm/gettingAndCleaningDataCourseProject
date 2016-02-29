Getting and Cleaning Data - Course Project
==========================================

This repository contains the R code and documentation files for the Data Science's course "Getting and Cleaning data"


## Files

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

`CodeBook.md` : a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called.

`run_analysis.R` contains the code that perfome the analyses.

## Description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Steps
It does the following.

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The **output** of run_analysis.R ie a file `tidyData.txt`.

## Steps detailed
The following steps were performed:

1. Downloaded and unziped the data files.
2. Read three train files (subjectTrain, xTrain and yTrain) and adjust their colums names
3. Read three test files (subjectTest, xTest and yTest) and adjust their colums names
3. Merged the training data sets to create one data set  (called trainDS)
4. Merged the test data sets to create one data set (called testDS)
5. Merged the training and the test sets to create one data set (called mergedDS)
6. Extracted only the measurements on the mean and standard deviation for each measurement + subject and activities columns
7. Adjusted the merged data set to use descriptive activity names to name the activities
8. Created a second, independent tidy data set with the average of each variable for each activity and each subject (called tidyDS)
9. Wrote the reslul to file tidyData.txt
