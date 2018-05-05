Getting and Cleaning Data Course Project
Original Data -
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data for the project -
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Goal is to create a R script called run_analysis.R that does the following.
1.	Merges the training and the test sets to create one data set.
2.	Extract only the measurements on the mean and standard deviation for each measurement.
3.	Descriptive activity names to name the activities in the data set
4.	Appropriately label the data set with descriptive variable names.
5.	From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
Description of the Data provided -
1.	leading t or f is based on time or frequency measurements.
2.	Body = related to body movement.
3.	Gravity = acceleration of gravity
4.	Acc = accelerometer measurement
5.	Gyro = gyroscopic measurements
6.	Jerk = sudden movement acceleration
7.	Mag = magnitude of movement
8.	mean and SD are calculated for each subject for each activity for each mean and SD measurements.
Following set of variables are used to calculate Mean and Standard Deviation
�	tBodyAcc-XYZ
�	tGravityAcc-XYZ
�	tBodyAccJerk-XYZ
�	tBodyGyro-XYZ
�	tBodyGyroJerk-XYZ
�	tBodyAccMag
�	tGravityAccMag
�	tBodyAccJerkMag
�	tBodyGyroMag
�	tBodyGyroJerkMag
�	fBodyAcc-XYZ
�	fBodyAccJerk-XYZ
�	fBodyGyro-XYZ
�	fBodyAccMag
�	fBodyAccJerkMag
�	fBodyGyroMag
�	fBodyGyroJerkMag

Notes:
======
- Features are normalized and bounded within [-1,1].

The experiments have been carried out with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
Required R packages � dplyr and data.table
Main Steps
1.	Download the data from coursera course page
2.	Read the Train, Test, Activity, Feature and Subject files and store in Data tables
3.	Assign Column names to Data Tables from Feature table
4.	Merge the training and the test sets to create one data set.
5.	Extract only the measurements on the mean and standard deviation for each measurement.
6.	Set activity names to each Activity ID through lookup.
7.	Remove special characters from Column Names
8.	Create a second, independent tidy data set with the average of each variable for each activity and each subject.

Code Variables & Definition
Variable	Definition
alltrain	Train Data with Subject & Activity IDs
alltest	Train Data with Subject & Activity IDs
alldata	Combined Test & Train Data
stdmeandata	Dataset of variables containing Mean(mean) & Standard deviation(std) in their names
