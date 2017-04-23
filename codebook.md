
# Getting and Cleaning Data Course Project - Code Book

# General

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

Read here (README.txt) for more information about how the original data was collected, the meaning of variables and files included.
Read here (features_info.txt) for more informations about the variables collected.


# Loading and Merging Data
Load activity labels
activity_labels - holds the names of the labels of activiti_labels.txt files.

# Load and genreate test table
x_test - holds the data of x_test.txt file, after filtering mean and std measurments.
y_test - holds the data of y_test.txt with an additional column mapping the activity label name to their ids.
subject_test - holds the data of the test/subject_test.txt file.
Merged_test - hold a column Binding of subject_test, y_test and x_test.

# Load and generate train table
x_train - holds the data of x_train.txt file, after filtering mean and std measurments.
y_train - holds the data of y_train.txt with an additional column mapping the activity label name to their ids.
subject_train - holds the data of the train/subject_train.txt file.
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
Merged_DS2 - holds an aggregation of Merged_DS by activity and subject calculating the average of all variables.

# Merged_DS2 is the output of the script, as txt file under the name "tidydata.txt"

 











