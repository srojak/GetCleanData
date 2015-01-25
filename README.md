# GetCleanData
Getting and Cleaning Data Project

## author
Stephen Rojak

# Contents
## CodeBook.md
The code book describes the data sets that are produced by this project.

## run_analysis.R
The definition of an R function that will obtain the project data from the input data.
### usage
dfSummary <- run_analysis("fullDataSet", "dataPath")
### parameters
	"fullDataSet"	the name of the data.frame to create containing the full result data.
	"dataPath"		the path to the folder containing the root of the source data.
### return value
A data set containing the summarized data as described in the code book.
	
## complete.txt
A file containing the full data set produced by run_analysis().

## summary.txt
A file containing the summary data produced by run_analysis().
