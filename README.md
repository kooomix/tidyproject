

# Overview
This file describes how the run_analysis.r scripts works.
The purpose of the script is to fulfill assigments of cousera course project of "Getting and Cleaning Data Course Project".

# Requirements
Given all relevant files exist in the working directory as provided by coursera, the following are the requirements:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Requirements 1+2:
These two has been done together. I chose to first work on test group, then on the train group, and then combine them together.
For each, test and train group, i've created a DS as follows:
a. reading the x and y files. x files has been loaded with only mean and standard deviation as required.
b. reading the subject.
c. applying col names where required.
d. merging 3 tables.

After test and train data sets were ready, I have merged them together.

# Requirement 3:
Since I have merged the activity_label to the dataset on the previous stage, the only thing left is to remove the activity_id col in order to keep the data set tidy.

# Requirement 4:
I've used gsub to replace all shortcuts on col names with full names taken from the features_info.txt file.

# Requirement 5:
I have aggregated the first tidy data set by activity and subject, calculated the mean for each measurement.
