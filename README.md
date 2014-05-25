## Getting and Cleaning Data

### Introduction

This project consists of a R Script called `run_analysis.R` that
process the raw _Human Activity Recognition Using Smartphones Dataset_
and lets you obtain a tidy data set in two formats: a full data set
in R data table type and a comma separated text file with summarized
content.

### The output

The two possible output data sets are:

* A tidied full data set, in R data table type, which consists of
the concatenation of the training and test data sets with ALL the
columns that are either the mean or the standard deviation of ALL
the measures.

* A tidied and summarized data set, in a comma separated text
file, which consists of the average (`mean`) of all the columns
of the previous data set grouped by subject and activity.

Detailed information of the columns can be found in the CodeBook.md
file.

### How to run the script

1. Obtain the raw data (see [X])

2. Uncompress it.

3. In the R interpreter, `source` the `run_analysis.R` script

4. Call the function `writetidydata()`.

    With no parameters it assumes that the raw data set is
    located in the working directory under the directory
    `UCI HAR Dataset` and the output text file will be located
    in the same working directory with the name `tidydata.txt`.
    
    You can change both topdirectory and filename parameters.
    
5. XXX


### References




