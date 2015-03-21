run_analysis <- function() {
      library(reshape2)
      library(dplyr)
      
      # Read previously downloaded dataset:
      activities <- read.table("UCI HAR Dataset/activity_labels.txt")
      features   <- read.table("UCI HAR Dataset/features.txt")
      subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
      X_train       <- read.table("UCI HAR Dataset/train/X_train.txt")
      y_train       <- read.table("UCI HAR Dataset/train/y_train.txt")
      subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
      X_test       <- read.table("UCI HAR Dataset/test/X_test.txt")
      y_test       <- read.table("UCI HAR Dataset/test/y_test.txt")
      
      # Insert subject and activity identifiers into training and testing dataframes:
      train <- cbind(subject_train, y_train, X_train)
      test  <- cbind(subject_test,  y_test,  X_test)
      cat("dim(train) = ", dim(train), "\n")
      cat("dim(test) = ", dim(test), "\n")
      
      # Put names of features (motion quantities) on columns of dataframes:
      names(train) <- c("subject", "activity", as.character(features[, 2]))
      names(test)  <- c("subject", "activity", as.character(features[, 2]))
      
      #print("as.character(activities[train[1, Activity], 2]):")
      #print(as.character(activities[train[1, "Activity"], 2]))
      
      # Merge training and testing data frames:
      traintest <- rbind(train, test)
      
      # Change number identifiers of activities to given labels:
      for (i in 1:nrow(traintest)) {
            traintest[i, "activity"]  <- as.character(activities[traintest[i, "activity"], 2])
      }
      
      # Create a vector to identify column names with "mean()" or "std()":
      colsTF <- grepl("subject|activity|mean|std", names(traintest))
      
      # Create data frame with only the required feature columns:
      meanStd <- traintest[,colsTF]
      
      cat("dim(meanStd) = ", dim(meanStd), "\n")
      print("names(meanStd):")
      print(names(meanStd))
      
      # Assign rows to 180 groups of combinations of subject and activity:
      bySubjAct <- group_by(meanStd, subject, activity)
      
      # Average over each group in each column:
      meansBySubjAct <- bySubjAct %>% summarise_each(funs(mean))
      
      cat("dim(meansBySubjAct): ", dim(meansBySubjAct), "\n")
      #print("tail(meansBySubjAct[1:4], 15):")
      #print(tail(meansBySubjAct[1:4], 15))
      
      # Output frame of means, with rows = groups of (subject, activity) 
      # and columns = measurements:
      write.table(meansBySubjAct, file="phonemotionTidy.txt", row.names=FALSE)
      
      # Illustrate how to read tidy data set back in:
      meansBySubjActRead <- read.table("phonemotionTidy.txt", header=TRUE)
      
      cat("dim(meansBySubjActRead):", dim(meansBySubjActRead), "\n")
      print(names(meansBySubjActRead))
      print("tail(meansBySubjActRead[1:4], 15):")
      print(tail(meansBySubjActRead[1:4], 15))
}