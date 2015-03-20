Because it is always important to know how the raw data was measured, this file describes 
the dataset that was INPUT to the run_analysis.R script as well as the OUTPUT of that 
script, the file phonemotionTidy.txt.  OUTPUT file first:


## The OUTPUT dataset is phonemotionTidy.txt.

The processing by run_analysis.R is described in README.md.

The output data phonemotionTidy.txt can be read back into a dataframe in R by:
meansBySubjAct <- read.table("phonemotionTidy.txt", header=TRUE)

* The 180 rows are enumerated by 30 subject numbers and six activity labels.
* The 68 columns are "subject", "activity" and 66 feature variables selected from the
input dataset by selecting names containing "mean()" or "std()".
* each value in the 66 feature columns is the mean of that column's values occurring in
INPUT-dataframe rows with the row's combination of subject and activity.
* The feature names are:
 [1] "subject"                     "activity"                   
 [3] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
 [5] "tBodyAcc.mean...Z"           "tBodyAcc.std...X"           
 [7] "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
 [9] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"       
[11] "tGravityAcc.mean...Z"        "tGravityAcc.std...X"        
[13] "tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
[15] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
[17] "tBodyAccJerk.mean...Z"       "tBodyAccJerk.std...X"       
[19] "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
[21] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"         
[23] "tBodyGyro.mean...Z"          "tBodyGyro.std...X"          
[25] "tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
[27] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
[29] "tBodyGyroJerk.mean...Z"      "tBodyGyroJerk.std...X"      
[31] "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
[33] "tBodyAccMag.mean.."          "tBodyAccMag.std.."          
[35] "tGravityAccMag.mean.."       "tGravityAccMag.std.."       
[37] "tBodyAccJerkMag.mean.."      "tBodyAccJerkMag.std.."      
[39] "tBodyGyroMag.mean.."         "tBodyGyroMag.std.."         
[41] "tBodyGyroJerkMag.mean.."     "tBodyGyroJerkMag.std.."     
[43] "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
[45] "fBodyAcc.mean...Z"           "fBodyAcc.std...X"           
[47] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
[49] "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"      
[51] "fBodyAccJerk.mean...Z"       "fBodyAccJerk.std...X"       
[53] "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"       
[55] "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
[57] "fBodyGyro.mean...Z"          "fBodyGyro.std...X"          
[59] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
[61] "fBodyAccMag.mean.."          "fBodyAccMag.std.."          
[63] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyAccJerkMag.std.."  
[65] "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroMag.std.."     
[67] "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.." 
* t referes to a time-domain variable, f refers to a frequency-domain varible, 
* Acc refers to measurements from the phone's accelerometer and Gyro to measurements from
the phone's gyroscope.
* Note that in these feature names, from the data set as read back in by 
     meansBySubjActRead <- read.table("phonemotionTidy.txt", header=TRUE)
  the characters "()", and "_" have been replaced by ".." and "." respectively.
* "mean..", ie. mean(), refers to a measurement averaged over a time or frequency window in
the sensor's data, and "std..", ie. std(), is the standard deviation of such a set of 
measurements.


## The INPUT dataset is (description essentially copied from the dataset's README.txt file):

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
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

