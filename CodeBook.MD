# Data Set information

The data come from experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Attribute Information

For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.


The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

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
