## This assigment is part of coursera's "Data Science: Getting and Cleaning Data" module
## Week 4 assignment: Human Activity Recognition Using Smartphones
## Description: This R script loads "Human Activity Recognition Using Smartphones" dataset from 
## "Dataset.zip" file, pre-processes and cleans data to useable format

## R File Name: "run_analysis.R"
## Input Files: "Dataset.zip" ["X_test.txt", "X_train.txt", "y_test.txt", "y_train.txt", "subject_test.txt", "subject_train.txt", "features.txt", "activity_labels.txt"]
## Ouput Files: "tidydata.txt", "variables.txt"

## Date of submission of assigment: 11-July-2017
## GitHub User Name: coolfox0407
## Name: Hariharan D


# Load the necessary R libraries.

# Note: It is assumed that the below libraries are aready installed.

library(plyr)


# Loading and preprocessing the data

# Download the file to "data" folder in the current working directory


if(!file.exists("./data"))
  {
    dir.create("./data")
  }

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile="./data/HAR_Dataset.zip")


# Unzip the files and place it in the folder "UCI HAR Dataset". Get the list of the files in the unzipped directory.

unzip(zipfile = "./data/HAR_Dataset.zip", exdir = "./data")

pathFiles <- file.path("./data", "UCI HAR Dataset")

files <- list.files(pathFiles, recursive=TRUE)

files



# Read data from the unzipped data files into the variables using **"read.table()"** function

# Activity Files

# Test Data

activityTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt",header = FALSE)

str(activityTest)


# Training Data

activityTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header = FALSE)

str(activityTrain)


# Subject Files


# Test Data

subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)

str(subjectTest)


# Training Data

subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)

str(subjectTrain)



# Features Files


# Test Data

featuresTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt" ,header = FALSE)

str(featuresTest)


# Training Data

featuresTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt",header = FALSE)

str(featuresTrain)


# Variable Names Files

variableNames <- read.table("./data/UCI HAR Dataset/features.txt",head=FALSE)

str(featuresTrain)



# 1.Merges the training and the test sets to create one data set

# Concatenate the data tables by rows

subject <- rbind(subjectTrain, subjectTest)

activity<- rbind(activityTrain, activityTest)

features<- rbind(featuresTrain, featuresTest)


# Set names to variables - Subject, Activity and Features

names(subject) <- c("subject")

names(activity) <- c("activity")

names(features) <- variableNames$V2



# Merge columns to get the data frame "allData"

interimData <- cbind(subject, activity)

allData <- cbind(features, interimData)


# 2.Extracts only the measurements on the mean and standard deviation for each measurement.

# Subset feature names by measuring the "mean" and "standard deviation"

subsetVariableNames <- variableNames$V2[grep("mean\\(\\)|std\\(\\)", variableNames$V2)]



# Subset the data frame "allData" by seleted names of Features

finalVariableNames <- c(as.character(subsetVariableNames), "subject", "activity" )

allData <- subset(allData, select = finalVariableNames)



# Check the structure of the data frame "allData"

str(allData)


# 3.Uses descriptive activity names to name the activities in the data set

# Read descriptive activity names from "activity_labels.txt"

activityNames <- read.table("./data/UCI HAR Dataset/activity_labels.txt",head=FALSE)



# Convert the "activity" variable to "factor" type in the data frame "allData" using descriptive activity names

allData$activity <- factor(allData$activity)

allData$activity <- factor(allData$activity, labels=as.character(activityNames$V2))



# Check the structure of the data frame "allData"

str(allData)


# 4.Appropriately labels the data set with descriptive variable names


# prefix "t" is replaced by "time"
# "Acc" is replaced by "Accelerometer"
# "Gyro" is replaced by "Gyroscope"
# "prefix f" is replaced by "frequency"
# "Mag" is replaced by "Magnitude"
# "BodyBody" is replaced by "Body"


names(allData) <- gsub("^t", "time", names(allData))

names(allData) <- gsub("^f", "frequency", names(allData))

names(allData) <- gsub("Acc", "Accelerometer", names(allData))

names(allData) <- gsub("Gyro", "Gyroscope", names(allData))

names(allData) <- gsub("Mag", "Magnitude", names(allData))

names(allData) <- gsub("BodyBody", "Body", names(allData))



# Check the names of the data frame "allData"

names(allData)



# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


tidyData <- aggregate(. ~subject + activity, allData, mean)

tidyData <- tidyData[order(tidyData$subject, tidyData$activity),]

write.table(tidyData, file = "./data/tidydata.txt",row.name=FALSE)


# Process list of variable names in data set for codebook

write(names(tidyData), file = "./data/variables.txt", ncolumns = 1)




