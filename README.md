---
title: "CodeBook.md"
author: "Dikesh Chokshi"
date: "Monday, August 18, 2014"
output: html_document
---
CleanData_CourseProject
=======================
run_analysis.R - script to import, process and produce the final tidySet.csv in the working directory. The script resides in the working directory and expects the data to reside in "UCI HAR Dataset" folder.


The folder structure looks like so on my laptop starting at the working directory:
  C:/Users/dikesh-chokshi/Documents/GitHub/Getting_N_Cleaning_Data/CleanData_CourseProject
      \run_analysis.R
      \README.md
      \CodeBook.md
      \UCI HAR Dataset
          <data files>
    
Under the "\UCI HAR Dataset folder"", are all the files from the "getdata_projectfiles_UCI HAR Dataset.zip".

To run the script:
  set working directory where the run_analysis.R file located
  eg. setwd("~/GitHub/Getting_N_Cleaning_Data/CleanData_CourseProject")
  
In the R console:
  > source("run_analysis.R")
  > run()

This will create tidySet.csv which you can view in Excel by importing with the "space" delimiter.

Hope this helps.
-- Dikesh Chokshi
