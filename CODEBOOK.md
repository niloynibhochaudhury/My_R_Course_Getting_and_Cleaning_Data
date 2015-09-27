CODEBOOK.md
This file describes the Steps performed in the run_analysis.R file to arrive at the Tidy Dataset
The Script generate a Tidy Dataset with 180 observations (rows) and 81 variables (columns)
##########################################################
Note: Guiding Principles which creating the Script
##########################################################
1. Try to improve Performance wherever possible
2. Reduce the Size of the dataset to work with, as quickly as possible (ties with earlier principle)



##############################################################################
Pre-requisites
##############################################################################
	Please Run following, as gdata package is used to generate fixed width file

install.packages("gdata")

library(gdata)

##############################################################################
Pre-requisites END
##############################################################################

##############################################################################
Main Script Steps
##############################################################################

Saving Current Working Directory which is used to reset 
	Current working Directory after script is exeuted

######################################################
STEP 0: Download, Unzip (Create Dir, if not present) 
		and set working Directory
######################################################
Step 0a: Create an empty tempfile to hold downloaded zip file
########
Step 0b: 
########
	Settng method for Windows Download 
		(in other OS, the download file should have method#"curl")
	Actual File Download into temp (from Step 0a)
########
Step 0c: Unzip downloaded file (from Step 0b)
Step 0d: Unlink TEMP File
Step 0d: Set woking Directory to the Extracted Directory paths

######################################################
END STEP 0
######################################################

######################################################
STEP 1: Reading Global Data Sets
######################################################
Step 1a: Feature Master data
########
Step 1b:
	Converting feature names to char vector for use as 
	column names while extracting X_(train|test) data
########
Step 1c: Activity Master data
########

######################################################
END STEP 1
######################################################

######################################################
STEP 2: Reading and Processing All Subject Training Data 
				(Subsetting only MEAN and STD columns)
######################################################
Step 2a: Training Subjects data
########
Step 2b:
########
	Adding check.names and comment.char options for better performance
	Column Names are assigned from Step 1b
########
Step 2c: Subsetting only mean and std columns to reduce size of dataset (from Step 2b.)
########
Step 2d: Subjects Training Activity data
########
Step 2e: Merged Subject Data (from 2a.) with Corresponding Activity data (from 2d.)
########
Step 2f: 
########
	Merge Subjects Training Activity (Step 2e.) and Activity Master data (from Step 1c.)
	Get descriptive Activity Names
########
Step 2g: Merge All Subjects Training data (from Step 2a., 2c. and 2f.)
########				
Step 2h:
########
	Cleaning up Subjects Merged Training data (from Step 2g.): 
	removing column names of ()
########
				
######################################################
END STEP 2
######################################################	

######################################################
START STEP 3: Reading All Subject Test Data
			(Subsetting only MEAN and STD columns)
######################################################	
Step 3a: Test Subjects data		
########
Step 3b:
	Adding check.names and comment.char options for better performance
	Column Names are assigned from Step 1b
########
Step 3c: Subsetting only mean and std columns to reduce size of dataset
########
Step 3d: Subjects Testing Activity data
########
Step 3e: Merged Test Subject Data (from 3a.) with Corresponding Activity data (from 3d.)
########
########
Step 3f:
	Merge Subjects Test Activity (Step 3e.) and Activity Master data (from Step 1c.)
	Get descriptive Activity Names				
########
Step 3g: Merge All Subjects Test data (from Step 3a., 3c. and 3f.)
########
Step 3h:
	Cleaning up Subjects Merged Test data (from Step 3g): 
	removing column names of ()
########

######################################################
END STEP 3
######################################################

######################################################
STEP 4: Merging Cleaned up Subject Training and Test data
######################################################
Step 4a: Merging Cleaned Subjects Train and Test data
########
Step 4b: Checking Dimensions of Cleaned, Merged Dataset
########

######################################################
END STEP 4
######################################################

######################################################
STEP 5: Creating Tidy Dataset. Writing output file.
######################################################
Step 5a: Calculating Mean of each dataset column on Subject ID and Activity Names
########
Step 5b: Checking Dimensions of Tidy Dataset
########
Step 5c: Ordering the data on SubjectId and Activity Name
########
Step 5b: Checking Dimensions of Tidy Dataset
########
Step 5c: Writing Output File

######################################################
END STEP 5
######################################################
Resetting to Old Working Directory

##########################################################################################
Script ENDS
##########################################################################################
