# Saving Current Working Directory which is used to reset 
#	Current working Directory after script is exeuted

home.path <- getwd()

########################################################
# START STEP 0: Download, Unzip (Create Dir, if not present) 
#		and set working Directory
########################################################
# Step 0a:
#	Create an empty tempfile to hold downloaded zip file
temp <- tempfile()

# Step 0b:
#	Settng method for Windows Download 
#		(in other OS, the download file should have method="curl")
setInternet2(TRUE)

#	Actual File Download into temp (from Step 0a)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
		temp, mode="wb")				

# Step 0c:
#	Unzip downloaded file (from Step 0b)
utils::unzip(temp, exdir=".")

# Step 0d:
#	Unlink TEMP File
unlink(temp)

# Step 0d:
#	Set woking Directory to the Extracted Directory paths
setwd("./UCI HAR Dataset")

########################################################
# END STEP 0
########################################################

########################################################
# START STEP 1: Reading Global Data Sets
########################################################
# Step 1a:
#	Feature Master data
feature.labels <- read.table("features.txt", 
				col.names = c("FeatureId", "FeatureName"))

# Step 1b:
# 	Converting feature names to char vector for use as 
# 	column names while extracting X_(train|test) data
feature.names <- as.vector(feature.labels$FeatureName)

# Step 1c:
#	Activity Master data
activity.label <- read.table("./activity_labels.txt",
				col.names=c("ActivityId", "ActivityName"),
				stringsAsFactors=FALSE)

########################################################
# END STEP 1
########################################################

########################################################
# START STEP 2: Reading and Processing All Subject Training Data 
#				(Subsetting only MEAN and STD columns)
########################################################
# Step 2a:
#	Training Subjects data
subject_train.data <- read.table("./train/subject_train.txt",
				col.names = c("SubjectId"))

# Step 2b:
# 	Adding check.names and comment.char options for better performance
#	Column Names are assigned from Step 1b
X_train.data <- read.table("./train/X_train.txt",
				check.names = FALSE,
				comment.char = "",
				col.names = feature.names)
# Step 2c:
# 	Subsetting only mean and std columns to reduce size of dataset (from Step 2b.)
X_train.data <- X_train.data[ ,grep("mean|std", names(X_train.data))]

# Step 2d:
#	Subjects Training Activity data
y_train.data <- read.table("./train/y_train.txt",
				col.names = c("ActivityId"))

# Step 2e:
#	Merged Subject Data (from 2a.) with Corresponding Activity data (from 2d.)
mergedSubjectActivity_train.data <- cbind(subject_train.data, y_train.data, stringsAsFactors=FALSE)
				
# Step 2f:
#	Merge Subjects Training Activity (Step 2e.) and Activity Master data (from Step 1c.)
#	Get descriptive Activity Names
mergedActivityInfo_train.data <- merge(mergedSubjectActivity_train.data, 
					activity.label,
					by.x="ActivityId", by.y="ActivityId", all=TRUE)

# Step 2g:
#	Merge All Subjects Training data (from Step 2a., 2c. and 2f.)
mergedTrain.data <- cbind(SubjectId = mergedActivityInfo_train.data$SubjectId, 
				ActivityName = mergedActivityInfo_train.data$ActivityName, 
				X_train.data,
				stringsAsFactors=FALSE)

				
# Step 2h:
#	Cleaning up Subjects Merged Training data (from Step 2g.): 
#	removing column names of ()
names(mergedTrain.data) <- gsub("()", "", names(mergedTrain.data), fixed=TRUE)
					
########################################################
# END STEP 2
########################################################	

########################################################
# START STEP 3: Reading All Subject Test Data
#			(Subsetting only MEAN and STD columns)
########################################################	
# Step 3a:
#	Test Subjects data		
subject_test.data <- read.table("./test/subject_test.txt",
				col.names = c("SubjectId"))

# Step 3b:
# 	Adding check.names and comment.char options for better performance
#	Column Names are assigned from Step 1b
X_test.data <- read.table("./test/X_test.txt",
				check.names = FALSE,
				comment.char = "",
				col.names = feature.names)

# Step 3c:
# 	Subsetting only mean and std columns to reduce size of dataset
X_test.data <- X_test.data[ ,grep("mean|std", names(X_test.data))]

# Step 3d:
#	Subjects Testing Activity data
y_test.data <- read.table("./test/y_test.txt",
				col.names = c("ActivityId"))

# Step 3e:
#	Merged Test Subject Data (from 3a.) with Corresponding Activity data (from 3d.)
mergedSubjectActivity_test.data <- cbind(subject_test.data, y_test.data, stringsAsFactors=FALSE)

# Step 3f:
#	Merge Subjects Test Activity (Step 3e.) and Activity Master data (from Step 1c.)
#	Get descriptive Activity Names				
mergedActivityInfo_test.data <- merge(mergedSubjectActivity_test.data,
					activity.label,
					by.x="ActivityId", by.y="ActivityId",
					all=TRUE)
					
# Step 3g:
#	Merge All Subjects Test data (from Step 3a., 3c. and 3f.)
mergedTest.data <- cbind(SubjectId = mergedActivityInfo_test.data$SubjectId,  
				ActivityName = mergedActivityInfo_test.data$ActivityName, 
				X_test.data,
				stringsAsFactors=FALSE)


# Step 3h:
#	Cleaning up Subjects Merged Test data (from Step 3g): 
#	removing column names of ()
names(mergedTest.data) <- gsub("()", "", names(mergedTest.data), fixed=TRUE)

########################################################
# END STEP 3
########################################################

########################################################
# START STEP 4: Merging Cleaned up Subject Training and Test data
########################################################
# Step 4a:
#	Merging Cleaned Subjects Train and Test data
cleanedMerged.data <- rbind(mergedTrain.data, mergedTest.data)

# Step  4b:
#	Checking Dimensions of Cleaned, Merged Dataset

########################################################
# END STEP 4
########################################################

########################################################
# START STEP 5: Creating Tidy Dataset. Writing output file.
########################################################
# Step 5a:
#	Caculating Mean of each dataset column
#	on Subject ID and Activity Names
aggTidy.data <- aggregate(. ~ SubjectId + ActivityName, 
				cleanedMerged.data,
				FUN = mean,
				stringsAsFactors=FALSE)
# Step 5b:
#	Checking Dimensions of Tidy Dataset
dim(aggTidy.data)

# Step 5c:
#	Ordering the data on SubjectId and Activity Name
aggTidy.data <- aggTidy.data[ 
				order(as.numeric(as.character(aggTidy.data$SubjectId)),
				aggTidy.data$ActivityName), ]

# Step 5b:
#	Checking Dimensions of Tidy Dataset
dim(aggTidy.data)

# Step 5c:
#	Writing Output File
write.fwf(aggTidy.data, "./Tidy_UCI_HAR_Dataset.txt", 
				colnames=FALSE, quote=FALSE)


########################################################
# END STEP 5
########################################################

# Resetting to Old Working Directory

setwd(home.path)
