# Download and Unzip the data

Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url,destfile="Course3.zip", method = "curl")
unzip("Course3.zip")


# Load necessory libraries
library(dplyr)
library(tidyr)

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# read data description
features <- read.table("./UCI HAR Dataset/features.txt")

# read train data
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# read test data
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merges
X_total <- rbind(x_train, x_test)
Y_total <- rbind(y_train, y_test)
Sub_total <- rbind(subject_train, subject_test)

# measurements on the mean and standard deviation
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_total <- X_total[,selected_var[,1]]

# descriptive activity names
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

#labels
colnames(X_total) <- features[selected_var[,1],2]

# independent tidy data set with the average of each variable for each activity and each subject
colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))


write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
