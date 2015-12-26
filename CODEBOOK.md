## The OUTPUT dataset is phonemotionTidy.txt.

The processing by run_analysis.R is described in README.md.

The output data phonemotionTidy.txt can be read back into a dataframe in R by:
meansBySubjAct <- read.table("phonemotionTidy.txt", header=TRUE)

* The 180 rows are enumerated by 30 subject numbers and six activity labels, 
            LAYING
           SITTING
          STANDING
           WALKING
WALKING_DOWNSTAIRS
  WALKING_UPSTAIRS
* The 81 columns are "subject", "activity" and 79 feature variables selected from the
input dataset by selecting names containing "mean" or "std".
* each value in the 79 feature columns is the mean of that column's values occurring in
INPUT-dataframe rows with the row's combination of subject and activity.
* The feature names are (as read back in by read.table()):
[1] "subject"                         "activity"                       
[3] "timeBodyAccMeanX"                "timeBodyAccMeanY"               
[5] "timeBodyAccMeanZ"                "timeBodyAccStdX"                
[7] "timeBodyAccStdY"                 "timeBodyAccStdZ"                
[9] "timeGravityAccMeanX"             "timeGravityAccMeanY"            
[11] "timeGravityAccMeanZ"             "timeGravityAccStdX"             
[13] "timeGravityAccStdY"              "timeGravityAccStdZ"             
[15] "timeBodyAccJerkMeanX"            "timeBodyAccJerkMeanY"           
[17] "timeBodyAccJerkMeanZ"            "timeBodyAccJerkStdX"            
[19] "timeBodyAccJerkStdY"             "timeBodyAccJerkStdZ"            
[21] "timeBodyGyroMeanX"               "timeBodyGyroMeanY"              
[23] "timeBodyGyroMeanZ"               "timeBodyGyroStdX"               
[25] "timeBodyGyroStdY"                "timeBodyGyroStdZ"               
[27] "timeBodyGyroJerkMeanX"           "timeBodyGyroJerkMeanY"          
[29] "timeBodyGyroJerkMeanZ"           "timeBodyGyroJerkStdX"           
[31] "timeBodyGyroJerkStdY"            "timeBodyGyroJerkStdZ"           
[33] "timeBodyAccMagMean"              "timeBodyAccMagStd"              
[35] "timeGravityAccMagMean"           "timeGravityAccMagStd"           
[37] "timeBodyAccJerkMagMean"          "timeBodyAccJerkMagStd"          
[39] "timeBodyGyroMagMean"             "timeBodyGyroMagStd"             
[41] "timeBodyGyroJerkMagMean"         "timeBodyGyroJerkMagStd"         
[43] "freqBodyAccMeanX"                "freqBodyAccMeanY"               
[45] "freqBodyAccMeanZ"                "freqBodyAccStdX"                
[47] "freqBodyAccStdY"                 "freqBodyAccStdZ"                
[49] "freqBodyAccMeanFreqX"            "freqBodyAccMeanFreqY"           
[51] "freqBodyAccMeanFreqZ"            "freqBodyAccJerkMeanX"           
[53] "freqBodyAccJerkMeanY"            "freqBodyAccJerkMeanZ"           
[55] "freqBodyAccJerkStdX"             "freqBodyAccJerkStdY"            
[57] "freqBodyAccJerkStdZ"             "freqBodyAccJerkMeanFreqX"       
[59] "freqBodyAccJerkMeanFreqY"        "freqBodyAccJerkMeanFreqZ"       
[61] "freqBodyGyroMeanX"               "freqBodyGyroMeanY"              
[63] "freqBodyGyroMeanZ"               "freqBodyGyroStdX"               
[65] "freqBodyGyroStdY"                "freqBodyGyroStdZ"               
[67] "freqBodyGyroMeanFreqX"           "freqBodyGyroMeanFreqY"          
[69] "freqBodyGyroMeanFreqZ"           "freqBodyAccMagMean"             
[71] "freqBodyAccMagStd"               "freqBodyAccMagMeanFreq"         
[73] "freqBodyBodyAccJerkMagMean"      "freqBodyBodyAccJerkMagStd"      
[75] "freqBodyBodyAccJerkMagMeanFreq"  "freqBodyBodyGyroMagMean"        
[77] "freqBodyBodyGyroMagStd"          "freqBodyBodyGyroMagMeanFreq"    
[79] "freqBodyBodyGyroJerkMagMean"     "freqBodyBodyGyroJerkMagStd"     
[81] "freqBodyBodyGyroJerkMagMeanFreq"
* For details of the variaable names, see features_info.txt in the input data set.
* time refers to a time-domain variable, freq refers to a frequency-domain varible, 
* Acc refers to measurements from the phone's accelerometer, in units of 'g', the 
acceleration due to gravity.
* Gyro refers to measurements from the phone's gyroscope, in radians/sec.
* MeanFreq denotes a mean frequency measurement in Hz.
* "Mean", ie. mean(), refers to a measurement averaged over a time or frequency window 
in the sensor's data, and "std..", ie. std(), is the standard deviation of such a set of 
measurements.  



