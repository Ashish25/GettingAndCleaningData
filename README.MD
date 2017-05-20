# Getting and Cleaning Data Course Project
Project of Getting and Cleaning Data using R programming, May 2017 edition.


### Project Description
The purpose of this projectability to collect, work with, and clean a data set. The data comes form [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/), the zipped data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
**The goal is to prepare tidy data that can be used for further analysis.**

### Data Set Information

_The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data._ 

_The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain._

### My Code
The R script, `run_analysis.R`, does the following:

* Download the dataset if it does not already exist in the working directory
* Load the activity and feature info
* Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
* Loads the activity and subject data for each dataset, and merges those columns with the dataset
* Merges the two datasets
* Converts the activity and subject columns into factors
* Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
* The end result is shown in the file `tidy.txt`.