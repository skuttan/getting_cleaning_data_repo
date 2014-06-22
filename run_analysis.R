# reading all the train data - x,y,subject
x_train <- read.table("train\\X_train.txt")
y_train <- read.table("train\\Y_train.txt")
s_train <- read.table("train\\subject_train.txt")

# reading all the test data - x,y,subject
y_test <- read.table("test\\Y_test.txt")
x_test <- read.table("test\\X_test.txt")
s_test <- read.table("test\\subject_test.txt")


####### ---- 1. Merges the training and the test sets to create one data set. ----------
######----------------------------------------------------------------------------------

# combining training and test into one consolidated set
train_test <- rbind(new_train,new_test)

####### ---- 2. Extracts only the measurements on the mean and standard deviation for each measurement. ----------
######----------------------------------------------------------------------------------

# extracting the columns that deal with mean and std deviation
mean_std_train_test <- train_test[,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,
227,228,
240,241,
254,255,266,267,268,269,270,271,
294,295,296,
345,346,347,348,349,350,
373,374,375,
424,425,426,427,428,429,
452,452,454,
503,504,
513,
516,
526,
529,
539,
542,
552,
555,556,557,558,559,560,561
)]

####### ---- 3. Uses descriptive activity names to name the activities in the data set ----------
######----------------------------------------------------------------------------------

####### ---- 4. Appropriately labels the data set with descriptive activity names.  ----------
######----------------------------------------------------------------------------------


# column names get assigned "v.XXX" where XXX indicates the feature number
# split the column names to get the XXX number and fetch the corresponding feature name 
# assign the feature name as the column name.
feat <- read.table("features.txt")
colnames(mean_std_train_test) <- sapply(colnames(mean_std_train_test), function(z) feat[as.numeric(unlist(strsplit(z,"V"))[2]),2])

# add the Activity and Subject information from both train and test as separate columns
mstt <- cbind(mean_std_train_test,rbind(y_train,y_test),rbind(s_train,s_test))

# setting column names for Activity and Subject columns
colnames(mstt) <- c(colnames(mean_std_train_test),"Activity","Subject")

# Using regex and string manipulations to transform the column names (with feature names)
# remove "(),-" and convert some lower cases to Camel case for better readability
a <- sapply(colnames(mstt), function(z) gsub("[\\(\\),\\-]", "", z))
b <- sapply(a,function(z) sub("mean","Mean",z))
b <- sapply(b,function(z) sub("std","Std",z))
b <- sapply(b,function(z) sub("gravity","Gravity",z))

colnames(mstt) <- b

# Converting the Activity number to Activity names.
al <- read.table("activity_labels.txt")
mstt$"Activity" <- al[mstt$"Activity",2]

####### ---- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.   ----------
######----------------------------------------------------------------------------------

# Splitting the Data set based on combination of Activity and Subject to 180 separate sets
splitDataSet <- split(mstt,list(as.factor(mstt$"Activity"), as.factor(mstt$"Subject")))

# Applying mean for each column of each of the 180 sets
# The tidy data set will have the features as rows and the activity and subject combination 
# as columns
tidyDataSet <- sapply(splitDataSet, function(x) sapply(x,mean))

# Cleaining up to remove the entries for Activity number and Subject
# These are part of the column names 
tidyDataSet <- tidyDataSet[-(84:85),]

# Writing to tab separated txt file
write.table(tidyDataSet,"tidyDataSet.txt", sep="\t",col.names=TRUE,row.names=TRUE)
