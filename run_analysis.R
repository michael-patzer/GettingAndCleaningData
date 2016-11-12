# Michael Patzer
# Getting and Cleaning Data
# November 12, 2016

# Download and unzip the data set
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "./UCI-HAR-dataset.zip", method = "curl")
unzip("./UCI-HAR-dataset.zip")

# Read the features
features <- read.table("./UCI HAR Dataset/features.txt")

# Load the training data into tables, use descriptive variable names (Requirement #4)
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
trainingLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))
trainingSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))

# Create a combined table of training data
trainingData <-  data.frame(trainingSubjects, trainingLabels, trainingSet)

# Load the test data into tables, use descriptive variable names (Requirement #4)
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))

# Create a combined table of test data
testData <-  data.frame(testSubjects, testLabels, testSet)

# Requirement 1: Merges the training and the test sets to create one data set.
mergedData <- rbind(testData, trainingData)

# Requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Use regular expression to match all features with measurements of mean and standard deviation
matches <- grep("mean|std", features$V2)

# Select columns 1 (subject), 2 (activity), and add 2 to the matches to account for those 2 columns
meanStdData <- mergedData[,c(1, 2, matches + 2)]

# Requirement 3: Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
meanStdData$activity <- activityLabels[meanStdData$activity]

# Requirement 5: Create a second, independent tidy data set with the average of each variable
# for each activity and each subject.
tidyData <- aggregate(meanStdData[,3:ncol(meanStdData)], by = list(activity = meanStdData$activity, subject = meanStdData$subject), FUN = mean)

# Append .average to data variable names since they are now averages of the old data
colnames(tidyData)[3:ncol(meanStdData)] <- paste(colnames(tidyData)[3:ncol(meanStdData)], "average", sep = ".")

# Write the table to a file
write.table(x = tidyData, file = "tidyData.txt", row.names = FALSE)