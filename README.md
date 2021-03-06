# Getting and Cleaning Data: Peer Assessment
Hariharan D  
Tuesday, 11^th^ July 2017  

<style>
body {
text-align: justify}
</style>

## Introduction

One of the most exciting areas in all of data science right now is wearables computing - see for example this **[article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)** . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained.

* Data for this project is sourced from **[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.php)** website

* Raw data source can be obtained from **[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)**

* Description of the data source is avaible  **[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)**

R script called **"run_analysis.R"** does the following;

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


This document contains necessary code and output report that answers the questions detailed in this assignment, using a single **R Markdown** document that can be processed by **knitr** and be transformed into an **HTML file**.


## Set Options

Set the chunk options.


```r
library(knitr)

knitr::opts_chunk$set(echo = TRUE, tidy = TRUE, message = FALSE, fig.align = "center")
```


## R script **"run_analysis.R"** worksteps;


### 1. Load the necessary libraries. 

Note: It is assumed that the required libraries (**"knitr"**, **"plyr"**) are aready downloaded & installed.


### 2. Load and pre-process the data

* Download the file to "data" folder in the current working directory
* Unzip the files and place it in the folder "UCI HAR Dataset". Get the list of the files in the unzipped directory.
* Read data from the unzipped data files (test and train) into the variables using **"read.table()"** function
  1. Activity Files
  2. Subject Files
  3. Features Files
  4. Variable Names Files


### 3. Merge the training and the test data sets to create one data set

* Concatenate the data tables by rows
* Set names to variables - **Subject, Activity and Features**
* Merge columns to get the data frame **"allData"**


### 4. Extracts only the measurements on the mean and standard deviation for each measurement

* Subset feature names by measuring the **"mean"** and **"standard deviation"**
* Subset the data frame **"allData"** by seleted names of Features
* Check the structures of the data frame **"allData"**


### 5. Uses descriptive activity names to name the activities in the data set

* Read descriptive activity names from **"activity_labels.txt"**
* Convert the **"activity"** variable to **"factor"** type in the data frame **"allData"** using descriptive activity names
* Check the structure of the data frame **"allData"**


### 6. Appropriately labels the data set with descriptive variable names

  + prefix **"t"** is replaced by **"time"**
  + **"Acc"** is replaced by **"Accelerometer"**
  + **"Gyro"** is replaced by **"Gyroscope"**
  + **"prefix f"** is replaced by **"frequency"**
  + **"Mag"** is replaced by **"Magnitude"**
  + **"BodyBody"** is replaced by **"Body"**


### 7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### 8. Process list of variable names in data set for codebook


## Technical Specifications;

* RStudio - Version 1.0.143 **"[Download](https://www.rstudio.com/products/rstudio/download/)"**

* Link to Comprehensive R Archive Network **"[CRAN](https://cran.r-project.org/)"**

* Scripts tested in OS - **"Windows 7 x64"**

* Memory usage
  1. Input Files - **~ 329 MB**
  2. Script/Markdown Files - **~ 32 KB**
  3. Output Files - **~ 2.4 MB**


See **"run_analysis.md"** or **"run_analysis.html"** for details on dataset creation. 
See **"run_analysis.R"** which provides reproducible R script for cleaning UCI HAR dataset. 
See **"codebook.md"** or **"codebook.html"** for details about project attributes and variables.
See **"readme.md"** or **"readme.html"** for details on project abstract and work steps.
