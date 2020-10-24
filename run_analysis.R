##########################################
# Assumed, that data files are downloaded and unpacked
# working directory for this code is 'UCI HAR Dataset' 
# 
###########################################
library(dplyr)

# Step 0. Loading data

s_test<-read.table("./test/subject_test.txt")
X_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/y_test.txt")

s_train<-read.table("./train/subject_train.txt")
X_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")

features<-read.table("features.txt")
activ<-read.table("activity_labels.txt")


#	Step 1. Merging the training and the test sets to new data set.

## put together test data and training data by columns (all have the same number of rows)

test<-cbind(s_test,y_test,X_test)
train<-cbind(s_train,y_train,X_train)

## put together training and test data by rows (both have the same column names)

all<-rbind(train,test)

## as dataframe 'all' has now several column names 'V1', we change names
names(all)<-c("subjectID","act_code",features$V2)


# Step 2. Extracting the measurements on the mean and standard deviation for each measurement.

## selecting 2 first columns and from measurement only these columns, which names contain 
## either "mean()" or "std()"

part<-select(all, "subjectID","act_code",contains("mean()"),contains("std()"))

# Step 3. Uses descriptive activity names to name the activities in the data set

## substituting activity codes to activity labels (code of activity matches with index)  

lablelist<-activ$V2
part[,2]<-lablelist[part[,2]]


#	Step 4. Appropriately labels the data set with descriptive variable names.
## renaming 2.column as the column content has changed (code->label)

names(part)[2] <- "activity"


#	Step 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject

## 'subjectID' and 'activity' columns change there places for future output
## grouping by variables 'activity' and 'subjectID'
## calculating mean (grouping variables are always excluded from modification)

new <- relocate(part,"activity",.before="subjectID")   
new<-new %>% group_by_("activity","subjectID") %>% summarise_all(mean)


#Write new tidy dataset in a txt-file in working directory

write.table(new, "tidy_data.txt", row.name=FALSE)