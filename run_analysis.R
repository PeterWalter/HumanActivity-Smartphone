# 1. Load libraries and download data files also unzip the files
# Download the files and unzip into working directory
library(dplyr)
library(reshape2)
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url, destfile = "dataset.zip")
unzip("Dataset.zip")
summary(features)
# 2. Read the required files into R environment
# Read the testing data files.
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Read the training data files.
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# Read the activity and features data
activitytype <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

# 3. Join the data files
testActivity <- left_join(ytest,activitytype)
tstActivity <- select(testActivity, V2)
trainActivity <- left_join(ytrain, activitytype)
trnActivity <- select(trainActivity, V2)
# join the training and test data with activities
dataset <- rbind(cbind(tstActivity,stest, xtest), cbind(trnActivity,strain, xtrain))
# provide names to the data with lower case
featurenames <- tolower(as.character(features[,2]))
names(dataset) <- c("Activitytype","SubjectCode",featurenames)

# remove duplicated columns
cleanDT <-  dataset[, !duplicated(colnames(dataset))]


# 4. Create a data table for fast working with dplyr
DT <- tbl_df(cleanDT)

# 5. select columns with mean and std, plus activity and subject
tidydata <- DT %>%
        select( Activitytype,SubjectCode, contains("mean"),contains("std")) %>%
        arrange (Activitytype)

# 6. Write data to file
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)
# 7. create another dataset with mean values

groups <- tidydata %>%
        group_by(SubjectCode, Activitytype) %>%
        summarise_each(funs(mean)) %>%
        arrange(SubjectCode, Activitytype)

# 8 Write the dataset to file
write.table(groups, file = "tidydata_means.txt", row.name = FALSE)
