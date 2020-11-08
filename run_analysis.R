##run_analyis R script. Made bu O.Pascual nov-2020
##
# Objective of the script:
#  1. Merges the training and the test sets of the "UCI HAR Dataset" to create one data set.
#  2.Extracts only the measurements on the mean and standard deviation for each measurement.
#  3.Uses descriptive activity names to name the activities in the data set
#  4.Appropriately labels the data set with descriptive variable names.
#  5 Create another tidy data set with the average of each variable for each activity and each subject.
#
# Output: two tidy data sets: one containing the merged data set with appropriate labelling & one withe the average
# of each variable for each activity & subject.
#
##" WARNING: you need to put the compressed file "getdata_projectfiles_UCI HAR Dataset" in you working directory
#
#
# unziping the getdata_projectfiles_UCI file
    unzip("getdata_projectfiles_UCI HAR Dataset.zip")
    library(dplyr)
    library(reshape2)
    
# Reading of txt.files for applicable for both datasets
## features
    features <- read.table("UCI HAR Dataset/features.txt") #load
    features <- rename(features,feature_id=V1, feature=V2) #rename of column names
    selection_vector <- grep("mean\\(\\)|std",features$feature) # capture of only mean() and std() variables for each signal
    variables <- features[selection_vector,2]
## activity labels
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")#load
    activity_labels <- rename(activity_labels,activity_id=V1, activity=V2) #rename of column names

# Reading of txt.files for test dataset
## X_test
    X_test <- read.table("UCI HAR Dataset/test/X_test.txt") #load
    X_test <- select(X_test, selection_vector) # selection of only the mean() and std() values for each measurement
    colnames(X_test) <- variables # rename fo column names with features
    X_test <- mutate(X_test,obs_id=1:2947,.before=1) # adding observation_id

## subject_test
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt") #load
    colnames(subject_test) <- c("subject")# rename fo column names with features
    subject_test <- mutate(subject_test,obs_id=1:2947,.before=1)
    
## activity & observation
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt") #load
    y_test <- rename(y_test,activity_id=V1) #rename of column names
    y_test <- mutate(y_test,obs_id=1:2947,.before=1) # adding observation_id

# Merge of test files:   
## 1. Y_test & activity labels by activity id
    y_test_with_lab <- merge(y_test,activity_labels,by="activity_id", all=T)
    
## 2. y_test_with_lab & X_test by obs_id
    X_test_with_act_lab <- merge(X_test,y_test_with_lab,by="obs_id", all=T)
    X_test_with_act_lab <- select(X_test_with_act_lab, -(activity_id)) # removing activity_id column
    
## 3. X_test_with_act_lab & subject_test by obs_id
    test_data_set <- merge(X_test_with_act_lab,subject_test,by="obs_id", all=T)
    test_data_set <- select(test_data_set, -(obs_id)) # removing obs_id column
    
# Reading of txt.files for train dataset
## X_train
    X_train <- read.table("UCI HAR Dataset/train/X_train.txt") #load
    X_train <- select(X_train, selection_vector) # selection of only the mean() and std() values for each measurement
    colnames(X_train) <- variables# rename fo column names with features
    X_train <- mutate(X_train,obs_id=1:7352,.before=1) # adding observation_id

## subject_train
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt") #load
    colnames(subject_train) <- c("subject")# rename fo column names with features
    subject_train <- mutate(subject_train,obs_id=1:7352,.before=1)

## activity & observation
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt") #load
    y_train <- rename(y_train,activity_id=V1) #rename of column names
    y_train <- mutate(y_train,obs_id=1:7352,.before=1) # adding observation_id

# Merge of train files:   
## 1. Y_train & activity labels by activity id
    y_train_with_lab <- merge(y_train,activity_labels,by="activity_id", all=T)

## 2. y_train_with_lab & X_train by obs_id
    X_train_with_act_lab <- merge(X_train,y_train_with_lab,by="obs_id", all=T)
    X_train_with_act_lab <- select(X_train_with_act_lab, -(activity_id)) # removing activity_id column

## 3. X_train_with_act_lab & subject_train by obs_id
    train_data_set <- merge(X_train_with_act_lab,subject_train,by="obs_id", all=T)
    train_data_set <- select(train_data_set, -(obs_id)) # removing obs_id column    


# Merge of test_data_set & train_data_set - Data set 1 creation
    merged_data_set <- merge(test_data_set,train_data_set, all=TRUE)
    tidy_data_set_1 <- melt(merged_data_set,id=c("subject","activity"),measure.vars = variables )
    tidy_data_set_1 <- arrange(tidy_data_set_1, subject)

## Data set 2 creation
    tidy_data_set_2 <- group_by(tidy_data_set_1,subject, activity,variable) # group by subject, activity and variable
    tidy_data_set_2 <- summarize(tidy_data_set_2, mean=mean(value,na.rm=T))# mean calculation for each group (subject, activity, variable)

#csv file for data set 1
write_csv2(tidy_data_set_1,"data_set_1.csv")
write.table(tidy_data_set_2,"data_set_2.txt", row.names = FALSE)

# remove all intermediate data set
rm(merged_data_set)
rm(train_data_set)
rm(X_train_with_act_lab)
rm(y_train_with_lab)
rm(y_train)
rm(subject_train)
rm(X_train)
rm(test_data_set)
rm(X_test_with_act_lab)
rm(y_test_with_lab)
rm(y_test)
rm(subject_test)
rm(X_test)
rm(features)
rm(activity_labels)
rm(selection_vector)
rm(variables)
