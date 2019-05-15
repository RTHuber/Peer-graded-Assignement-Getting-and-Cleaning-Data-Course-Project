---
title: "README"
author: "Reto"
date: "15 5 2019"
output: html_document
---

# README - Explanation of what the script does

## 0. Sets the working directory where all the required files with the data are
setwd("")

## 1.	Merges the training and the test sets to create one data set  
      This part of the script does the following  
      - Creates a vector with variable names for data frames with measurements from "features.txt"
      - Creates a data frame with the measurements for the train variables from "X_train.txt" and adds variable names to each column
      - Creates a data frame with the measurements for the test variables from "X_test.txt" and adds variable names to each column
      - Creates columns with subjects 1-30 having participated (test and training) from "subject_train.txt" und "subject_test.txt"
      - Creates a column indicating whether observation is test or training (Variable = TypeofObservation) 
      - Creates a column with the variable activity "y_test.txt" und "y_train.txt"
      - Assembles the Test data frame
      - Assmenles the Train data frame
      - Row binds the two data frames
      - Column binds the TypeOfObservation Variable (starts with test, then train)

## 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
      This part of the script does the following 
      - Find columns which contain means and standard deviations
      - Create a data frame which only includes variables of means and standard deviations as well as variables with qualitative information

## 3.	Uses descriptive activity names to name the activities in the data set
      This part of the script repalces code values 1-6 with  "WALKING", "WALKING_UPSTAIRS", WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING" in column Activity

## 4.	Appropriately labels the data set with descriptive variable names. 
      This part was already done in step 1

## 5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      This part calculates the mean of all the means and standard deviations observed for each variable ("WLAKING", "WALKING_UPSTAIRS", ...)
      In the created a new data set called "190514_AverageMeasurements.txt"