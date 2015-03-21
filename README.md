# Getting-and-Cleaning-Data-Project
Course project for Coursera Getting and Cleaning Data: Activity sensor data from smartphone, 30 subjects.

## Dataset includes the following files:
* README.MD (this file)
* UCI HAR Dataset: data from smartphone motion sensors, less the Inertial Signals folders
of raw data, which weren't used.  This data was downloaded from 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
* run_analysis.R:  script to process data in "UCI HAR Dataset"
* phonemotionTidy.txt: data reduced and tidied by run_analysis.R, operatting on UCI HAR 
Dataset data.
* CODEBOOK.txt: description of phonemotionTidy.txt.
* update_github_repo.txt: git commands to update github repo after editing local files.

There were 30 subjects, numbered 1-30, and six activities, labelled LAYING, SITTING, 
STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS.  There were a total of 10299 
measurements (rows) in the train and test data files

## Processing by run_analysis.R:
* The UCI HAR Dataset (see CODEBOOK.md for a description) having been downloaded from
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, 
  read.table statements load the activities labels, feature (column) names, training  and 
  testing subjects (together numbered 1-30) for each measurement (Subject_train and 
  Subject_test), activities lists (one activity per measurement)for training and testing, 
  and training and testing measured data (X_train, X_test), into eight separate data 
  frames. 
* The subject and activities vectors are inserted at the left in the X_train and X_test 
data frames.
* The labels "subject", "activity" and the feature names are applied to the columns 
in the training and testing data frames.
* The training and testing data frames are combined by rbind.
* In the "activity" column, the numbers are replaced by the aforementioned six labels.
* The column names containing "mean" or "std" (as well as subject or activity) are 
identified by grepl and put into vector colsTF.
* The colsTF  vector is used to subset the columns, resulting in a data frame of 81 columns.
* The subsetted data frame is grouped by subject-activity combination to produce 6 x 30 = 
180 rows, and summarise_each is used to apply mean() in each column to the 66 measurements
for each combination.  
* This final 180 x 81 data frame is written to a file phonemotionTidy.txt containing the 
reduced, tidied data frame.
* The final dataframe can be read into R by:
      meansBySubjActRead <- read.table("phonemotionTidy.txt", header=TRUE)
* Note that when the data frame is read in, "(", ")", and "_" are replaced by ".".



## The INPUT dataset is (following essentially copied from the dataset's README.txt file):

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been 
randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

Test values are normalized and bounded within [-1,1].

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 
readings/window). The sensor acceleration signal, which has gravitational and body motion
components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 
features was obtained by calculating variables from the time and frequency domain. See 
'features_info.txt' for more details. 

For each record it is provided (the raw Inertial Signals data is excluded here):

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body 
acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

More information on the input data set's variables are in its features_info.txt file.

## The INPUT dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': vector of subjects' numbers corresponding to each test.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': vector of subjects' numbers corresponding to each test.
