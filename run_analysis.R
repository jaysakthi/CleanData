#1. Merges the training and the test sets to create one data set.
####################################################################
# Read X/input for the Training data
ntrainx <- read.table("/Users/datahar/train/X_train.txt", sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
# Read the labels for variables from features.txt
nfeaturelabel <- read.table("/Users/datahar/features.txt", sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
# Asssign names for variables 
colnames(ntrainx) <- nfeaturelabel[,2]
# Read y/expected output for the Training data
ntrainy <- read.table("/Users/datahar/train/y_train.txt", sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
# Asssign names for variables 
colnames(ntrainy) <- c("ActivityID")
#Read Subject info
nsubjecttrain <- read.table("/Users/datahar/train/subject_train.txt", sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
colnames(nsubjecttrain) <- c("Subject")
#Combine all Training data
alltrain <- cbind(nsubjecttrain,ntrainy,ntrainx)
# Read inputs, subject, assign vaiable names for the Test data similar to Train Data
ntestx <- read.table("/Users/datahar/test/X_test.txt", sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
names(ntestx) <- nfeaturelabel[,2]
ntesty <- read.table("/Users/datahar/test/y_test.txt", sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
colnames(ntesty) <- c("ActivityID")
nsubjecttest <- read.table("/Users/datahar/test/subject_test.txt", sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
colnames(nsubjecttest) <- c("Subject")
alltest <- cbind(nsubjecttest,ntesty,ntestx)
#combine Train and Test Data
alldata <- rbind(alltrain,alltest)
################################################################
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Create a new dataset with column name containing ActivityID, Subject,mean or std
stdmeandata <- alldata[,grepl("ActivityID|Subject|mean|std",names(alldata))]
##########################################################
#3. Use descriptive activity names to name the activities in the data set
# do a lookup from activity table to map Activity id to Activity Name
activitymap <- read.table("/Users/datahar/activity_labels.txt")
colnames(activitymap) <- c("id","name")
lookup <- setNames(activitymap$name,as.character(activitymap$id))
stdmeandata <- transform(stdmeandata,ActivityName=lookup[ActivityID])
#################################
#4.Label the data set with descriptive variable names.
#All variables were named using features.txt in step#1 above
#Remove speacial characters - replace special characteres - ,(,) with nothing 
colnames(stdmeandata) <- gsub(x =colnames(stdmeandata),"\\(","")
colnames(stdmeandata) <- gsub(x =colnames(stdmeandata),"\\)","")
colnames(stdmeandata) <- gsub(x =colnames(stdmeandata),"\\-","")
colnames(stdmeandata) <- gsub(x =colnames(stdmeandata),"\\,","")
colnames(stdmeandata) <- gsub(x =colnames(stdmeandata),'\\"','')
###############################
#5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
mytidy <- stdmeandata %>% group_by(ActivityName,Subject) %>% summarise_all(funs(mean))
write.table(mytidy,"tidy.txt",row.names=FALSE,quote=FALSE)
