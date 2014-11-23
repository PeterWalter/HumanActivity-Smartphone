---
title: "Human-activity using Smart phones"
author: "Peter Chifamba"
date: "Saturday, November 22, 2014"
output: html_document
---  
## Introduction
This project is to demonstrate the ability to collect, work with and clean a data set.
The data set is one of the most exciting areas in all od data science right now and this is **wearable computing**.   
  
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:   

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>   

Here are the data for the project:   

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>   

## The run_analysis script  

Creating one R script called run_analysis.R that does the following.   

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive variable names.   
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## How the script works  
All sections are commented well in the script  as follows:    
1. extracts the zipped data from a website and stores it into a folder  
2. Loads the library that are requires to process the files i.e. dplyr and read datafiles into data tables.  
3. Join the data files  
4. remove duplicate columns in the data set and there are not required for the final clean data    
5. Create a data table for fast working with dplyr  
6. select columns with mean and std, plus activity and subject  
7. Write data to file of tidy data  
8. create another dataset with mean values grouped by subject and activity    
9. Write the dataset to file

