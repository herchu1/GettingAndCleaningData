
# setwd('OneDrive/Practicas/DS-CLEAN')
colnames <- read.table('UCI HAR Dataset/features.txt')
names(colnames) = c('n','name')
nnames <- gsub("[[:punct:]]", "", colnames$name)
nnames <- tolower(nnames)

nnames <- tolower(nnames)
nnames <- gsub("^t", "time", nnames)
nnames <- gsub("^f", "fft", nnames)

grep("mean", nnames, fixed=T)
grep("std", nnames, fixed=T)
st <- grepl("std", nnames, fixed=T)
mn <- grepl("mean", nnames, fixed=T)
mnst <- st | mn

x <- read.table('UCI HAR Dataset/train/X_train.txt')

xf <- x[,mnst]
names(xf) <- nnames[mnst]


subjecttrain <- read.table('UCI HAR Dataset/train/subject_train.txt')
names(subjecttrain) <- "subject"

activities <- read.table('UCI HAR Dataset/activity_labels.txt')

y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
activitytrain <- cut(y_train[[1]], 6, labels=activities[[2]])

train <- cbind(xf, subjecttrain, activity=activitytrain)


