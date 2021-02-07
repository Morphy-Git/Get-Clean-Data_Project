# Get-Clean-Data_Project Peer-graded Assignment

## Original Data Source: Human Activity Recognition Using Smartphones Dataset, Version 1.0 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

## The dataset includes the following files:

- ‘Codebook.md’: The code book that describes the variables and any transformations or work that I performed to clean up the data.

- ‘run_analysis.R’：The R scripts file used to process data as required in the assingment (comments included to explain th purpose of each chunk of the code):
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- 'AvgofGrouped.csv': The comma-seperated values file created as a independent tidy data set as required by the 5th requirement in the assignment. It includes the average of each variable for each activity and each subject.
