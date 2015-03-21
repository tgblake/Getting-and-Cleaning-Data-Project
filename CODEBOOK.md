Because it is always important to know how the raw data was measured, this file describes 
the dataset that was INPUT to the run_analysis.R script as well as the OUTPUT of that 
script, the file phonemotionTidy.txt.  OUTPUT file first:


## The OUTPUT dataset is phonemotionTidy.txt.

The processing by run_analysis.R is described in README.md.

The output data phonemotionTidy.txt can be read back into a dataframe in R by:
meansBySubjAct <- read.table("phonemotionTidy.txt", header=TRUE)

* The 180 rows are enumerated by 30 subject numbers and six activity labels.
* The 81 columns are "subject", "activity" and 66 feature variables selected from the
input dataset by selecting names containing "mean" or "std".
* each value in the 79 feature columns is the mean of that column's values occurring in
INPUT-dataframe rows with the row's combination of subject and activity.
* The feature names are (as read back in by read.table()):
 [1] "subject"                         "activity"                       
 [3] "tBodyAcc.mean...X"               "tBodyAcc.mean...Y"              
 [5] "tBodyAcc.mean...Z"               "tBodyAcc.std...X"               
 [7] "tBodyAcc.std...Y"                "tBodyAcc.std...Z"               
 [9] "tGravityAcc.mean...X"            "tGravityAcc.mean...Y"           
[11] "tGravityAcc.mean...Z"            "tGravityAcc.std...X"            
[13] "tGravityAcc.std...Y"             "tGravityAcc.std...Z"            
[15] "tBodyAccJerk.mean...X"           "tBodyAccJerk.mean...Y"          
[17] "tBodyAccJerk.mean...Z"           "tBodyAccJerk.std...X"           
[19] "tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"           
[21] "tBodyGyro.mean...X"              "tBodyGyro.mean...Y"             
[23] "tBodyGyro.mean...Z"              "tBodyGyro.std...X"              
[25] "tBodyGyro.std...Y"               "tBodyGyro.std...Z"              
[27] "tBodyGyroJerk.mean...X"          "tBodyGyroJerk.mean...Y"         
[29] "tBodyGyroJerk.mean...Z"          "tBodyGyroJerk.std...X"          
[31] "tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"          
[33] "tBodyAccMag.mean.."              "tBodyAccMag.std.."              
[35] "tGravityAccMag.mean.."           "tGravityAccMag.std.."           
[37] "tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."          
[39] "tBodyGyroMag.mean.."             "tBodyGyroMag.std.."             
[41] "tBodyGyroJerkMag.mean.."         "tBodyGyroJerkMag.std.."         
[43] "fBodyAcc.mean...X"               "fBodyAcc.mean...Y"              
[45] "fBodyAcc.mean...Z"               "fBodyAcc.std...X"               
[47] "fBodyAcc.std...Y"                "fBodyAcc.std...Z"               
[49] "fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"          
[51] "fBodyAcc.meanFreq...Z"           "fBodyAccJerk.mean...X"          
[53] "fBodyAccJerk.mean...Y"           "fBodyAccJerk.mean...Z"          
[55] "fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"           
[57] "fBodyAccJerk.std...Z"            "fBodyAccJerk.meanFreq...X"      
[59] "fBodyAccJerk.meanFreq...Y"       "fBodyAccJerk.meanFreq...Z"      
[61] "fBodyGyro.mean...X"              "fBodyGyro.mean...Y"             
[63] "fBodyGyro.mean...Z"              "fBodyGyro.std...X"              
[65] "fBodyGyro.std...Y"               "fBodyGyro.std...Z"              
[67] "fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"         
[69] "fBodyGyro.meanFreq...Z"          "fBodyAccMag.mean.."             
[71] "fBodyAccMag.std.."               "fBodyAccMag.meanFreq.."         
[73] "fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."      
[75] "fBodyBodyAccJerkMag.meanFreq.."  "fBodyBodyGyroMag.mean.."        
[77] "fBodyBodyGyroMag.std.."          "fBodyBodyGyroMag.meanFreq.."    
[79] "fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."     
[81] "fBodyBodyGyroJerkMag.meanFreq.."
* For details of the variaable names, see features_info.txt in the input data set.
* t referes to a time-domain variable, f refers to a frequency-domain varible, 
* Acc refers to measurements from the phone's accelerometer and Gyro to measurements from
the phone's gyroscope.
* Note that in these feature names, from the data set as read back in by 
     meansBySubjActRead <- read.table("phonemotionTidy.txt", header=TRUE)
  the characters "()", and "_" have been replaced by ".." and "." respectively.
* "mean..", ie. mean(), refers to a measurement averaged over a time or frequency window 
in the sensor's data, and "std..", ie. std(), is the standard deviation of such a set of 
measurements.  "meanFreq.." denotes a mean frequency measurement (in the frequency domain;
see features_info.txt in the input data set).

