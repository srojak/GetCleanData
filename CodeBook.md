# Data Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Original Description
The experiments have been carried out with a group of 30 volunteers within an age bracket
of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, the originators captured 3-axial
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets,
where 70% of the volunteers was selected for generating the training data
and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial
raw signals tAcc-XYZ and tGyro-XYZ.
These time domain signals (prefix 't' to denote time) were captured at
a constant rate of 50 Hz. Then they were filtered using a median filter and
a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time
to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

# Prepared Data
Two data sets are prepared:
	1. A full set of detailed data having the columns described below;
	2. A summary set of data where the data in columns 4+ of each row are the means
		of the detailed data grouped by (source, activity, subject)

## Data preparation
### Full Data Set
The full data set was developed from the source data by:
	1.	Removing all columns whose names did not contain ".mean." or ".std.";
	2.	Joining each row to the subject identifier for the row;
	3.	Joining each row to the activity label for the activity provided for the row.
	
### Summary Data Set
The summary data set was developed from the full data set by:
	1.	Melting the original data set into a set with the source, activity and subject
		as identifiery variables;
	2.	Casting the melted data set, computing the mean for the data in each
		(source, activity, subject) grouping
		
# Column Descriptions
## source
A factor indicating whether the row originated in the Test or the Trial data set.

## activity
A factor indicating the activity being performed.
The possible values are:
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

## subject
A factor having the identifier of the subject of the trial.
All subjects are identified by numbers.

## tBodyAcc.mean...X
## tBodyAcc.mean...Y
## tBodyAcc.mean...Z
## tBodyAcc.std...X
## tBodyAcc.std...Y
## tBodyAcc.std...Z
## tGravityAcc.mean...X
## tGravityAcc.mean...Y
## tGravityAcc.mean...Z
## tGravityAcc.std...X
## tGravityAcc.std...Y
## tGravityAcc.std...Z
## tBodyAccJerk.mean...X
## tBodyAccJerk.mean...Y
## tBodyAccJerk.mean...Z
## tBodyAccJerk.std...X
## tBodyAccJerk.std...Y
## tBodyAccJerk.std...Z
## tBodyGyro.mean...X
## tBodyGyro.mean...Y
## tBodyGyro.mean...Z
## tBodyGyro.std...X
## tBodyGyro.std...Y
## tBodyGyro.std...Z
## tBodyGyroJerk.mean...X
## tBodyGyroJerk.mean...Y
## tBodyGyroJerk.mean...Z
## tBodyGyroJerk.std...X
## tBodyGyroJerk.std...Y
## tBodyGyroJerk.std...Z
## tBodyAccMag.mean..
## tBodyAccMag.std..
## tGravityAccMag.mean..
## tGravityAccMag.std..
## tBodyAccJerkMag.mean..
## tBodyAccJerkMag.std..
## tBodyGyroMag.mean..
## tBodyGyroMag.std..
## tBodyGyroJerkMag.mean..
## tBodyGyroJerkMag.std..
## fBodyAcc.mean...X
## fBodyAcc.mean...Y
## fBodyAcc.mean...Z
## fBodyAcc.std...X
## fBodyAcc.std...Y
## fBodyAcc.std...Z
## fBodyAcc.meanFreq...X
## fBodyAcc.meanFreq...Y
## fBodyAcc.meanFreq...Z
## fBodyAccJerk.mean...X
## fBodyAccJerk.mean...Y
## fBodyAccJerk.mean...Z
## fBodyAccJerk.std...X
## fBodyAccJerk.std...Y
## fBodyAccJerk.std...Z
## fBodyAccJerk.meanFreq...X
## fBodyAccJerk.meanFreq...Y
## fBodyAccJerk.meanFreq...Z
## fBodyGyro.mean...X
## fBodyGyro.mean...Y
## fBodyGyro.mean...Z
## fBodyGyro.std...X
## fBodyGyro.std...Y
## fBodyGyro.std...Z
## fBodyGyro.meanFreq...X
## fBodyGyro.meanFreq...Y
## fBodyGyro.meanFreq...Z
## fBodyAccMag.mean..
## fBodyAccMag.std..
## fBodyAccMag.meanFreq..
## fBodyBodyAccJerkMag.mean..
## fBodyBodyAccJerkMag.std..
## fBodyBodyAccJerkMag.meanFreq..
## fBodyBodyGyroMag.mean..
## fBodyBodyGyroMag.std..
## fBodyBodyGyroMag.meanFreq..
## fBodyBodyGyroJerkMag.mean..
## fBodyBodyGyroJerkMag.std..
## fBodyBodyGyroJerkMag.meanFreq..
