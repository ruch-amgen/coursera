# CodeBook.md
### This script operates in the following fashion:
* Read in the different data files from the UCI HAR Dataset into Data Tables for both train and test
* Apply features labels to the dataset
* SUbset the mean and std features columns from the data subset
* Merge data Training and Test Data together
* Merge literal Activity labels to the merged dataset.
* Calculate the mean summaries from the merged data based on subject and activity labels

## Variables

* activity_labels: This is a data table that contains the activity labels the describe the activities that were used in the study
* features: This is a data table that contains all the features labels for all variables measure in the study.
* subject_test:  This is a data table that contains the subjects data that were observed in the test.
* x_test: This is a data table that contains the raw observation data taht were measure for different test, and is subsetted base on mean and std calculations.
* y_test: This is a data table that contains the activity identifiers that detail what activity was obverved in the test.
* test_data: This data combines x_test, y_test, and subject_test to form the overall test data for the study.
* subject_train:  This is a data table that contains the subjects data that were observed in the training.
* x_train: This is a data table that contains the raw observation data taht were measure for different training data, and is subsetted base on mean and std calculations.
* y_train: This is a data table that contains the activity identifiers that detail what activity was obverved in the training data.
* train_data: This data combines x_train, y_train, and train_test to form the overall training data for the study.
* combined_data: This is a data table that merged the testing and training data sets together.
* final_data: This is a data table that merges the literal activity names to the merged obvservation data.
* mean_agg_data: This data table that calculates the mean for all columns based on activity and subjet.


