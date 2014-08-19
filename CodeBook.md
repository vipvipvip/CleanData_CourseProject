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
