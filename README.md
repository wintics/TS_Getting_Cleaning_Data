
----------------------------------------
Getting and Cleaning Data Course Project
----------------------------------------
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

------------------------------
Project includes files: 
------------------------------
- 'README.md'
- 'run_analysis.R' : code to perfom raw data to tidy data
- 'Codebook.pdf': about data 
- raw data for this project:   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

------------------------------
About raw data for assignment:
------------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

------------------------------
Used data files from raw data:
------------------------------
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample (trainig set). 

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample (test set). 

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'activity_labels.txt': Activity codes and labels

- 'features.txt: Measurements labels

------------
Output file:
------------

- 'tidy_data.txt' : tidy data from input data (after running code 'run_analysis.R')

----------------------------------------------
What does the code 'run_analysis.R' do:
-----------------------------------------------

1. reads data from txt-files (list in 'Used data files'-section),
2. puts together test data and training data by columns,
3. merges training and test data into one dataset by rows, 
3. extracts only the measurements on the mean and standard deviation for each measurement by 
selecting columns which have "mean()" or "std()" in names,
4. substitutes activity codes in dataset to activity labels from activity_labels file,
5. renames this column accordingly, 
6. changes the order of 2 first columns, 
7. calculates mean of each measurement variable for each activity and each subject,
8. writes result data in to text file "tidy_data.txt" in working directory


At the beginning data are in 6 data files, after merging together training and test data there are several observations of variable per person and activity in dataset, but after step 7 data are tidy because:  
	-  each measured variable is in one column
	-  each different observation of that variable per person and activity is in different row
	-  data are in one table 


-------------------------------
To use code 'run_analysis.R':
-------------------------------

1. Download data and extract from zip-file, 
2. Read information about data (optional),
3. Set working directory to 'UCI HAR Dataset' (which is created by unzipping files)
4. Run the code of 'run_analysis.R' in that directory

NB! 'run_analysis.R' uses library 'dplyr'.
