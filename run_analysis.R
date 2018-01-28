

#Download and create a temporary file to place the zip file
temp <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

#attribute/feature names of the training and test dataset
features = read.table(unz(temp, "UCI HAR Dataset/features.txt"))
names(features) = c("ColNumber","Features")
activity_labels = read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))
names(activity_labels)=c("label","activity")



# Extract data from the "test" folder
test_data <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt")) #test dataset
test_label <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt")) #test labels
test_sub <-read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt")) #identifies the subject who performed the activity for each window sample.
test_label$dataset = "test"

# Extract data from the "train" folder
train_data <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt")) #training dataset
train_label <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt")) #training labels
train_sub <-read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt")) #identifies the subject who performed the activity for each window sample.
train_label$dataset = "train"

#merge the training and test datasets
MSTR_data = rbind(test_data,train_data)
MSTR_act = rbind(test_label,train_label)
MSTR_sub = rbind(test_sub,train_sub)


#Extracts only the measurements on the mean and standard deviation for each measurement.
features_2 = features[grepl("std[()]|mean[()]",features$Features),] # select the feature names with std() or mean()
MSTR_data = MSTR_data[,features_2$ColNumber] # filter the training dataset to only standard deviation and mean


#relabel the column names of the data. 
names(MSTR_sub) <- "subject" 
names(MSTR_act)[1] <- "activity" 
names(MSTR_data) <- features_2$Features #column names of the training dataset are located in the "features.txt" dataset.

#merge the data with the label and subject columns to form the final master dataset
MSTR_data_2 = cbind(MSTR_act,MSTR_sub,MSTR_data)

# add the activity labels
MSTR_data_3 = merge(activity_labels,MSTR_data_2,by.x="label",by.y = "activity")


#Average of all columns(except the categorical variables) by ACTIVITY
AVG_activity = aggregate(MSTR_data_3[,-1:-4],list(activity = MSTR_data_3$activity),mean)

#Average of all columns(except the categorical variables) by SUBJECT
AVG_subject = aggregate(MSTR_data_3[,-1:-4],list(subject = MSTR_data_3$subject),mean)

#Average of all columns(except the categorical variables) by both SUBJECT and ACTIVITY
AVG_subact = aggregate(MSTR_data_3[,-1:-4],list(subject = MSTR_data_3$subject,activity = MSTR_data_3$activity),mean)

