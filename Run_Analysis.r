# Read Activity Labels
activity_labels <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activity_labels)[1] = "Activity_ID"
colnames(activity_labels)[2] = "Activity"

# Read Features Data
features <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/features.txt", header = FALSE)

# Read Train Test Data
subject_test <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/test/x_test.txt", header = FALSE)
y_test <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/test/y_test.txt", header = FALSE)

colnames(subject_test) = "Participant ID"
colnames(x_test) = features[,2]
x_test <- x_test[,grep("*mean*|*std*", features$V2)]
colnames(y_test) = "Activity_ID"

test_data <- cbind(x_test, y_test, subject_test)

# Read Train Data set
subject_train <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/train/x_train.txt", header = FALSE)
y_train <- read.table("C:/Users/ruch/Documents/Coursera/Course_3/UCI HAR Dataset/train/y_train.txt", header = FALSE)

colnames(x_train) = features[,2]
x_train <- x_train[,grep("*mean*|*std*", features$V2)]
colnames(subject_train) = "Participant ID"
colnames(y_train) = "Activity_ID"


#Combine train and test data sets
train_data <- cbind(x_train, y_train, subject_train)
combined_data <- rbind(test_data, train_data)

#Apply Activity labels to combined dataset
final_data <- merge(combined_data, activity_labels, row.names = "Activity_ID") 

#Create additional table that calculates mean
mean_agg_data <- aggregate(.~`Participant ID`+ Activity, final_data, mean, na.rm=TRUE)
mean_agg_data <- arrange(mean_agg_data, `Participant ID`, Activity)