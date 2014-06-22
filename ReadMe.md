# Code book for Course Project - Getting and Cleaning Data

This codebook describes how the different operations performed on the data set to arrive at the final tidy data set

This also provides a description of how to read the final tidy data set.

#### Read the train and test data

First we read the train and test data for main data (x), activity mapping (y) and subject mapping (s)
Variables are
* x_train
* y_train
* s_train
* x_test
* y_test
* s_test

### 1. Merges the training and the test sets to create one data set.

Combine the train and test data measurement using rbind
We'll add the activity and subject mapping later

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Look through the feature.txt file and identify the feature numbers that are associated with Mean or Standard Deviation
This was an easier way compared to doing a regex on the feature names with mean or std

With the identified feature numbers, filter out the data set to a new data set called mean_std_train_test

### 3. Uses descriptive activity names to name the activities in the data set

#### Labeling the Features variables

Column names get assigned "v.XXX" where XXX indicates the feature number
Split the column names to get the XXX number and fetch the corresponding feature name 
Assign the feature name as the column name.

Use sapply and split 
Using regex and string manipulations to transform the column names (with feature names) remove "(),-" and convert some lower cases to Camel case for better readability

#### Labeling the Activity numbers
Read the activity_labels.txt file to get the activity names and map accordingly in the data set.

### 4. Appropriately labels the data set with descriptive activity names.

The following are the feature names used


1 tBodyAccMeanX - Mean of time domain signal for BodyAcc on X Axis

2 tBodyAccMeanY - Mean of time domain signal for BodyAcc on Y Axis

3 tBodyAccMeanZ - Mean of time domain signal for BodyAcc on Z Axis

4 tBodyAccStdX - Std dev of time domain signal for BodyAcc on X Axis

5 tBodyAccStdY - Std dev of time domain signal for BodyAcc on Y Axis

6 tBodyAccStdZ - Std dev of time domain signal for BodyAcc on Z Axis

7 tGravityAccMeanX - Mean of time domain signal for GravityAcc on X Axis

8 tGravityAccMeanY - Mean of time domain signal for GravityAcc on Y Axis

9 tGravityAccMeanZ - Mean of time domain signal for GravityAcc on Z Axis

10 tGravityAccStdX - Std Dev of time domain signal for GravityAcc on X Axis

11 tGravityAccStdY - Std Dev of time domain signal for GravityAcc on Y Axis

12 tGravityAccStdZ - Std Dev of time domain signal for GravityAcc on Z Axis

13 tBodyAccJerkMeanX - Mean of time domain signal for BodyAccJerk on X Axis

14 tBodyAccJerkMeanY - Mean of time domain signal for BodyAccJerk on Y Axis

15 tBodyAccJerkMeanZ - Mean of time domain signal for BodyAccJerk on Z Axis

16 tBodyAccJerkStdX - Std Dev of time domain signal for BodyAccJerk on X Axis

17 tBodyAccJerkStdY - Std Dev of time domain signal for BodyAccJerk on Y Axis

18 tBodyAccJerkStdZ - Std Dev of time domain signal for BodyAccJerk on Z Axis

19 tBodyGyroMeanX - Mean of time domain signal for BodyGyro on X Axis

20 tBodyGyroMeanY - Mean of time domain signal for BodyGyro on Y Axis

21 tBodyGyroMeanZ - Mean of time domain signal for BodyGyro on Z Axis

22 tBodyGyroStdX - Std Dev of time domain signal for BodyGyro on X Axis

23 tBodyGyroStdY - Std Dev of time domain signal for BodyGyro on Y Axis

24 tBodyGyroStdZ - Std Dev of time domain signal for BodyGyro on Z Axis

25 tBodyGyroJerkMeanX - Mean of time domain signal for BodyGyroJerk on X Axis

26 tBodyGyroJerkMeanY - Mean of time domain signal for BodyGyroJerk on Y Axis

27 tBodyGyroJerkMeanZ - Mean of time domain signal for BodyGyroJerk on Z Axis

28 tBodyGyroJerkStdX - Std dev of time domain signal for BodyGyroJerk on X Axis

29 tBodyGyroJerkStdY - Std dev of time domain signal for BodyGyroJerk on Y Axis

30 tBodyGyroJerkStdZ - Std dev of time domain signal for BodyGyroJerk on Z Axis

31 tBodyAccMagMean - Mean of time doman signal for BodyAccMag

32 tBodyAccMagStd - Std Dev of time domain signal for BodyAccMag

33 tGravityAccMagMean - Mean of time doman signal for GravtyAccMag

34 tGravityAccMagStd - Std Dev of time doman signal for GravityAccMag

35 tBodyAccJerkMagMean - Mean of time doman signal for BodyAccjerkMag

36 tBodyAccJerkMagStd - Std Dev of time doman signal for BodyAccjerkMag

37 tBodyGyroMagMean - Mean of time doman signal for BodyGyroMag

38 tBodyGyroMagStd - Std Dev of time doman signal for BodyGyroMag

39 tBodyGyroJerkMagStd - Mean of time doman signal for BodyGyroJerkMag

40 tBodyGyroJerkMagmad - Mean of time doman signal for BodyGyroJerkMagmad

41 fBodyAccMeanX - Mean of frequency domain signal for BodyAcc on X Axis

42 fBodyAccMeanY - Mean of frequency domain signal for BodyAcc on Y Axis

43 fBodyAccMeanZ - Mean of frequency domain signal for BodyAcc on Z Axis

44 fBodyAccStdX - Std Dev of frequency domain signal for BodyAcc on X Axis

45 fBodyAccStdY - Std Dev of frequency domain signal for BodyAcc on Y Axis

46 fBodyAccStdZ - Std Dev of frequency domain signal for BodyAcc on Z Axis

47 fBodyAccMeanFreqX - Mean of frequency domain signal for BodyAccFreq on X Axis

48 fBodyAccMeanFreqY - Mean of frequency domain signal for BodyAccFreq on Y Axis

49 fBodyAccMeanFreqZ - Mean of frequency domain signal for BodyAccFreq on Z Axis

50 fBodyAccJerkMeanX - Mean of frequency domain signal for BodyAccJerk on X Axis

51 fBodyAccJerkMeanY - Mean of frequency domain signal for BodyAccJerk on Y Axis

52 fBodyAccJerkMeanZ - Mean of frequency domain signal for BodyAccJerk on Z Axis

53 fBodyAccJerkStdX - Std Dev of frequency domain signal for BodyAccJerk on X Axis

54 fBodyAccJerkStdY - Std Dev of frequency domain signal for BodyAccJerk on Y Axis

55 fBodyAccJerkStdZ - Std Dev of frequency domain signal for BodyAccJerk on Z Axis

56 fBodyAccJerkMeanFreqX - Mean of frequency domain signal for BodyAccJerkFreq on X Axis

57 fBodyAccJerkMeanFreqY - Mean of frequency domain signal for BodyAccJerkFreq on Y Axis

58 fBodyAccJerkMeanFreqZ - Mean of frequency domain signal for BodyAccJerkFreq on Z Axis

59 fBodyGyroMeanX - Mean of frequency domain signal for BodyGyro on X Axis

60 fBodyGyroMeanY - Mean of frequency domain signal for BodyGyro on Y Axis

61 fBodyGyroMeanZ - Mean of frequency domain signal for BodyGyro on Z Axis

62 fBodyGyroStdX - Std Dev of frequency domain signal for BodyGyro on X Axis

63 fBodyGyroStdY - Std Dev of frequency domain signal for BodyGyro on Y Axis

64 fBodyGyroStdZ - Std Dev of frequency domain signal for BodyGyro on Z Axis

65 fBodyGyroMeanFreqX - Mean of frequency domain signal for BodyGyroFreq on X Axis

66 fBodyGyroMeanFreqX - Mean of frequency domain signal for BodyGyroFreq on Y Axis

67 fBodyGyroMeanFreqZ - Mean of frequency domain signal for BodyGyroFreq on Z Axis

68 fBodyAccMagMean - Mean of frequency domain signal for BodyAccMag

69 fBodyAccMagStd - Std Dev of frequency domain signal for BodyAccMag

70 fBodyAccMagMeanFreq - Mean of frequency domain signal for BodyAccMagFreq

71 fBodyBodyAccJerkMagMean - Mean of frequency domain signal for BodyAccJerkMag

72 fBodyBodyAccJerkMagMeanFreq - Mean of frequency domain signal for BodyAccJerkMagFreq

73 fBodyBodyGyroMagMean - Mean of frequency domain signal for BodyGyroMag

74 fBodyBodyGyroMagMeanFreq - Mean of frequency domain signal for BodyGyroMagFreq

75 fBodyBodyGyroJerkMagMean - Mean of frequency domain signal for BodyGyroJerkMag

76 fBodyBodyGyroJerkMagMeanFreq - Mean of frequency domain signal for BodyGyroJerkMagFreq

77 angletBodyAccMeanGravity - Mean BodyAccGravity measured in angle()

78 angletBodyAccJerkMeanGravityMean - Mean BodyAccJerkGravity measured in angle()

79 angletBodyGyroMeanGravityMean - Mean BodyAccGyroGravity measured in angle()

80 angletBodyGyroJerkMeanGravityMean - Mean BodyGyroJerkGravity measured in angle()

81 angleXGravityMean - Mean Gravity measured in angle() for X axis

82 angleYGravityMean - Mean Gravity measured in angle() for Y axis

83 angleZGravityMean - Mean Gravity measured in angle() for Z axis


### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

First split the above created data set based on combination of Activity and Subject to 180 separate sets

Applying mean for each column of each of the 180 sets
The tidy data set will have the features as rows and the activity and subject combination as columns
Use nexted sapply for each column of each data set in the main data set.

Do some clean up to remove the activity and subject entries

Finally write the tidy data set to a file tab separated file - "tidyDataSet.txt"
