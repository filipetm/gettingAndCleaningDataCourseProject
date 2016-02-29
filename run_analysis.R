library(plyr)

filename <- "getdata_UCI HAR Dataset.zip"
data.dir <- "UCI HAR Dataset";

## Downloading and unziping the dataset:
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, filename, mode = "wb" )
}

# Assuming that the 'UCI HAR Dataset' dir is in your working directory
if (!file.exists(data.dir)) { 
    unzip(filename) 
}

## Reading data

# Reading in the activity labels and features data
features = read.table("./UCI HAR Dataset/features.txt"); 

activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt');
colnames(activityLabels)  = c('activityId','activityType');


# Reading in the train data
subjectTrain = read.table('./UCI HAR Dataset/train/subject_train.txt');
colnames(subjectTrain)  = "subjectId";

xTrain  = read.table('./UCI HAR Dataset/train/x_train.txt');
colnames(xTrain) = features[,2];

yTrain = read.table('./UCI HAR Dataset/train/y_train.txt');
colnames(yTrain) = "activityId";


# Reading in the test data
subjectTest = read.table('./UCI HAR Dataset/test/subject_test.txt');
colnames(subjectTest) = "subjectId";

xTest = read.table('./UCI HAR Dataset/test/x_test.txt');
colnames(xTest) = features[,2];

yTest = read.table('./UCI HAR Dataset/test/y_test.txt');
colnames(yTest) = "activityId";


## 1. Merging the training and the test sets to create one data set.

# Creating unique Train Dataset
trainDS  <- cbind(subjectTrain,yTrain,xTrain)

# Creating unique Test Dataset
testDS  <- cbind(subjectTest,yTest,xTest)

# Merging the training and the test sets to create one data set.
mergedDS <- rbind(testDS,trainDS)

# selecting the second column of featuresDS 
colNames  <- as.character(features[,2])
colNames  <- c("subjectId","activityId",colNames)

## 4. Uses descriptive activity names to name the activities in the data set
colNames <-  gsub('-mean', 'Mean', colNames)
colNames <-  gsub('-std', 'Std', colNames)
colNames <- gsub('[-()]', '', colNames)

colnames(mergedDS)  <- colNames

## 2. Extracting only the measurements on the mean and standard deviation for each measurement.

# Extracts only the measurements on the mean and standard deviation for each measurement + subject and activities columns
logicalVector = (grepl("mean",colNames, ignore.case = TRUE) | grepl("std",colNames, ignore.case = TRUE) | grepl("activityId",colNames) | grepl("subjectId",colNames));

# Subset finalData table based on the logicalVector to keep only desired columns
mergedFilteredDS = mergedDS[logicalVector];

# 3. Use descriptive activity names to name the activities in the data set

# including descriptive activity names by merging the mergedFilteredDS with activityLabels
mergedFilteredNamedDS = merge(mergedFilteredDS, activityLabels, by = "activityId", all.x = TRUE);


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyDS <- ddply(mergedFilteredDS, .(activityId, subjectId), function(x) colMeans(x[, 3:88]))

# including descriptive activity names by merging the tidyDS with activityLabels
tidyDS = merge(tidyDS, activityLabels, by = "activityId", all.x = TRUE);


# Export the tidyDS 
write.table(tidyDS, "./tidyData.txt", row.names = FALSE);


