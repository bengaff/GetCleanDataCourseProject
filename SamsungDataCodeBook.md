# Coursera Getting & Cleaning Data Course Project - Data Code Book  

## Study Design  
  
  Overall the purpose of this project is to consolidate data from files that have been obtained 
  from the UCI Machine Learning Repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. This data is based around observations of 30 volunteers who each performed 6 activities 
  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) whilst wearing a 
  smartphone on their waist.  There are 10,299 observation records in total (7,352 records for the 
  21 subjects in the training group and 2,947 for the 9 subjects in the testing group).  
  
  The raw data provided in the UCI data sets have been manipulated using the code in the file 
  "run_analysis.R" to create a final tidy data set that includes the average, for each subject and 
  each activity, for each of the measures on the mean and standard deviation for each measurement 
  included in the project data. Note that data contained in the 'Inertial Signals' subdirectories 
  within the 'test' and 'train' directories are not required for the steps listed in the project 
  brief and so have not been considered in the code.  
  
  There are 6 stages included in the code that was used to create the final tidy data set described
  above.  
  
  **1. Merge the training and the test sets to create one data set.**  
  -- Open the training and test sets.  
  - Note, I would have opened the data sets using the fread() function in the data.table package, 
  but this caused RStudio on my Mac to crash for some reason when opening some of the required
  files and so I have opened with read.table() and then converted to a data table.  
  -- Load Training set and Test set.  
  -- Load activity labels.  
  -- Load subject records.  
  -- Add activity labels and subject identifiers to combined Training and Test set data.  

  **2. Extract only the measurements on the mean and standard deviation for each measurement.**   
  -- Load features.txt file to establish which columns include the words "mean", "Mean" or "std" 
  in the description of the measurements.  
  - Based on the wording used for this point in the assignment it's not entirely clear whether 
  or not all measures with the word "mean" or "Mean" are required, but I have included them all 
  for completeness.  
  -- Create a list of variable columns to keep.  
  -- Select columns with labels containing either "mean" or "std".  

  **3. Use descriptive activity names to name the activities in the data set.**  
  -- Load activity_labels text file to get description of activities.  
  -- Set column names and change to data.table to facilitate subsequent merge.  
  -- Append activity labels to the dataset and remove ActivityID column.  

  **4. Appropriately label the data set with descriptive variable names.**  
  -- Create varDesc column within the features table based on the feature description column in 
  the features.txt file by removing "()" and replacing "-" with "_".   
  - This provides a description for each of the measures variables using characters that can 
  be included in object names in R.  
  -- Change column names for combineSet2 using the varDesc variable in features.  

  **5. From the data set in step 4, create a second, independent tidy data set with the average of 
  each variable for each activity and each subject.**  
  -- Calculate means for each variable grouped by Subject & Activity.  
  - The new object `SubjectActivityAverages` provides one row for each activity undertaken by 
  each subject.  
  - The data includes 180 rows, which represent 6 activities for each of the 30 subjects.  
  - The measures for each row are the means of each of the 86 measures that were selected in step 2
  of the data processing described above.  

  **6. Export the SubjectActivityAverages data to a .txt file in the current working directory.**  
  
## Code Book  
  
  The final data set provided in `SubjectActivityAverages` includes 88 variables that summarise the 
  observations for the 30 subjects included in the data as follows:  
  
  **1. Descriptive Variables**  
  
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| Variable Name                      | Source Tables in Original Data           | Units                                                             |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| Subject                            | subject_train.txt and "subject_test.txt" | The subject of the observations                                   |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| Activity                           | y_train.txt and "y_test.txt"             | The activity being undertaken during the observations             |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
  
  **2. Measures Variables**  
  
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| Variable Name                      | Variable Description in Factors Tables   | Units                                                             |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAcc_mean_X                    | tBodyAcc-mean()-X                        | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAcc_mean_Y                    | tBodyAcc-mean()-Y                        | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAcc_mean_Z                    | tBodyAcc-mean()-Z                        | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAcc_std_X                     | tBodyAcc-std()-X                         | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAcc_std_Y                     | tBodyAcc-std()-Y                         | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAcc_std_Z                     | tBodyAcc-std()-Z                         | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAcc_mean_X                 | tGravityAcc-mean()-X                     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAcc_mean_Y                 | tGravityAcc-mean()-Y                     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAcc_mean_Z                 | tGravityAcc-mean()-Z                     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAcc_std_X                  | tGravityAcc-std()-X                      | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAcc_std_Y                  | tGravityAcc-std()-Y                      | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAcc_std_Z                  | tGravityAcc-std()-Z                      | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerk_mean_X                | tBodyAccJerk-mean()-X                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerk_mean_Y                | tBodyAccJerk-mean()-Y                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerk_mean_Z                | tBodyAccJerk-mean()-Z                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerk_std_X                 | tBodyAccJerk-std()-X                     | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerk_std_Y                 | tBodyAccJerk-std()-Y                     | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerk_std_Z                 | tBodyAccJerk-std()-Z                     | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyro_mean_X                   | tBodyGyro-mean()-X                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyro_mean_Y                   | tBodyGyro-mean()-Y                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyro_mean_Z                   | tBodyGyro-mean()-Z                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyro_std_X                    | tBodyGyro-std()-X                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyro_std_Y                    | tBodyGyro-std()-Y                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyro_std_Z                    | tBodyGyro-std()-Z                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerk_mean_X               | tBodyGyroJerk-mean()-X                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerk_mean_Y               | tBodyGyroJerk-mean()-Y                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerk_mean_Z               | tBodyGyroJerk-mean()-Z                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerk_std_X                | tBodyGyroJerk-std()-X                    | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerk_std_Y                | tBodyGyroJerk-std()-Y                    | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerk_std_Z                | tBodyGyroJerk-std()-Z                    | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccMag_mean                   | tBodyAccMag-mean()                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccMag_std                    | tBodyAccMag-std()                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAccMag_mean                | tGravityAccMag-mean()                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tGravityAccMag_std                 | tGravityAccMag-std()                     | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerkMag_mean               | tBodyAccJerkMag-mean()                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyAccJerkMag_std                | tBodyAccJerkMag-std()                    | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroMag_mean                  | tBodyGyroMag-mean()                      | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroMag_std                   | tBodyGyroMag-std()                       | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerkMag_mean              | tBodyGyroJerkMag-mean()                  | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| tBodyGyroJerkMag_std               | tBodyGyroJerkMag-std()                   | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_mean_X                    | fBodyAcc-mean()-X                        | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_mean_Y                    | fBodyAcc-mean()-Y                        | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_mean_Z                    | fBodyAcc-mean()-Z                        | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_std_X                     | fBodyAcc-std()-X                         | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_std_Y                     | fBodyAcc-std()-Y                         | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_std_Z                     | fBodyAcc-std()-Z                         | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_meanFreq_X                | fBodyAcc-meanFreq()-X                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_meanFreq_Y                | fBodyAcc-meanFreq()-Y                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAcc_meanFreq_Z                | fBodyAcc-meanFreq()-Z                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_mean_X                | fBodyAccJerk-mean()-X                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_mean_Y                | fBodyAccJerk-mean()-Y                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_mean_Z                | fBodyAccJerk-mean()-Z                    | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_std_X                 | fBodyAccJerk-std()-X                     | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_std_Y                 | fBodyAccJerk-std()-Y                     | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_std_Z                 | fBodyAccJerk-std()-Z                     | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_meanFreq_X            | fBodyAccJerk-meanFreq()-X                | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_meanFreq_Y            | fBodyAccJerk-meanFreq()-Y                | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccJerk_meanFreq_Z            | fBodyAccJerk-meanFreq()-Z                | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_mean_X                   | fBodyGyro-mean()-X                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_mean_Y                   | fBodyGyro-mean()-Y                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_mean_Z                   | fBodyGyro-mean()-Z                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_std_X                    | fBodyGyro-std()-X                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_std_Y                    | fBodyGyro-std()-Y                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_std_Z                    | fBodyGyro-std()-Z                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_meanFreq_X               | fBodyGyro-meanFreq()-X                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_meanFreq_Y               | fBodyGyro-meanFreq()-Y                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyGyro_meanFreq_Z               | fBodyGyro-meanFreq()-Z                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccMag_mean                   | fBodyAccMag-mean()                       | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccMag_std                    | fBodyAccMag-std()                        | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyAccMag_meanFreq               | fBodyAccMag-meanFreq()                   | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyAccJerkMag_mean           | fBodyBodyAccJerkMag-mean()               | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyAccJerkMag_std            | fBodyBodyAccJerkMag-std()                | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyAccJerkMag_meanFreq       | fBodyBodyAccJerkMag-meanFreq()           | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyGyroMag_mean              | fBodyBodyGyroMag-mean()                  | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyGyroMag_std               | fBodyBodyGyroMag-std()                   | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyGyroMag_meanFreq          | fBodyBodyGyroMag-meanFreq()              | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyGyroJerkMag_mean          | fBodyBodyGyroJerkMag-mean()              | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyGyroJerkMag_std           | fBodyBodyGyroJerkMag-std()               | Average of standard deviation observations for Subject & Activity |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| fBodyBodyGyroJerkMag_meanFreq      | fBodyBodyGyroJerkMag-meanFreq()          | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| angletBodyAccMean,gravity          | angle(tBodyAccMean,gravity)              | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| angletBodyAccJerkMean,gravityMean  | angle(tBodyAccJerkMean),gravityMean)     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| angletBodyGyroMean,gravityMean     | angle(tBodyGyroMean,gravityMean)         | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| angletBodyGyroJerkMean,gravityMean | angle(tBodyGyroJerkMean,gravityMean)     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| angleX,gravityMean                 | angle(X,gravityMean)                     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| angleY,gravityMean                 | angle(Y,gravityMean)                     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+
| angleZ,gravityMean                 | angle(Z,gravityMean)                     | Average of mean observations for Subject & Activity               |
+------------------------------------+------------------------------------------+-------------------------------------------------------------------+




