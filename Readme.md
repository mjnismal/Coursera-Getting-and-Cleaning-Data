Getting and Cleaning Data: Course Project
========================

#### This repo contains my work for the Coursera course, **Getting and Cleaning Data**, part of the **Data Science Specialization Track**. 

## Data Source
The data source is from the experiment **Human Activity Recognition Using Smartphones Data Set**. (See [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for more information.)

There are 6 datasets used to create a final master dataset:

* **'train/X_train.txt':** Training set.
* **'train/y_train.txt':** Training labels.
* **'test/X_test.txt':** Test set.
* **'test/y_test.txt':** Test labels.
* **'train/subject_train.txt':** Each row identifies the subject who performed the activity for the training sample. Its range is from 1 to 30. 
* **'test/subject_test.txt':** Each row identifies the subject who performed the activity for the test sample. Its range is from 1 to 30. 


Additional files were used to improve the quality of the data:

* **'features.txt':** List of all 561 features.
*  **'activity_labels.txt':** Links the class labels with their activity name.

also see [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to download the dataset.


## Script and Output

The script **run_analysis.R** imports the data and applies necessary changes to create a tidy dataset. This code does not need to download the data source since downloading is part of the script.

#### This has 4 outputs:
* Tidy dataset with activity labels and subjects
* Table: Each Variable Averages per Subject
* Table: Each Variable Averages per Activity
* Table: Each Variable Averages per Activity and Subject


## Codebook

This contains the transformations involved in getting the features of the experiment. Also includes how the data cleaning and summary was done.

