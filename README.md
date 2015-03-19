# Getting-and-Cleaning-Data-Project
Course project for Coursera Getting and Cleaning Data: Activity sensor data from smartphone, 30 subjects.

## Dataset includes the following files:
* README.MD (this file)
* UCI HAR Dataset: data from smartphone motion sensors, less the Inertial Signals folders of raw data, which weren't used.  This data was downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
* run_analysis.R:  script to process data in "UCI HAR Dataset"
* phonemotionTidy.txt: data reduced and tidied by run_analysis.R, operatting on UCI HAR Dataset data.
* codebook.txt: description of phonemotionTidy.txt.
There were 30 subjects, numbered 1-30, and six activities, labelled LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS.  There were a total of 10299 measurements (rows) in the train and test data files

## Processing by run_analysis.R:
* The UCI HAR Dataset having been downloaded, read.table statements load the activities labels, feature (column) names, training  and testing subjects (together numbered 1-30) for each measurement (Subject_train and SUbject_test), activities lists (one activity per measurement)for training and testing, and training and testing measured data (X_train, X-test), into eight separate data frames. 
* The subject and activities vectors are inserted at the left in the X_train and X_test data frames.
* The labels "subject", "activity" and the feature names are applied to the data columns in the training and testing data frames.
* The training and testing data frames are combined by rbind.
* In the "activity" column, the numbers are replaced by the aforementioned six labels.
* The column names containing "mean()" and "std()" are identified by grepl and put into vectors colsMeanTF and colsStdTF.
* colsMeanTF and colsStdTF are ORed and the resulting vector used to subset the columns, including the subject and activity colunns and the *mean()* and *std()* columns, for a total of 68 columns.
* The subsetted data frame is grouped by subject-activity combination to produce 6 x 30 = 180 rows, and summarise_each is used to apply mean() in each column to the 66 measurements for each combination.  
* This final 180 x 68 data frame is written to a file phonemotionTidy.txt containing the reduced, tidied data frame.
