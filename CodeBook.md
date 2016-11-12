#Data
The data represents data collected from accelerometers from the Samsung Galaxy S smartphone.

## Original data: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Original description of data: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Brief description of data:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#Analysis

## Goals
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Approach
1. Download and unzip the data set.
2. Load the names of the features into a data table named `features`.
3. Load the training data set, labels, and subjects into data tables names `trainingSet`, `trainingLabels`, and `trainingSubjects` respectively.
4. Combine the training data into a data table called `trainingData`.
5. Load the test data set, labels, and subjects into data tables names `testSet`, `testLabels`, and `testSubjects` respectively.
6. Combine the test data into a data table called `testData`.
7. Merge the training and test data into a data table called `mergedData`.
8. Find all rows in `features` that are measurements of mean and standard deviation using regular expression pattern matching. Save in variable `matches`.
9. Create a data table named `meanStdData` that uses `matches` to extract only the mean and standard deviation measurements from `mergedData`.
10. Load the activity labels from the data set into a data table named `activityLabels`.
11. Update the values in the `activity` column of `meanStdData` to use the descriptive activity names from `activityLabels`.
12. Create a second, independent tidy data set named `tidyData` with the average of each variable for each activity and subject.
13. Rename the accelerometer data column names in `tidyData` by appending the string `.average`.
14. Write `tidyData` to disk with the filename `tidyData.txt`.

#Output
* tidyData.txt: A tidy data set showing the average of various accelerometer measurements for each subject and each activity.
