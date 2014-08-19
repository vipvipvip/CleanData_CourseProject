---
title: "CodeBook.md"
author: "Dikesh Chokshi"
date: "Monday, August 18, 2014"
output: html_document
---
1. First the code verifies that the "UCI HAR Dataset" folder exists in the Current Working directory. If not it stops with an appropriate message.

2. Read the features.text and remove _, -, (, ) from each column
3. Read Train & Test data sets and apply the features as column names.
4. Read Train & Test subject and bind it to the data frames
5. Select the mean|std|ActivityCode|Subjects columns from both data frames
6. Merge both datasets. Note that we merge after selecting columns for efficiency purposes.
7. Create "Activity Lablel" column and set the labels based activity_labels.txt
8. produce the tidy set by selecting & reordering the columns. Omit the ActivityCode from the tidy set since its not needed. (per Discussion Forums)
9. Write out a csv file using write.table() using row.names=FALSE.

Column Definitions: (Total 81 columns)
1. Subject           Person who performed the activity
2. ActivityLabel	  One of the 6 activities:  1=Walking, 2=WALKING_UPSTAIRS,
                3=WALKING_DOWNSTAIRS, 4= SITTING, 5=STANDING, 6=LAYING"

The remaining columns are best described in general as follows:
They are the averages of the mean & standard deviation of the from the accelerometer and gyroscope raw signals. 

tAcc-XYZ and tGyro-XYZ are the raw signale in a time domain signals and are prefixed 't' to denote time along the X,Y, Z axis. tBodyAcc-XYZ and tGravityAcc-XYZ are the acceleration signal in the X,Y, Z direction. 

tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ are the body linear acceleration and angular velocity in the X,Y,Z direction. tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag are the magnitude of these three-dimensional signals. 

Finally fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag indicate frequency domain signals.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

