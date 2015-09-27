The GitHub Repo Contains:
======================================

- A script which generates the Tidy Dataset

- A CODEBOOK.md file describing the activities performed in the above script

- A README.md file, this file

======================================
The Tidy Dataset contains 180 observations (rows) and 81 variables (columns) in fixed width format delimited by [SPACE].

Each record contains:
======================================
- An identifier of the subject who carried out the experiment.

- A level containing the various activities performed by the Subjects.

- Mean of 
	- Mean of Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Mean of Standard deviation of Triaxial Angular velocity from the gyroscope. 

Format of the various fields within the Tidy Dataset
======================================

Column Name			|Start Position |Column Width
SubjectId						1	|2
ActivityName					4	|18
tBodyAcc-mean-X					23	|9
tBodyAcc-mean-Y					33	|12
tBodyAcc-mean-Z					46	|11
tBodyAcc-std-X					58	|10
tBodyAcc-std-Y					69	|11
tBodyAcc-std-Z					81	|10
tGravityAcc-mean-X				92	|10
tGravityAcc-mean-Y				103	|13
tGravityAcc-mean-Z				117	|13
tGravityAcc-std-X				131	|10
tGravityAcc-std-Y				142	|10
tGravityAcc-std-Z				153	|10
tBodyAccJerk-mean-X				164	|10
tBodyAccJerk-mean-Y				175	|13
tBodyAccJerk-mean-Z				189	|13
tBodyAccJerk-std-X				203	|10
tBodyAccJerk-std-Y				214	|10
tBodyAccJerk-std-Z				225	|10
tBodyGyro-mean-X				236	|13
tBodyGyro-mean-Y				250	|11
tBodyGyro-mean-Z				262	|10
tBodyGyro-std-X					273	|10
tBodyGyro-std-Y					284	|10
tBodyGyro-std-Z					295	|10
tBodyGyroJerk-mean-X			306	|11
tBodyGyroJerk-mean-Y			318	|12
tBodyGyroJerk-mean-Z			331	|11
tBodyGyroJerk-std-X				343	|10
tBodyGyroJerk-std-Y				354	|10
tBodyGyroJerk-std-Z				365	|10
tBodyAccMag-mean				376	|11
tBodyAccMag-std					388	|10
tGravityAccMag-mean				399	|11
tGravityAccMag-std				411	|10
tBodyAccJerkMag-mean			422	|10
tBodyAccJerkMag-std				433	|10
tBodyGyroMag-mean				444	|10
tBodyGyroMag-std				455	|10
tBodyGyroJerkMag-mean			466	|10
tBodyGyroJerkMag-std			477	|10
fBodyAcc-mean-X					488	|10
fBodyAcc-mean-Y					499	|10
fBodyAcc-mean-Z					510	|10
fBodyAcc-std-X					521	|10
fBodyAcc-std-Y					532	|10
fBodyAcc-std-Z					543	|10
fBodyAcc-meanFreq-X				554	|12
fBodyAcc-meanFreq-Y				567	|12
fBodyAcc-meanFreq-Z				580	|12
fBodyAccJerk-mean-X				593	|10
fBodyAccJerk-mean-Y				604	|10
fBodyAccJerk-mean-Z				615	|10
fBodyAccJerk-std-X				626	|10
fBodyAccJerk-std-Y				637	|10
fBodyAccJerk-std-Z				648	|10
fBodyAccJerk-meanFreq-X			659	|12
fBodyAccJerk-meanFreq-Y			672	|11
fBodyAccJerk-meanFreq-Z			684	|12
fBodyGyro-mean-X				697	|10
fBodyGyro-mean-Y				708	|10
fBodyGyro-mean-Z				719	|10
fBodyGyro-std-X					730	|10
fBodyGyro-std-Y					741	|10
fBodyGyro-std-Z					752	|10
fBodyGyro-meanFreq-X			763	|13
fBodyGyro-meanFreq-Y			777	|13
fBodyGyro-meanFreq-Z			791	|13
fBodyAccMag-mean				805	|10
fBodyAccMag-std					816	|10
fBodyAccMag-meanFreq			827	|13
fBodyBodyAccJerkMag-mean 		841	|10
fBodyBodyAccJerkMag-std			852	|10
fBodyBodyAccJerkMag-meanFreq	863	|12
fBodyBodyGyroMag-mean			876	|10
fBodyBodyGyroMag-std			887	|10
fBodyBodyGyroMag-meanFreq		898	|13
fBodyBodyGyroJerkMag-mean		912	|10
fBodyBodyGyroJerkMag-std		923	|10
fBodyBodyGyroJerkMag-meanFreq	934	|12