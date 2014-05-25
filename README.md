## Getting and Cleaning Data

### Introduction

This project consists of a R Script called `run_analysis.R` that
process the raw _Human Activity Recognition Using Smartphones Dataset_
and lets you obtain a tidy data set in two formats: a full data set
in R data table type and a comma separated text file with summarized
content.

### The input

The input consists of the data provided by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from the Smartlab - Non Linear Complex
Systems Laboratory [^one]

The data comes in several text files arranged in a directory tree
where the train and test data sets are splited and the measurement,
the subject and the activities observed are also in different files.

### The output

The two possible output data sets are:

* A tidied full data set, in R data table type, which consists of
the concatenation of the training and test data sets with ALL the
columns that are either the mean or the standard deviation of ALL
the measures.

* A tidied and summarized data set, in a comma separated text
file, which consists of the average (`mean`) of all the columns
of the previous data set grouped by subject and activity.

The script only filters the columns that are neither mean nor
standard deviation measurements. It automatically formats and
names the columns for a suitable use in the R language.

Detailed information of the columns (name, data
type and description) can be found in the CodeBook.md
file.

### How to run the script

1. Obtain the raw data [^two].

2. Uncompress it.

3. In the R interpreter, `source` the `run_analysis.R` script

4. Call the function `writetidydata()` to obtain the simple data set.

    With no parameters it assumes that the raw data set is
    located in the working directory under the directory
    `UCI HAR Dataset` and the output text file will be located
    in the same working directory with the name `tidydata.txt`.
    
    You can change both topdirectory and filename parameters.
    
5. For the full data set call `obtaindataset(topdirectory)`.

    The `topdirectory` parameter is the path of the top directory
    where the raw data set is located.

    The function returns an R data table.


### References

[^one] Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

[^two] You can download from here XXX.



