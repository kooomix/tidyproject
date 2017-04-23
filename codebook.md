
# Getting and Cleaning Data Course Project - Code Book

# General

The data linked from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The purpose of the code is to eventually generate a tidydata set which calculates the mean of each measurements for each subject and each activity.

Process of code described by phases, in each there's a description of each dataset within the code and manipulations done on it.

Read here (README.txt) for more information about how the original data was collected, the meaning of variables and files included.
Read here (features_info.txt) for more informations about the variables collected.


# Loading and Merging Data
activity_labels - loaded with the names of the labels from activiti_labels.txt file.

# Load and genreate test table
x_test - loaded with x_test.txt file data, after filtering mean and std measurments.
y_test - loaded with y_test.txt file data with an additional column mapping the activity label name to their ids.
subject_test - loaded with test/subject_test.txt file data.
Merged_test - holds a column Binding of subject_test, y_test and x_test.

# Load and generate train table
x_train - loaded with x_train.txt file data, after filtering mean and std measurments.
y_train - loaded with of y_train.txt data with an additional column mapping the activity label name to their ids.
subject_train - loaded with train/subject_train.txt file data.
Merged_test - hold a column Binding of subject_train, y_train and x_train.

# Merge test and train
Merged_DS - holds a row binding of Merged_test and Merged_train.

# Clean activity data
Remove the activity_id coloumn to keep DS tidy.

# Set Descriptive variable names
- prefix "f" changes to "frequency"
- "acc" changes to "Accelerometer"
- "Gyro" changes to "Gyroscope"
- prefix "t" changes to "time"
- "Mag" changes to "Magnitude"
- "BodyBody" changes to "Body"

# Calculate the Mean of each variable for each activity and each subject
tidy_data - holds an aggregation of Merged_DS by activity and subject calculating the average of all variables.

# tidy_data is the output of the script, as txt file under the name "tidydata.txt"
Fields:
- subject_id (int) - the id of the subject
- activity_label (factor) - one of the six labels as characters.
- 66 variables (num) - the mean of original mean and std variables. Name of each changed from original by the new descriptions as described above. 

 











