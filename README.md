# Clean-Data-Repo
The clean-data-repo was created as part of the Getting and Cleaning Data course from John Hopkins University through coursera.
This is in conjunction with the class assignment for creating a "tidy" dataset.
The dataset that is included with this repo was created by merging 2 separate datasets (a "test" dataset and a "train" dataset) from a study that was conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, entitled "Human Activity Recognition Using Smartphones".  This study looked at 6 different "activites" performed by 30 different subjects and measured their movements by a wearing a smartphone (Samsung Galaxy S II) on their waist.  The study created 2 different datasets, a "test" dataset that had a subset of the 30 subjects and a "train" dataset that had the remaining subjects.  Each subject had 561 measures taken.

The course assignment was to create a "tidy" data set by merging the "train" and "test" datasets together.  In this repository you will find a "tidy" dataset created, using the principles learned in the Getting and Cleaaning Data course.  This "tidy" data set was created by:

    -merging the 2 different datasets
    -extracting only the "mean" and "standard deviation" measures
    -providing descriptive activity names for each of the activities in the dataset
    -use approproriate variable names
         Note: in the course, variable naming principles were discussed, one of which was to use all lowercase letters.  In my experience, it is sometimes difficult to read variables with all lower case letters, so I have chosen to use a starndard where the first letter of each "word" in the variable be capitalized
    -creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
