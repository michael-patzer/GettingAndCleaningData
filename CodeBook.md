#Data
The data represents data collected from accelerometers from the Samsung Galaxy S smartphone.

## Original data: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Original description of data: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Brief description of data:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Subjects

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

## Measurements

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

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

This resulting data set in `tidyData.txt` contains the following measurements: `activity` `subject` `tBodyAcc.mean...X.average` `tBodyAcc.mean...Y.average` `tBodyAcc.mean...Z.average` `tBodyAcc.std...X.average` `tBodyAcc.std...Y.average` `tBodyAcc.std...Z.average` `tGravityAcc.mean...X.average` `tGravityAcc.mean...Y.average` `tGravityAcc.mean...Z.average` `tGravityAcc.std...X.average` `tGravityAcc.std...Y.average` `tGravityAcc.std...Z.average` `tBodyAccJerk.mean...X.average` `tBodyAccJerk.mean...Y.average` `tBodyAccJerk.mean...Z.average` `tBodyAccJerk.std...X.average` `tBodyAccJerk.std...Y.average` `tBodyAccJerk.std...Z.average` `tBodyGyro.mean...X.average` `tBodyGyro.mean...Y.average` `tBodyGyro.mean...Z.average` `tBodyGyro.std...X.average` `tBodyGyro.std...Y.average` `tBodyGyro.std...Z.average` `tBodyGyroJerk.mean...X.average` `tBodyGyroJerk.mean...Y.average` `tBodyGyroJerk.mean...Z.average` `tBodyGyroJerk.std...X.average` `tBodyGyroJerk.std...Y.average` `tBodyGyroJerk.std...Z.average` `tBodyAccMag.mean...average` `tBodyAccMag.std...average` `tGravityAccMag.mean...average` `tGravityAccMag.std...average` `tBodyAccJerkMag.mean...average` `tBodyAccJerkMag.std...average` `tBodyGyroMag.mean...average` `tBodyGyroMag.std...average` `tBodyGyroJerkMag.mean...average` `tBodyGyroJerkMag.std...average` `fBodyAcc.mean...X.average` `fBodyAcc.mean...Y.average` `fBodyAcc.mean...Z.average` `fBodyAcc.std...X.average` `fBodyAcc.std...Y.average` `fBodyAcc.std...Z.average` `fBodyAcc.meanFreq...X.average` `fBodyAcc.meanFreq...Y.average` `fBodyAcc.meanFreq...Z.average` `fBodyAccJerk.mean...X.average` `fBodyAccJerk.mean...Y.average` `fBodyAccJerk.mean...Z.average` `fBodyAccJerk.std...X.average` `fBodyAccJerk.std...Y.average` `fBodyAccJerk.std...Z.average` `fBodyAccJerk.meanFreq...X.average` `fBodyAccJerk.meanFreq...Y.average` `fBodyAccJerk.meanFreq...Z.average` `fBodyGyro.mean...X.average` `fBodyGyro.mean...Y.average` `fBodyGyro.mean...Z.average` `fBodyGyro.std...X.average` `fBodyGyro.std...Y.average` `fBodyGyro.std...Z.average` `fBodyGyro.meanFreq...X.average` `fBodyGyro.meanFreq...Y.average` `fBodyGyro.meanFreq...Z.average` `fBodyAccMag.mean...average` `fBodyAccMag.std...average` `fBodyAccMag.meanFreq...average` `fBodyBodyAccJerkMag.mean...average` `fBodyBodyAccJerkMag.std...average` `fBodyBodyAccJerkMag.meanFreq...average` `fBodyBodyGyroMag.mean...average` `fBodyBodyGyroMag.std...average` `fBodyBodyGyroMag.meanFreq...average` `fBodyBodyGyroJerkMag.mean...average` `fBodyBodyGyroJerkMag.std...average` `fBodyBodyGyroJerkMag.meanFreq...average`
