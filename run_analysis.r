# NOTE: this code assumes your working directory ends in
# "/UCI HAR Dataset"
data <- read.table("test/X_test.txt", header=FALSE)
# paste on the training data set:
data <- rbind(data, read.table("train/X_train.txt", header=FALSE))
# variable labels (original)
names(data) <- readLines("features.txt")
# extract only the means and standard devs of the measurements:
# only use variables with names containing "mean()" or "std()"
keep <- grepl(pattern="mean\\(\\)|std\\(\\)", x=names(data))
data <- data[, keep]
# rename variables; remove hyphens/parens/spaces/numbers, reorder terms.
# example: tBodyAcc-mean()-X becomes meanXtBodyAcc etc.:
s <- strsplit(names(data), split="-|\\(\\)| ")
# s[[1]] == "1" "tBodyAcc" "mean" "" "X"
# NOTE: not all variables have X/Y/Z components!
names(data) <- sapply(s, FUN=function(x){ paste(x[3],
                                                if(is.na(x[5])) "" else x[5],
                                                x[2], sep="") })
# add activity and subject ID variables:
data$Activity <- factor(c(readLines("test/y_test.txt"),readLines("train/y_train.txt")), 
                        labels=substr(readLines("activity_labels.txt"), start=3, stop=20))
data$SubjectID<- as.numeric(c(readLines("test/subject_test.txt"),
                              readLines("train/subject_train.txt")))
# generate a second, tidy data set w/ each variable averaged by
# subject and activity. the aggregate() function is helpful:
tidy <- aggregate(x=data[,1:66], 
                  by=list(SubjectID=data$SubjectID, Activity=data$Activity),
                  FUN=mean, simplify=TRUE)
# and save the tidy data set as a text file:
write.table(tidy, file="Data_tidy.txt", row.names=FALSE)

