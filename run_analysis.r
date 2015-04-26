## Part 1 - merging test and training data sets
  ## Part 1 - Step 1: house cleaning (setting working diretory, setting up the necessary libraries)
     library(plyr)
     library(dplyr)
     library(reshape2)
     setwd("c:/RStrauss/Classes/Data Science/#3 Cleaning Dat/")
     
  ## Part 1 - Step 2: Pull the data from the web and unzip it
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(url, destfile="./data.zip")
     unzip("./data.zip")
       
  ## Part 2 - Step 1:Read in the headings & then clean up the headings
    ## read the column headings table first
     measures_headings <- read.table ("./UCI HAR Dataset/features.txt")
     
    ## now we transpose the headings from a vertical column to a horizontal row 
     measures_headings.H1 <- t(measures_headings[,2:ncol(measures_headings)])

     
    ## cleaning up variable names
     ## all variable names will be cleaned up with the following rules
     ## - remove all dashes ("-")
        measures_headings.H2 <- gsub("-", "", measures_headings.H1)
     ## - remove all parenthasis ("()")
        measures_headings.H3 <- sub("\\()", "", measures_headings.H2)
     ## - remove all duplicated words ("BodyBody")
        measures_headings.H4 <- sub("BodyBody", "Body" , measures_headings.H3)
     
     ## - to make the variable more readable, I believe that the first
     ##   the first letter in each word should be capitalized
        measures_headings.H5 <- sub("^[t]", "T" , measures_headings.H4)
        measures_headings.H6 <- sub("^[f]", "F", measures_headings.H5)
        measures_headings.H7 <- sub("mean", "Mean", measures_headings.H6)
        measures_headings.H8 <- sub("std", "STD", measures_headings.H7)
     
  ## Part 2 - Step 2:Read in the test data sets
    ## The test data set is in 3 parts:
    ##  part 1 - x_test - this is the actual meansurements
    ##  part 2 - y_test - this is the activity # for each row of data in x_test
    ##  part 3 - subject_test - this is a list of the subject IDs for each row in x_test
      
     test_measures <- read.table ("./UCI HAR Dataset/test/X_test.txt", col.names = (measures_headings.H7))
     test_activity <- read.table ("./UCI HAR Dataset/test/y_test.txt", col.names = ("ActivityID"))
     test_subject <- read.table ("./UCI HAR Dataset/test/subject_test.txt", col.names = ("Subject"))
  
     
    ## we need to join the 3 "test" files together into 1 "test" data set
    ## we will use the cbind() function to combine the 3 test data sets into 1 data set
    
    test_dataset1 <- cbind(test_subject, test_activity)
    test_dataset <- cbind(test_dataset1, test_measures)
   
    ## Part 2 - Step 3:Read in Training data
     ## The training data set is in 4 parts:
     ##  part 1 - x_train - this is the actual meansurements
     ##  part 2 - y_train - this is the activity # for each row of data in x_train
     ##  part 3 - subject_train - this is a list of the subject IDs for each row in x_train
  
     train_measures <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = (measures_headings.H7))
     train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = ("ActivityID"))
     train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = ("Subject"))
       
       ## we need to join the 3 "training" files together into 1 "training" data set
       ## we will use the cbind() function to combine the 3 test data sets into 1 data set
       
       training_dataset1 <- cbind(train_subject, train_activity)
       training_dataset <- cbind(training_dataset1, train_measures)
     
 ## Part 2 - Step 4: merge the test and train datasets together using rbind()
     merged_dataset1 <- rbind(test_dataset, training_dataset)
     
## Part 3 - pulling out just the mean and standard deviation variables
     ## we need to first find all the mean ["Mean"] & standard deviation ["STD"] columns
     ## we will use the 'grep' command
     
     mean_cols <- grep("Mean", measures_headings.H8)
     mean_cols2 <- grep("Mean", measures_headings.H8, value = TRUE)
     std_cols <- grep("STD", measures_headings.H8)
     std_cols2 <- grep("STD", measures_headings.H8, value = TRUE)
     merged_dataset2 <- select(merged_dataset1, c(1,2,mean_cols,std_cols))
     

## Part 4 - provide descriptive activity names
     ## let's get the activity descriptions
     activity_descriptions <- read.table ("./UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityID", "Activity"))
     
     ## let's replace the activity ID with the activity description
     merged_dataset3 <- join(merged_dataset2, activity_descriptions, "ActivityID")

## Part 5 - lets get the average of each of the mean & standard deviation variables for each subject for each activity
     merged_dataset4 <- melt(merged_dataset3, id=c("Subject", "Activity"))
          
     
## Part 5 - last step, create a tidy data set with the averages for each activity for each subject
     ## need to get melted dataset to identify the IDs and measures in the dataset and get the mean value for each measure
     merged_dataset5 <- dcast(merged_dataset4, Subject + Activity~variable, mean)
     
    write.table(merged_dataset5, file = "./mergeddata.txt", row.names=FALSE)