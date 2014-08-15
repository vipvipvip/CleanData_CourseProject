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
  #head(dfXTest)
  dfyTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
  colnames(dfyTest) <- c("ActivityCode")
  #dfTestList = list(dfyTest, dfXTest)
  #dfALL <- join_all(dfTestList)
  #colnames(dfALL) <- c("ActivityCode", dfFeatures[,2])
  dfALL <- cbind(dfXTest, dfyTest)
  str(dfALL)
  
  
}  