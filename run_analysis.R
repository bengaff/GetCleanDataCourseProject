# Code for the Course Project for Getting & Cleaning Data course on Coursera.


# 1. Merge the training and the test sets to create one data set.

# Open the training and test sets:

# Note, I would have opened the data sets using the fread() function in the data.table package to
# load them as quickly as possible,but this caused RStudio on my Mac to crash for some reason 
# when opening some of the required files and so I have opened with read.table() and then 
# converted to a data table. This code assumes that the working directory is set to the
# directory 'UCI HAR Dataset' that includes the data provided for the course project.

# Load Training set and Test set.
library(data.table)
trainSet <- read.table("train/X_train.txt",header=FALSE)
testSet <- read.table("test/X_test.txt",header=FALSE)
combineSet <- data.table(rbind(trainSet,testSet))

# Load activity labels.
trainActivities <- read.table("train/y_train.txt",header=FALSE)
testActivities <- read.table("test/y_test.txt",header=FALSE)
combineActivities <- rbind(trainActivities,testActivities)
setnames(combineActivities,"ActivityID")

# Load subject records.
trainSubjects <- read.table("train/subject_train.txt",header=FALSE)
testSubjects <- read.table("test/subject_test.txt",header=FALSE)
combineSubjects <- rbind(trainSubjects,testSubjects)
setnames(combineSubjects,"Subject")

# Add activity labels and subject identifiers to Training and Test set data.
combineSet <- cbind(combineSet,combineActivities,combineSubjects)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# Load features.txt file to establish which columns include the words "mean", "Mean" or "std" 
# in the description of the measurements. Based on the wording used for this point in the 
# assignment it's not entirely clear whether or not all measures with the word "mean" or "Mean" are
# required, but I have included them all for completeness. 

features <- read.table("features.txt",header=FALSE)
features$selectVar <- grepl("[mM]ean|std",features$V2)

# Create a list of variable columns to keep.
features$varName <- paste0("V",features$V1)
varKeep <- c(features[features$selectVar==TRUE,4],"ActivityID","Subject")

# Select columns with labels containing either "mean" or "std".
combineSet2 <- combineSet[,c(varKeep),with=FALSE]

# 3. Use descriptive activity names to name the activities in the data set.
# Load activity_labels text file to get description of activities.
activityLabels <- read.table("activity_labels.txt",header=FALSE)

# Set column names and change to data.table to facilitate merge.
setnames(activityLabels,c("ActivityID","Activity"))  
activityLabels <- data.table(activityLabels) 

# Append activity labels to the dataset and remove ActivityID column.
combineSet2 <- merge(combineSet2,activityLabels,by="ActivityID",all.x=TRUE)
combineSet2[,ActivityID := NULL]

# 4. Appropriately label the data set with descriptive variable names. 
# Create varDesc column within the features table based on the feature description
# column in the features.txt file by removing "()" and replacing "-" with "_" 
# This provides a descriptive name for each of the measures variables using characters 
# that can be included in object names in R.
features$varDesc <- gsub("\\-","_",gsub("\\(|\\)","",features$V2))

# Change column names for combineSet2 using the varDesc variable in features.
setnames(combineSet2, c(features[features$selectVar==TRUE,5],"Subject","Activity"))


# 5. From the data set in step 4, create a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

# Calculate means for each variable grouped by Subject & Activity.
SubjectActivityAverages <- combineSet2[,lapply(.SD,mean),by=list(Subject,Activity)][order(Subject)]

# SubjectActivityAverages provides one row for each activity undertaken by each subject.
# The data includes 180 rows, which represent 6 activities for each of the 30 subjects. 
# The measures for each row are the means of each of the 86 measures that were selected in step 2
# of the data processing described above. 

# The following code exports the SubjectActivityAverages data to a .txt file in the current 
# working directory 
write.table(SubjectActivityAverages,file="SubjectActivityAverages.txt",row.name=FALSE)

