# Codebook of Assignment

## The run_analysis.R script performs the data preparation suggested in the assignement instructions.

## Data Source 
- A full description is available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
- Here are the data for the project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

## Data process in 5 steps
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## List of Variables in final dataset (88 variables)
"Subject" indicates the subject numebr in exp;
"Activity" indicates the Activity the subject takes in exp:
  1 WALKING
  2 WALKING_UPSTAIRS
  3 WALKING_DOWNSTAIRS
  4 SITTING
  5 STANDING
  6 LAYING
The other 86 variables are the mean of measurements of the motion (find the explanation of each from the aforementioned link)

[1] "Subject"                              "Activity"                             "TimeBodyAccMean-X"                   
[4] "TimeBodyAccMean-Y"                    "TimeBodyAccMean-Z"                    "TimeBodyAccSTD-X"                    
[7] "TimeBodyAccSTD-Y"                     "TimeBodyAccSTD-Z"                     "TimeGravityAccMean-X"                
[10] "TimeGravityAccMean-Y"                 "TimeGravityAccMean-Z"                 "TimeGravityAccSTD-X"                 
[13] "TimeGravityAccSTD-Y"                  "TimeGravityAccSTD-Z"                  "TimeBodyAccJerkMean-X"               
[16] "TimeBodyAccJerkMean-Y"                "TimeBodyAccJerkMean-Z"                "TimeBodyAccJerkSTD-X"                
[19] "TimeBodyAccJerkSTD-Y"                 "TimeBodyAccJerkSTD-Z"                 "TimeBodyGyroMean-X"                  
[22] "TimeBodyGyroMean-Y"                   "TimeBodyGyroMean-Z"                   "TimeBodyGyroSTD-X"                   
[25] "TimeBodyGyroSTD-Y"                    "TimeBodyGyroSTD-Z"                    "TimeBodyGyroJerkMean-X"              
[28] "TimeBodyGyroJerkMean-Y"               "TimeBodyGyroJerkMean-Z"               "TimeBodyGyroJerkSTD-X"               
[31] "TimeBodyGyroJerkSTD-Y"                "TimeBodyGyroJerkSTD-Z"                "TimeBodyAccMagMean"                  
[34] "TimeBodyAccMagSTD"                    "TimeGravityAccMagMean"                "TimeGravityAccMagSTD"                
[37] "TimeBodyAccJerkMagMean"               "TimeBodyAccJerkMagSTD"                "TimeBodyGyroMagMean"                 
[40] "TimeBodyGyroMagSTD"                   "TimeBodyGyroJerkMagMean"              "TimeBodyGyroJerkMagSTD"              
[43] "FreqBodyAccMean-X"                    "FreqBodyAccMean-Y"                    "FreqBodyAccMean-Z"                   
[46] "FreqBodyAccSTD-X"                     "FreqBodyAccSTD-Y"                     "FreqBodyAccSTD-Z"                    
[49] "FreqBodyAccMeanFreq-X"                "FreqBodyAccMeanFreq-Y"                "FreqBodyAccMeanFreq-Z"               
[52] "FreqBodyAccJerkMean-X"                "FreqBodyAccJerkMean-Y"                "FreqBodyAccJerkMean-Z"               
[55] "FreqBodyAccJerkSTD-X"                 "FreqBodyAccJerkSTD-Y"                 "FreqBodyAccJerkSTD-Z"                
[58] "FreqBodyAccJerkMeanFreq-X"            "FreqBodyAccJerkMeanFreq-Y"            "FreqBodyAccJerkMeanFreq-Z"           
[61] "FreqBodyGyroMean-X"                   "FreqBodyGyroMean-Y"                   "FreqBodyGyroMean-Z"                  
[64] "FreqBodyGyroSTD-X"                    "FreqBodyGyroSTD-Y"                    "FreqBodyGyroSTD-Z"                   
[67] "FreqBodyGyroMeanFreq-X"               "FreqBodyGyroMeanFreq-Y"               "FreqBodyGyroMeanFreq-Z"              
[70] "FreqBodyAccMagMean"                   "FreqBodyAccMagSTD"                    "FreqBodyAccMagMeanFreq"              
[73] "FreqBodyBodyAccJerkMagMean"           "FreqBodyBodyAccJerkMagSTD"            "FreqBodyBodyAccJerkMagMeanFreq"      
[76] "FreqBodyBodyGyroMagMean"              "FreqBodyBodyGyroMagSTD"               "FreqBodyBodyGyroMagMeanFreq"         
[79] "FreqBodyBodyGyroJerkMagMean"          "FreqBodyBodyGyroJerkMagSTD"           "FreqBodyBodyGyroJerkMagMeanFreq"     
[82] "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"    
[85] "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                 "angle(Y,gravityMean)"                
[88] "angle(Z,gravityMean)" 

## Detailed data process steps
- Load packages: dplyr, data.table, readr 
- Dataset downloaded and extracted under the folder called UCI HAR Dataset
- Read and Assign activity variable, tran and test datasets (features.txt, X_train,y_train; X_test, y_test) to variables
  - act_label<-activity_labels.txt : 6 rows, 2 columns
 List of activity performed in the exp and corresponding numebr code
  - subject_train<-subject_train.txt and subject_test.txt: 7352 rows, 1 column; 2947 rows, 1 column
 indicating the number of subjects assgined to training cohort (21) vs test cohort(9)
  - feature<-features.txt 561 rows, 2 column
 indicating 561 activity measurements
  - X_train <- X_train.txt: 7352 rows, 561 columns 
  - Y_train <- y_train.txt: 7352 rows, 1 columns 
  - X_test <- X_test.txt: 2947 rows, 561 columns 
  - Y_test <- y_test.txt: 2947 rows, 1 columns
  contains recorded features(X) & activity code(Y) of train and test data 
- Merges the training and the test sets to create one data set
  - train(7352 rows, 563 columns) is created by merging subject_train,Y_train and X_train by column
  - test(2947 rows, 563 columns) is created by merging subject_test,Y_test,X_test by column
  - train_test (10299rows, 563 columns) is created by merging train & test by rows
- Extracts only the measurements on the mean and standard deviation for each measurement
mean_std (10299 rows, 88 columns) is created by subsetting train_test with "Subject"", "Activity" and measurements on the mean and standard deviation (std) for each measurement
- Uses descriptive activity names to name the activities in the data set
mean_std is renamed with "Subject"", "Activity" and corresponding varibled names from names(feature) with grep() function
- Appropriately labels the data set with descriptive variable names
  - "-mean" or "-std" -> Mean or STD
  - () was deleted
  - "t" or "f" in the beginning -> "Time" or "Freq"
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each   activity and each subject
AvgofGrouped (180 rows, 88 columns) is created grouping mean_std by "Subject"", "Activiy"" and then sumarized as required
Save the datatable as AvgofGrouped.csv file.
