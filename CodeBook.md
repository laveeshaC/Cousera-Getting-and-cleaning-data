## Source Data

The dataset represents data obtained from accelerometers from a Samsung Galaxy S smartphone.
A full description of the data can be obtained from the website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



## About R script
run_analysis.R contain following steps:

#### 1. Merges the training and the test sets to create one data set.

Reading dataset including training set, testing set activity lables and feature vectors.
After assigning columns, the process of merging dataall data was one set is done.

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Creating vector for defining ID, mean and standard deviation was done on this process.

#### 3. Uses descriptive activity names to name the activities in the data set

Create a second set of independent data sets with the average of each variable for each activity and each subject

#### 4. Appropriately labels the data set with descriptive variable names.

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Variables
train_x, train_y, test_x, test_y, train_subject and test_subject contain the data from the downloaded files.
