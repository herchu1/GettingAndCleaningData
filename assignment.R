obtaindataset <- function(topdirectory) {

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
