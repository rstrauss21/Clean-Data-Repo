# Clean-Data-Repo
The clean-data-repo was created as part of the Getting and Cleaning Data course from John Hopkins University through coursera.
This is in conjunction with the class assignment for creating a "tidy" dataset.
The dataset that is included with this repo was created by merging 2 separate datasets (a "test" dataset and a "train" dataset) from a study that was conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, entitled "Human Activity Recognition Using Smartphones".  This study looked at 6 different "activites" performed by 30 different subjects and measured their movements by a wearing a smartphone (Samsung Galaxy S II) on their waist.  The study created 2 different datasets, a "test" dataset that had a subset of the 30 subjects and a "train" dataset that had the remaining subjects.  Each subject had 561 measures taken.

The course assignment was to create a "tidy" data set by merging the "train" and "test" datasets together.  In this repository you will find a "tidy" dataset created, using the principles learned in the Getting and Cleaaning Data course.  This "tidy" data set was created by:

    -merging the 2 different datasets
    -extracting only the "mean" and "standard deviation" measures
    -providing descriptive activity names for each of the activities in the dataset
    -use approproriate variable names
    -creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
The routine to create the tidy dataset is broken down into 4 parts, with each part having various steps:

Part 1: House cleaning
In the house cleaning section, I initialize the libraries that will be needed in the routine along with setting the working directory
Next, the routine will read the data from the internet and unzip it in the working directory

Part 2: Reading data set
  Step1: read in the column headings and clean up the variable names
     -remove dashes ("-")
     -remove parenthases ("()")
     -change the case of the part of the name of the variables
     Note: in the course, variable naming principles were discussed, one of which was to use all lowercase letters.  In my
     experience, it is sometimes difficult to read variables with all lower case letters, so I have chosen to use a starndard
     where the first letter of each "word" in the variable be capitalized
     
 Step 2: read in the 3 parts of the test dataset and then merge the 3 parts of the dataset together (subjects, activities and measures)
 
 Step 3: read in the 3 parts of the train dataset and then merge the 3 parts of the dataset together (subject, activites and measures)
 
Part 3: pull out the mean and standard deviation measures
  Step 1: select the columns with "nean" or "std" in them
  
Part 4: Let's add a description for each activity
    Step 1: look up the activity description from the activity table
    
Part 5: get the final dataset, the avg of each measure for each subject for each activity
 
