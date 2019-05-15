# You should create one R script called run_analysis.R that does the following. 

# 0. Sets the working directory where all the required files with the data are
setwd("")

# 1.	Merges the training and the test sets to create one data set.
    # Create vector with variable names for data frames with measurements
      df_var_names_features<-read.table("features.txt", header=FALSE, sep="", nrows=561)
      var_names_features<-as.character(df_var_names_features[,2])
    # Create data frame with the measurements for the train variables and adds variable names to each column
      df_X_train<-read.table("X_train.txt", header=FALSE, sep="", row.names=NULL, col.names=var_names_features, nrows=7354)
    # Create data frame with the measurements for the test variables and adds variable names to each column
      df_X_test<-read.table("X_test.txt", header=FALSE, sep="", row.names=NULL, col.names=var_names_features, nrows=7354)
    # Create columns with subjects 1-30 having participated (test and training)
      df_subject_train<-read.csv("subject_train.txt", header=FALSE, col.names="Subject")
      df_subject_test<-read.csv("subject_test.txt", header=FALSE, col.names="Subject")
    # Column indicating whether observation is test or training (Variable = TypeofObservation)
      test_index<-rep(c("test"), times=length(df_subject_test$Subject))
      train_index<-rep(c("train"), times=length(df_subject_train$Subject))
      TypeofObs_index<-c(test_index, train_index)
      TypeofObservation_test<-data.frame(TypeofObs_index)
    # Column with the variable activity
      df_activity_test<-read.csv("y_test.txt", header=FALSE, col.names="Activity")
      df_activity_train<-read.csv("y_train.txt", header=FALSE, col.names="Activity")
    # Assemble the Test data frame
      TestDataFrame<-cbind(df_activity_test, df_subject_test, df_X_test)
    # Assmenle the Train data frame
      TrainDataFrame<-cbind(df_activity_train, df_subject_train, df_X_train)
    # Row bind the two data frames
      RowB<-rbind(TestDataFrame, TrainDataFrame)
    # Column bind the TypeOfObservation Variable (starts with test, then train)
      CompleteDataFrame<-cbind(TypeofObservation_test, RowB)

# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
    # Find columns which contain means and standard deviations
      meancols<-grep("mean", colnames(CompleteDataFrame))
      stdcols<-grep("std", colnames(CompleteDataFrame))
    # Create a data frame which only includes variables of means and standard deviations as well as variables with qualitative information
      MeansStdDataFrame<-data.frame(CompleteDataFrame[,c(1,2,3,meancols,stdcols)])

# 3.	Uses descriptive activity names to name the activities in the data set
      MeansStdDataFrame$Activity[MeansStdDataFrame$Activity == "1"] <- "WALKING"
      MeansStdDataFrame$Activity[MeansStdDataFrame$Activity == "2"] <- "WALKING_UPSTAIRS"
      MeansStdDataFrame$Activity[MeansStdDataFrame$Activity == "3"] <- "WALKING_DOWNSTAIRS"
      MeansStdDataFrame$Activity[MeansStdDataFrame$Activity == "4"] <- "SITTING"
      MeansStdDataFrame$Activity[MeansStdDataFrame$Activity == "5"] <- "STANDING"
      MeansStdDataFrame$Activity[MeansStdDataFrame$Activity == "6"] <- "LAYING"

# 4.	Appropriately labels the data set with descriptive variable names. 
      # Done in step 1

# 5.	From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
      library(dplyr)
      walking<-filter(MeansStdDataFrame, Activity == "WALKING")
      WalkingMeans<-data.frame(colMeans(walking[,4:82]))
      
      walking_upstairs<-filter(MeansStdDataFrame, Activity == "WALKING_UPSTAIRS")
      WalkingUpstairsMeans<-data.frame(colMeans(walking_upstairs[,4:82]))

      walking_downstairs<-filter(MeansStdDataFrame, Activity == "WALKING_DOWNSTAIRS")
      WalkingDownstairsMeans<-data.frame(colMeans(walking_downstairs[,4:82]))     

      sitting<-filter(MeansStdDataFrame, Activity == "SITTING")
      SittingMeans<-data.frame(colMeans(sitting[,4:82]))  

      standing<-filter(MeansStdDataFrame, Activity == "STANDING")
      StandingMeans<-data.frame(colMeans(standing[,4:82]))
      
      laying<-filter(MeansStdDataFrame, Activity == "LAYING")
      LayingMeans<-data.frame(colMeans(laying[,4:82]))
      
      Avg_Variable_by_Activity<-cbind(WalkingMeans, WalkingUpstairsMeans, WalkingDownstairsMeans, SittingMeans, StandingMeans, LayingMeans)
      colnames(Avg_Variable_by_Activity)<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
      
      write.table(Avg_Variable_by_Activity, "190514_AverageMeasurements.txt", sep=",", row.name = FALSE)
      
      