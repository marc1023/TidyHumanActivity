## 1. Merges the training and the test sets to create one data set.
subject_train<-read.table("UCI_HAR_Dataset/train/subject_train.txt")
subject_test<-read.table("UCI_HAR_Dataset/test/subject_test.txt")
subject<-rbind(subject_train,subject_test)
remove(subject_train,subject_test)

X_train<-read.table("UCI_HAR_Dataset/train/X_train.txt")
X_test<-read.table("UCI_HAR_Dataset/test/X_test.txt")
X<-rbind(X_train,X_test)
remove(X_train,X_test)

y_train<-read.table("UCI_HAR_Dataset/train/y_train.txt")
y_test<-read.table("UCI_HAR_Dataset/test/y_test.txt")
y<-rbind(y_train,y_test)
remove(y_train,y_test)

## 2. Extracts only the measurements on the mean and standard deviation for each
## measurement.

features<-read.table("UCI_HAR_Dataset/features.txt")
featureNames<-tolower(features[,2])
indexMeanStd<-grep("*mean*|*std*",featureNames)
X<-X[,indexMeanStd]

## 3. Uses descriptive activity names to name the activities in the data set

activityLabels<-read.table("UCI_HAR_Dataset/activity_labels.txt")
activityLabels<-tolower(sub("_"," ",activityLabels$V2))
descriptiveNames<-apply(y, 1, function(i) activityLabels[i])  
descriptiveNames<-unname(descriptiveNames)

## 4. Appropriately labels the data set with descriptive variable names.



## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.