library(data.table)
library(plyr)

run <- function () {
  # read 'train/X_train.txt': Training set.
  # read 'test/X_test.txt'
  # read features.txt -- apply these as columns name for the data sets.
  #      remove _, -, (, ) from each column
  # merge two data set now since col names are identical
  # select columns with word "mean" and "sd"
  if (!file.exists("UCI HAR Dataset")) {
    stop ("./UCI HAR Dataset directory not found.")
  }
  
  dfFeatures <- read.csv("./UCI HAR Dataset/features.txt", colClasses = "character", header=F, sep=" ")
  dfFeatures[,2] <- gsub("-","", dfFeatures[,2])
  dfFeatures[,2] <- gsub("-","", dfFeatures[,2])
  dfFeatures[,2] <- gsub('\\(',"", dfFeatures[,2])
  dfFeatures[,2] <- gsub('\\)',"", dfFeatures[,2])
  dfFeatures[,2] <- gsub('\\,',"", dfFeatures[,2])

  
  dfXTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  colnames(dfXTest) <-dfFeatures[,2]
  dfyTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
  colnames(dfyTest) <- c("ActivityCode")
  dfTest <- cbind(dfXTest, dfyTest)
  #str(dfTest)
  
  dfXTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  colnames(dfXTrain) <-dfFeatures[,2]
  dfyTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
  colnames(dfyTrain) <- c("ActivityCode")
  dfTrain <- cbind(dfXTrain, dfyTrain)
  #str(dfTrain)
  
  dfALL <- rbind(dfTrain, dfTest)
  dfALL$ActivityLabel <- seq(1:nrow(dfALL))
  dfALL[dfALL$ActivityCode %in% c(1),563] = "WALKING"
  dfALL[dfALL$ActivityCode %in% c(2),563] = "WALKING_UPSTAIRS"
  dfALL[dfALL$ActivityCode %in% c(3),563] = "WALKING_DOWNSTAIRS"
  dfALL[dfALL$ActivityCode %in% c(4),563] = "SITTING"
  dfALL[dfALL$ActivityCode %in% c(5),563] = "STANDING"
  dfALL[dfALL$ActivityCode %in% c(6),563] = "LAYING"
  table(dfALL$ActivityLabel)
  

}  