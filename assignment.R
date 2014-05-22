obtaindataset <- function(topdirectory) {

colnames <- read.table(paste(topdirectory, '/features.txt', sep=''))
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

x <- read.table(paste(topdirectory, '/train/X_train.txt', sep=''))

xf <- x[,mnst]
names(xf) <- nnames[mnst]


subjecttrain <- read.table(paste(topdirectory, '/train/subject_train.txt', sep=''))
names(subjecttrain) <- "subject"

activities <- read.table(paste(topdirectory, '/activity_labels.txt', sep=''))

y_train <- read.table(paste(topdirectory, '/train/y_train.txt', sep=''))
activitytrain <- cut(y_train[[1]], 6, labels=activities[[2]])

train <- cbind(xf, subjecttrain, activity=activitytrain)

train
}
