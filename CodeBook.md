The CodeBook file for “Getting & Cleaning data” project
-------------------------------------------------------

The CodeBook file describes the variable and the data of 2 data sets
required

data set 1:
===========

-   Structure: 4 columns and 679735 rows. Each row represent value
    captured for each of the requested variables (66 variables), for one
    subject and one activity.

-   4 columns: subject, activity, variables, value

    Subject: the subject who performed the activity. Its range is from 1
    to 30.

    Activity: 6 activities are monitored and can be found in the data
    set: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
    STANDING, LAYING

    Variables:66 variables are presented. For each feature below, the
    mean and the standard deviation are captured (for feature with XYZ,
    the mean and std are given for each axis (X,Y, Z))

          tBodyAcc-XYZ
          tGravityAcc-XYZ
          tBodyAccJerk-XYZ
          tBodyGyro-XYZ
          tBodyGyroJerk-XYZ
          tBodyAccMag
          tGravityAccMag
          tBodyAccJerkMag
          tBodyGyroMag
          tBodyGyroJerkMag
          fBodyAcc-XYZ
          fBodyAccJerk-XYZ
          fBodyGyro-XYZ
          fBodyAccMag
          fBodyAccJerkMag
          fBodyGyroMag
          fBodyGyroJerkMag

    Value: a value captured for each of the variable, for a combination
    of a subject and an actvity.

data set 2:
===========

-   Structure: 4 columns and 11880 rows. Each row represent the mean of
    one 66 variables of the data set 1, for one subject and one
    activity.

-   4 columns: subject, activity, variables, mean

    Subject: the subject who performed the activity. Its range is from 1
    to 30.

    Activity: 6 activities are monitored and can be found in the data
    set: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
    STANDING, LAYING

    Variables:66 variables are presented. For each feature below, the
    mean and the standard deviation are captured (for feature with XYZ,
    the mean and std are given for each axis (X,Y, Z))

          tBodyAcc-XYZ
          tGravityAcc-XYZ
          tBodyAccJerk-XYZ
          tBodyGyro-XYZ
          tBodyGyroJerk-XYZ
          tBodyAccMag
          tGravityAccMag
          tBodyAccJerkMag
          tBodyGyroMag
          tBodyGyroJerkMag
          fBodyAcc-XYZ
          fBodyAccJerk-XYZ
          fBodyGyro-XYZ
          fBodyAccMag
          fBodyAccJerkMag
          fBodyGyroMag
          fBodyGyroJerkMag

    mean: the mean of the values of each 66 variables of the data set 1,
    for one subject and one activity
