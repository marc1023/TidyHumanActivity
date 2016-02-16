##run_analysis.R
##Requires this script to be in the same folder as UCI_HAR_Dataset.

## 1. Merges the training and the test sets to create one data set.

## Merges subject_train and subject_test into subject.
subject_train<-read.table("UCI_HAR_Dataset/train/subject_train.txt")
subject_test<-read.table("UCI_HAR_Dataset/test/subject_test.txt")
subject<-rbind(subject_train,subject_test)

##Renames subject to have descriptive name.
names(subject)<-"Subject Number"
remove(subject_train,subject_test)

## Merges X_train and X_test into X.
X_train<-read.table("UCI_HAR_Dataset/train/X_train.txt")
X_test<-read.table("UCI_HAR_Dataset/test/X_test.txt")
X<-rbind(X_train,X_test)
remove(X_train,X_test)

## Merges y_train and y_test into y.
y_train<-read.table("UCI_HAR_Dataset/train/y_train.txt")
y_test<-read.table("UCI_HAR_Dataset/test/y_test.txt")
y<-rbind(y_train,y_test)
remove(y_train,y_test)

## 2. Extracts only the measurements on the mean and standard deviation for each
## measurement.

features<-read.table("UCI_HAR_Dataset/features.txt")
featureNames<-tolower(features[,2])
indexMeanStd<-grep("*mean\\(\\)*|*std\\(\\)*",featureNames)
## Discards variables in X that do not include a mean or standard deviation
## value.
X<-X[,indexMeanStd]

## 3. Uses descriptive activity names to name the activities in the data set

activityLabels<-read.table("UCI_HAR_Dataset/activity_labels.txt")
activityLabels<-tolower(sub("_"," ",activityLabels$V2))
## Maps the y values (1 to 6) into the corresponding activity name.
Activity<-apply(y, 1, function(i) activityLabels[i])  
Activity<-cbind(Activity)

## 4. Appropriately labels the data set with descriptive variable names.

featureNames<-featureNames[indexMeanStd]

## Systematically renames the variables based on the descriptions explained in
## "UCI_HAR_Dataset\features_info.txt" file.

featureNames<-gsub("-"," ",featureNames)
featureNames<-gsub("bodybody","body",featureNames)

featureNames<-gsub("mean\\(\\) ","mean in ",featureNames)
featureNames<-gsub("mean\\(\\)","mean",featureNames)
featureNames<-gsub("std\\(\\) ","standard deviation in ",featureNames)
featureNames<-gsub("std\\(\\)","standard deviation",featureNames)

featureNames<-gsub("mag"," magnitude's",featureNames)

featureNames<-gsub("tbodyaccjerk","body linear acceleration",featureNames)
featureNames<-gsub("tbodygyrojerk","angular velocity",featureNames)
featureNames<-gsub("fbodyaccjerk","Fourier-transformed body linear acceleration's",featureNames)
featureNames<-gsub("fbodygyrojerk","Fourier-transformed angular velocity's",featureNames)

featureNames<-gsub("tbodyacc","body acceleration",featureNames)
featureNames<-gsub("tbodygyro","body orientation",featureNames)
featureNames<-gsub("fbodyacc","Fourier-transformed body acceleration's",featureNames)
featureNames<-gsub("fbodygyro","Fourier-transformed body orientation's",featureNames)

featureNames<-gsub("tgravityacc","acceleration due to gravity",featureNames)

## Renames X to have descriptive variable names.
names(X)<-featureNames

## Creates a tidy data set tidyDataOriginal
tidyDataOriginal<-cbind(subject,Activity)
tidyDataOriginal<-cbind(tidyData,X)

## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

## Creates an new tidy data based on the tidyDataOriginal by calculating the
## mean for each activity and each subject. 
tidyData<-aggregate(
			tidyDataOriginal[,3:length(tidyDataOriginal)],
			by=list(tidyDataOriginal[,2],tidyDataOriginal[,1]),
			FUN= "mean", na.rm=TRUE
			)
colnames(tidyData)[1]<-"Activity"
colnames(tidyData)[2]<-"Subject Number"

## Writes the new tidy data set to a CSV file.
write.csv(tidyData,"Tidy_Data.csv")