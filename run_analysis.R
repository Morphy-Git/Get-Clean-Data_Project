library(readr)
library(stringr)
library(data.table)

# download file, unzip zip folder
if(!file.exists("Cleanweek4")){dir.create("Cleanweek4")}
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"./Cleanweek4/project.zip",method="curl")
unzip("./Cleanweek4/project.zip",exdir="./Cleanweek4")
list.files("./Cleanweek4")
setwd("./Cleanweek4/UCI HAR Dataset")

# Merges the training and the test sets to create one data set.
list.files()
act_label<-read_table("./activity_labels.txt",col_names = FALSE)
feature<-read_delim("./features.txt",delim=" ",col_names = FALSE)
subject_train<-fread("./train/subject_train.txt")
X_train<-fread("./train/X_train.txt")
Y_train<-fread("./train/y_train.txt")
subject_test<-fread("./test/subject_test.txt")
X_test<-fread("./test/X_test.txt")
Y_test<-fread("./test/y_test.txt")
train<-cbind(subject_train,Y_train,X_train)
test<-cbind(subject_test,Y_test,X_test)
train_test<-rbind(train,test)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std<-subset(train_test,select=c(TRUE,TRUE,grepl("[Mm]ean|std",feature$X2)))

# Uses descriptive activity names to name the activities in the data set; also the subject and activity colums
names(mean_std)<-c("Subject","Activity",grep("[Mm]ean|std",feature$X2,value=TRUE))

# Appropriately labels the data set with descriptive variable names
names(mean_std)<-gsub("-mean","Mean",names(mean_std))
names(mean_std)<-gsub("\\(\\)","",names(mean_std))
names(mean_std)<-gsub("-std","STD",names(mean_std))
names(mean_std)<-gsub("^t","Time",names(mean_std))
names(mean_std)<-gsub("^f","Freq",names(mean_std))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
AvgofGrouped<-mean_std %>% group_by(Subject,Activity) %>% summarize_all(mean)
write.csv(AvgofGrouped,"AvgofGrouped.csv",row.names=FALSE)
