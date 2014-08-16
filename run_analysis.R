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
  dfTestSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  colnames(dfTestSubjects) <- c("Subjects")
  dfTest <- cbind(dfXTest, dfyTest, dfTestSubjects)
  #str(dfTest)
  
  dfXTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  colnames(dfXTrain) <-dfFeatures[,2]
  dfyTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
  colnames(dfyTrain) <- c("ActivityCode")
  dfTrainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  colnames(dfTrainSubjects) <- c("Subjects")
  dfTrain <- cbind(dfXTrain, dfyTrain, dfTrainSubjects)
  #str(dfTrain)
  
  #1 merge both dataset
  dfALL <- rbind(dfTrain, dfTest)
  
  #2 extract mean & std cols & additional columns
  dfALL <- dfALL[,sort(grep("mean|std|ActivityCode|Subjects", names(dfALL)))]
  
  #3 descriptive activity names
  numCols <- 82 #ncol(dfALL)
  dfALL$ActivityLabel <- seq(1:nrow(dfALL))
  dfALL[dfALL$ActivityCode %in% c(1),numCols] = "WALKING"
  dfALL[dfALL$ActivityCode %in% c(2),numCols] = "WALKING_UPSTAIRS"
  dfALL[dfALL$ActivityCode %in% c(3),numCols] = "WALKING_DOWNSTAIRS"
  dfALL[dfALL$ActivityCode %in% c(4),numCols] = "SITTING"
  dfALL[dfALL$ActivityCode %in% c(5),numCols] = "STANDING"
  dfALL[dfALL$ActivityCode %in% c(6),numCols] = "LAYING"
  #table(dfALL$ActivityLabel)
  #dfALL[1:10, grep("mean", names(dfALL))]
  #dfALL[1:10,sort(grep("mean|std", names(dfALL)))]
  dfALL[,c(80:82,1:79)]

}  