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

To run, first set the current working directory which points to where the run_analysis.R.
  eg. setwd("~/GitHub/Getting_N_Cleaning_Data/CleanData_CourseProject")
  
In the R console:
  > source("run_analysis.R")
  > run()

Hope this helps.
-- Dikesh Chokshi
To run the script:
  set working directory where the run_analysis.R file located
    