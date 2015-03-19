run_analysis <- function() {
    library(reshape2)
    library(dplyr)
    activities <- read.table("UCI HAR Dataset/activity_labels.txt")
    features   <- read.table("UCI HAR Dataset/features.txt")
    
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    X_train       <- read.table("UCI HAR Dataset/train/X_train.txt")
    y_train       <- read.table("UCI HAR Dataset/train/y_train.txt")
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    X_test       <- read.table("UCI HAR Dataset/test/X_test.txt")
    y_test       <- read.table("UCI HAR Dataset/test/y_test.txt")
    
    train <- cbind(subject_train, y_train, X_train)
    test  <- cbind(subject_test,  y_test,  X_test)
    cat("dim(train) = ", dim(train), "\n")
    cat("dim(test) = ", dim(test), "\n")
    
    names(train) <- c("subject", "activity", as.character(features[, 2]))
    names(test)  <- c("subject", "activity", as.character(features[, 2]))
    #print("as.character(activities[train[1, Activity], 2]):")
    #print(as.character(activities[train[1, "Activity"], 2]))
    
    traintest <- rbind(train, test)
    
    for (i in 1:nrow(traintest)) {
        traintest[i, "activity"]  <- as.character(activities[traintest[i, "activity"], 2])
    }
    
    colsMeanTF <- grepl("mean\\(\\)", names(traintest))
    colsStdTF <- grepl("std\\(\\)", names(traintest))
    colsTF <- colsMeanTF | colsStdTF
    colsTF <- c(TRUE, TRUE, colsTF[3:length(colsTF)])
    
    meanStd <- traintest[,colsTF]
    cat("dim(meanStd) = ", dim(meanStd), "\n")
    print("tail(meanStd[,1:4]):")
    print(tail(meanStd[,1:4]))
    
    bySubjAct <- group_by(meanStd, subject, activity)
    meansBySubjAct <- bySubjAct %>% summarise_each(funs(mean))
    print("dim(meansBySubjAct):")
    print(dim(meansBySubjAct))
    print("tail(meansBySubjAct[1:4], 15):")
    print(tail(meansBySubjAct[1:4], 15))
    
    write.table(meansBySubjAct, file="phonemotionTidy.txt", row.names=FALSE)
    
    meansBySubjActRead <- read.table("phonemotionTidy.txt", header=TRUE)
    print("dim(meansBySubjActRead):")
    print(dim(meansBySubjActRead))
    
    print(names(meansBySubjActRead))
    print("tail(meansBySubjActRead[1:4], 15):")
    print(tail(meansBySubjActRead[1:4], 15))
    
}