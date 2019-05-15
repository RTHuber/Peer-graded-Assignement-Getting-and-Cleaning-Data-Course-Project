---
title: "CodeBook"
author: "Reto"
date: "15 5 2019"
output: html_document
---

# Code Book – AverageMeasurements.txt

## Variables
The data set “AverageMeasurements.txt” contains the following six variables:  
- WALKING  
- WALKING_UPSTAIRS  
- WALKING_DOWNSTAIRS  
- SITTING  
- STANDING  
- LAYING  

## Observations (Data and Transformations)   
The six variables’ observations (tBodyAcc.mean...X , tBodyAcc.mean...Y , etc.) are averages of the mean and standard deviations of measurements taken from the “Human Activity Recognition Using Smartphones Data Set”. They include test and training data of all 30 participants. Measurements were recorded by wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial (X,Y,Z) linear acceleration and 3-axial (X,Y,Z) angular velocity were captured.

## Units
- Features are normalized and bounded within [-1,1]
- Each feature vector is a row on the text file
- The untis used for the accelerations (total and body) are 'g's (gravitiy of earth - 9.80665 m/seg2)
- The gyroscope units are rad/seg

## Source: “Human Activity Recognition Using Smartphones Data Set  

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
