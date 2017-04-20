
#Coursera "Getting and Cleaning Data Course Project" course project.
#Date: 04/20/2017


library("reshape2")
library("plyr")

#-----------------------------------------------------------------------------
#------------Define measurements filters, read labels and features------------
#Regular expression to filter on mean and std measurments
regExMeas <- "mean\\(\\)|std\\(\\)"

#read features and generate filtered features
features <- read.table("features.txt")
filtered_features <- grepl(regExMeas, features[,2])

#Read activity labels
activity_labels <- read.table("activity_labels.txt")[,2]

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#-----------------------------------------------------------------------------
#------------Test data - Start reading, manipulating and tyding up test table--------
#read only relevant variables by filtered_features and name coloumns
x_test <- read.table("test/X_test.txt")[,filtered_features]
names(x_test) <- features[filtered_features,2]

#Read and generate activities and labels dataset
y_test <- read.table("test/y_test.txt")
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("activity_id","activity_label")

#Read Subject Data
subject_test <- read.table("test/subject_test.txt")
names(subject_test) <- "subject_id"

#Merge all test datasets.
Merged_test <- cbind(subject_test,y_test,x_test)

#-----------------------------------------------------------------------------
#------------Train data - Start reading, manipulating and tyding up train table--------
#read only relevant variables by filtered_features and name coloumns
x_train <- read.table("train/X_train.txt")[,filtered_features]
names(x_train) <- features[filtered_features,2]

#Read and generate activities and labels dataset
y_train <- read.table("train/y_train.txt")
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("activity_id","activity_label")

#Read Subject Data
subject_train <- read.table("train/subject_train.txt")
names(subject_train) <- "subject_id"

#Merge all test datasets.
Merged_train <- cbind(subject_train,y_train,x_train)

#-----------------------------------------------------------------------------
#------------Merging test and train merged tables-----------------------------
Merged_DS <- rbind(Merged_test,Merged_train)

#3.Uses descriptive activity names to name the activities in the data set----
#Remove the id col of activity leaving only the descriptive label col.
Merged_DS$activity_id <- NULL


#4.Appropriately labels the data set with descriptive variable names.
names(Merged_DS) <- gsub("^f","frequency",names(Merged_DS))
names(Merged_DS) <- gsub("acc","Accelerometer",names(Merged_DS))
names(Merged_DS) <- gsub("Gyro","Gyroscope",names(Merged_DS))
names(Merged_DS) <- gsub("^t","time",names(Merged_DS))
names(Merged_DS) <- gsub("Mag","Magnitude",names(Merged_DS))
names(Merged_DS) <- gsub("BodyBody","Body",names(Merged_DS))


#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
Merged_DS2 <- aggregate(.~subject_id + activity_label, Merged_DS, mean)
write.table(Merged_DS2, "tidydata.txt", row.name=FALSE)

