Tidy_Data Code Book

This codebook explains how the "Tidy_Data.csv" data set was generated from the
files inside the "UCI_HAR_Dataset". It also explains the modification done on
the features listed in the "UCI_HAR_Dataset\features_info.txt" file.

Contents
A. Variables
B. run_analysis.R

A. Variables

1. Activity - Type of activity from a set of six activties: walking, walking 
upstairs, walking downstairs, sitting, standing, and laying.
2. Subject - Subject number ranging from 1 to 30 representing 30 annonymized
individuals.

Features 3 to 68 are the means of the mean and standard deviation features
listed in "UCI_HAR_Dataset\features_info.txt". Values range from 1 to -1. For
an explanation of the following symbols, please check "UCI_HAR_Dataset\features_
info.txt."
3. Mean of tBodyAcc-mean()-X
4. Mean of tBodyAcc-mean()-Y
5. Mean of tBodyAcc-mean()-Z
6. Mean of tBodyAcc-std()-X
7. Mean of tBodyAcc-std()-Y
8. Mean of tBodyAcc-std()-Z
9. Mean of 	tGravityAcc-mean()-X
10. Mean of tGravityAcc-mean()-Y
11. Mean of tGravityAcc-mean()-Z
12. Mean of tGravityAcc-std()-X
13. Mean of tGravityAcc-std()-Y
14. Mean of tGravityAcc-std()-Z
15. Mean of tBodyAccJerk-mean()-X
16. Mean of tBodyAccJerk-mean()-Y
17. Mean of tBodyAccJerk-mean()-Z
18. Mean of tBodyAccJerk-std()-X
19. Mean of tBodyAccJerk-std()-Y
20. Mean of tBodyAccJerk-std()-Z
21. Mean of tBodyGyro-mean()-X
22. Mean of tBodyGyro-mean()-Y
23. Mean of tBodyGyro-mean()-Z
24. Mean of tBodyGyro-std()-X
25. Mean of tBodyGyro-std()-Y
26. Mean of tBodyGyro-std()-Z
27. Mean of tBodyGyroJerk-mean()-X
28. Mean of tBodyGyroJerk-mean()-Y
29. Mean of tBodyGyroJerk-mean()-Z
30. Mean of tBodyGyroJerk-std()-X
31. Mean of tBodyGyroJerk-std()-Y
32. Mean of tBodyGyroJerk-std()-Z
33. Mean of tBodyAccMag-mean()
34. Mean of tBodyAccMag-std()
35. Mean of tGravityAccMag-mean()
36. Mean of tGravityAccMag-std()
37. Mean of tBodyAccJerkMag-mean()
38. Mean of tBodyAccJerkMag-std()
39. Mean of tBodyGyroMag-mean()
40. Mean of tBodyGyroMag-std()
41. Mean of tBodyGyroJerkMag-mean()
42. Mean of tBodyGyroJerkMag-std()
43. Mean of fBodyAcc-mean()-X
44. Mean of fBodyAcc-mean()-Y
45. Mean of fBodyAcc-mean()-Z
46. Mean of fBodyAcc-std()-X
47. Mean of fBodyAcc-std()-Y
48. Mean of fBodyAcc-std()-Z
49. Mean of fBodyAccJerk-mean()-X
50. Mean of fBodyAccJerk-mean()-Y
51. Mean of fBodyAccJerk-mean()-Z
52. Mean of fBodyAccJerk-std()-X
53. Mean of fBodyAccJerk-std()-Y
54. Mean of fBodyAccJerk-std()-Z
55. Mean of fBodyGyro-mean()-X
56. Mean of fBodyGyro-mean()-Y
57. Mean of fBodyGyro-mean()-Z
58. Mean of fBodyGyro-std()-X
59. Mean of fBodyGyro-std()-Y
60. Mean of fBodyGyro-std()-Z
61. Mean of fBodyAccMag-mean()
62. Mean of fBodyAccMag-std()
63. Mean of fBodyBodyAccJerkMag-mean()
64. Mean of fBodyBodyAccJerkMag-std()
65. Mean of fBodyBodyGyroMag-mean()
66. Mean of fBodyBodyGyroMag-std()
67. Mean of fBodyBodyGyroJerkMag-mean()
68. Mean of fBodyBodyGyroJerkMag-std()

B. run_analysis.R

run_analysis.R generates "Tidy_Data.csv" from the "UCI_HAR_Dataset." To run
run_analysis.R, it should be placed in the same folder as the "UCI_HAR_Dataset."
Set your working directory to that folder.

run_analysis.R generates the "Tidy_Data.csv" in five steps:

1. It merges the training and the test sets to create one data set.
2. It selects the measurements on the mean and standard deviation for each 
measurement and discards the rest.
3. It renames the activities to something descriptive.
4. It renames the data set with descriptive variable names.
5. From the data set in step 4, calculates average of each variable for each 
activity and each subject. Then, it writes it to a CSV file.
