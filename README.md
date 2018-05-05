# Getting and Cleaning Data - Course Project

This repository is for the course project of the "Getting and Cleaning Data" course at Coursera.  
The goal of this project is to create a tidy in R to analyze experimental results which were captured in the Human Activity Recognition Using Smartphones study.

The run_analysis.R script when run on the data will transform the data into a useful information
Core funtionality of the script -
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Repository Information
This repository contains 4 files including this:
run_analysis.R - This script to perform the analysis on the provided train and test experimental data.
CodeBook.md - Contains details on the variables used in experiment and in the run_analysis.R script
tidy.txt - Tidy data set with average of each variable for each activity per subject. 
