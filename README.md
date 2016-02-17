# TidyHumanActivity
Getting and Cleaning Data Course Project

This repository was done in partial fulfillment of the "Getting and Cleaning
Data Course" offered by Johns Hopkins University. The data set contained in
"UCI_HAR_Dataset" was provided. This data set represent data collected from the
accelerometers from the Samsung Galaxy S smartphone. A full description is
available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.r is the script that processes the data set according to the
project requirements. run_analysis.R generates the "Tidy_Data.csv" in five
steps:

1. It merges the training and the test sets to create one data set.
2. It selects the measurements on the mean and standard deviation for each 
measurement and discards the rest.
3. It renames the activities to something descriptive.
4. It renames the data set with descriptive variable names.
5. From the data set in step 4, it calculates average of each variable for each 
activity and each subject. Then, it writes it to a CSV file.