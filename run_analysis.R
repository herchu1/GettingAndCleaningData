#
# run_analysis.R
#
# author:   herchu
#           for Coursera's Getting And Cleaning Data course (May 2014).
#
# process raw Human Activity Recognition Using Smartphones Dataset.
# Source of the data:
# Human Activity Recognition on Smartphones using a Multiclass
# Hardware-Friendly Support Vector Machine.
# International Workshop of Ambient Assisted Living (IWAAL 2012).
# Vitoria-Gasteiz, Spain. Dec 2012


writetidydata <- function(topdirectory='UCI HAR Dataset', filename='tidydata.txt') {
    # process the raw data and writes an aggregated and tidy data set.
    #
    # parameters:
    #   topdirectory: the path of the directory where the uncompress raw data is.
    #                 defaults to 'UCI HAR Dataset' in the current working dir.
    #   filename:     the name of the output file.
    #                 defaults to 'tidydata.txt' in the curring working dir.
    #
    ds <- obtaindataset(topdirectory)
    writeaggregatedata(ds, filename)
}


writeaggregatedata <- function(alldata, filename) {
    # aggregates the full data set with the average of all the columns
    # by subject and activity.
    #
    # parameters:
    #   alldata:      a tidy data set with the full data.
    #   filename:     the name of the output file.
    #                 defaults to 'tidydata.txt' in the curring working dir.
    #
    compact <- aggregate( .~ subject + activity, data=alldata, mean)
    write.csv(compact, file=filename, row.names=F)
}


obtaindataset <- function(topdirectory) {
    # obtains the full data set by reading and cleaning the raw data.
    #
    # parameters:
    #   topdirectory: the path of the directory where the uncompress raw data is.
    # returns:
    #   a tidy data set
    #
    filepath <- paste(topdirectory, '/features.txt', sep='')
    colnames <- read.table(filepath)
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
    
    filepath <- paste(topdirectory, '/activity_labels.txt', sep='')
    activities <- read.table(filepath)
    
    train <- obtainsubset(topdirectory, 'train', activities, mnst, nnames)
    test <- obtainsubset(topdirectory, 'test', activities, mnst, nnames)
    
    rbind(train, test)
}


obtainsubset <- function(topdir, subset, activities, columnset, newnames) {
    # obtains a subset (either train or test) of the data data.
    #
    # parameters:
    #     topdir:       the path of the directory where the uncompress raw data is.
    #     subset:       either 'train' or 'test'.
    #     activities:   the activities vector for the corresponding subset.
    #     columnset:    the subset of columns to extract.
    #     newnames:     the new names of the columns.
    # returns:
    #     a tidy data subset (either train or test)
    #
    filepath <- paste(topdir, '/', subset, '/X_', subset, '.txt', sep='')
    x <- read.table(filepath)
    
    xf <- x[,columnset]
    names(xf) <- newnames[columnset]
    
    filepath <- paste(topdir, '/', subset, '/subject_', subset, '.txt', sep='')
    subjectsubset <- read.table(filepath)
    names(subjectsubset) <- "subject"
    
    filepath <- paste(topdir, '/', subset, '/y_', subset, '.txt', sep='')
    y_subset <- read.table(filepath)
    activitysubset <- cut(y_subset[[1]], 6, labels=activities[[2]])
    
    cbind(xf, subjectsubset, activity=activitysubset)
}
