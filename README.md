# Coursera Getting & Cleaning Data Course Project
  
## Overview  
  
This repository contains files for the Course Project for the Getting & Cleaning Data Course on 
Coursera as follows:  
  **1. README.md**  
  - This markdown file provides an explanation of all the files included in the repository as well 
  as a description of the approach and rationale that was used in the creation of the code created 
  for the project. The HTML version of this file is also included in the repository.  
  **2. run_analysis.R**  
  - The code in this file takes the raw data provided for the project and transforms it into a tidy 
  data set that includes the average, for each subject and each activity, for each of the measures 
  on the mean and standard deviation for each measurement included in the project data.  
  **3. SamsungDataCodeBook.md**  
  - This file describes the design of this study as well as providing a description of each variable 
  included in the "SubjectActivityAverages.txt" file that is created by the code in the 
  "run_analysis.R" file.The HTML version of this file is also included in the repository.  
  
  
## Approach & Rationale  
  
  Overall the purpose of this project is to consolidate data from files that have been obtained 
  from the UCI Machine Learning Repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. This data is based around observations of 30 volunteers who each performed 6 activities 
  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) whilst wearing a 
  smartphone on their waist.  There are 10,299 observation records in total (7,352 records for the 
  21 subjects in the training group and 2,947 for the 9 subjects in the testing group). 
  The following data is provided for each of the records included in the data set, stored in the
  'test' and 'train' directories.  
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body 
  acceleration.  
  - Triaxial Angular velocity from the gyroscope.  
  - A 561-feature vector with time and frequency domain variables.  
  - Its activity label.  
  - An identifier of the subject who carried out the experiment.  
  
  Data for the first 2 items in the list described above are not required for the steps listed in
  the project brief and so the related data files, which are contained in the 'Inertial Signals' 
  subdirectories within the 'test' and 'train' directories, have not been considered in the code.  
  
  As requested in the project brief the code in the R script called run_analysis.R does the 
  following.  
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.  
  3. Uses descriptive activity names to name the activities in the data set.  
  4. Appropriately labels the data set with descriptive variable names.  
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of 
  each variable for each activity and each subject.  
  
  The final step requested is to save and upload the tidy data set created in step 5 as a txt file 
  created with write.table() using row.name=FALSE. The run_analysis.R file also includes the code 
  used to save the table.  
  
  More detailed explanation of the code used within run_analysis.R is included within the script and
  also within the SamsungDataCodeBook.md in this repository.  
