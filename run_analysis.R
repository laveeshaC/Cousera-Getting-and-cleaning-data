##Downloading and unzipping data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./Getting and Cleaning Data Project/data/Dataset.zip",exdir="./data")





##Reading and Merging data

# Reading trainings data
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")


# Reading testing data
test_x <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading features
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activities = read.table('./data/UCI HAR Dataset/activity_labels.txt')






###Assign col names
colnames(train_x) <- features[,2] 
colnames(train_y) <-"activityId"
colnames(train_subject) <- "subjectId"

colnames(test_x) <- features[,2] 
colnames(test_y) <- "activityId"
colnames(test_subject) <- "subjectId"

colnames(activities) <- c('activityId','activityType')





###Merge Dataset
train_merge <- cbind(train_y, train_subject, train_x)
test_merge <- cbind(test_y, test_subject, test_x)
dataset <- rbind(train_merge, test_merge)


#Extract columns name 
col <- colnames(dataset)


mean_and_std <- (grepl("activityId" , col) | 
                   grepl("subjectId" , col) | 
                   grepl("mean.." , col) | 
                   grepl("std.." , col) 
)


datasetMeanStd <- dataset[ , mean_and_std == TRUE]



###Uses descriptive activity names to name the activities in the data set

datasetSetActivities <- merge(datasetMeanStd, activities,
                              by='activityId',
                              all.x=TRUE)





## creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- aggregate(. ~subjectId + activityId, datasetSetActivities, mean)
tidy_data <- tidy_data[order(tidy_data$subjectId, tidy_data$activityId),]


write.table(tidy_data, "tidyData.txt", row.names = FALSE, 
            quote = FALSE)
