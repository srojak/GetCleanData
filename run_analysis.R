# Getting and Cleaning Data 010
# stephen rojak
# 25 jan 15
# course project

# parameters
# mainDataName is the name in which the main data.frame will be stored
# dataPath is the path to the root "UCI HAR Dataset" folder
# returns the summary data.frame with the average of each variable by source/activity/subject
run_analysis <- function(mainDataName, dataPath) {
	# go to the data path safely
	tryCatch({
		setwd(dataPath)
	}, error=function(err.msg) {
		stop(err.msg, call.=FALSE)
	})
	
	# setup
	## define source factors
	vSourceFactor <- factor(c("Test", "Train"))
	
	## set up vector of column labels that will be used often
	vNewColumnLabels <- c("source", "activity", "subject")
	
	## get the activity labels into a data.frame
	message("reading activity labels")
	dfActivity <- read.table("activity_labels.txt",
								col.names = c("activityCode", "activity"))
								
	## get the features, which will become the data columns
	message("reading features")
	dfFeatures <- read.table("features.txt")
	vColumnList <- make.names(as.character(dfFeatures[,2]), unique=TRUE)
	## from this list, identify the vector of column numbers
	## that are means or standard deviations
	vColIdxMean <- grep(".mean.", vColumnList)
	vColIdxStDev <- grep(".std.", vColumnList)
	vColAll <- sort(c(vColIdxMean, vColIdxStDev))
	## the common setup is now done
	
	# test data
	message("processing test data")
	## read the data
	message(" reading measurement data")
	dfTestData <- read.table("test/X_test.txt",
								col.names=vColumnList)
	
	## read the raw activity data
	message(" reading activity data")
	dfTestActRaw <- read.table("test/y_test.txt",
								col.names="activityCode")
								
	## read the subject identifiers as factors
	message(" reading subject identifiers")
	dfTestSubject <- read.table("test/subject_test.txt",
								colClasses=c("factor"))
								
	## get the activity label for each of the raw activities
	message(" completing processing")
	dfTestAct <- merge(dfTestActRaw, dfActivity,
						by.x="activityCode", by.y="activityCode")
						
	## taking only the columns that we want out of the data,
	## prepend columns for the source, subject and activity
	dfTestSelect <- cbind(vSourceFactor[1], dfTestAct[,2],
							dfTestSubject, dfTestData[,vColAll])
	## apply factor column labels
	colnames(dfTestSelect)[1:3] <- vNewColumnLabels
							
	# training data
	message("processing training data")
	## read the data
	message(" reading measurement data")
	dfTrainData <- read.table("train/X_train.txt",
								col.names=vColumnList)
	
	## read the raw activity data
	message(" reading activity data")
	dfTrainActRaw <- read.table("train/y_train.txt",
								col.names="activityCode")
								
	## read the subject identifiers as factors
	message(" reading subject identifiers")
	dfTrainSubject <- read.table("train/subject_train.txt",
								colClasses=c("factor"))
								
	## get the activity label for each of the raw activities
	message(" completing processing")
	dfTrainAct <- merge(dfTrainActRaw, dfActivity,
						by.x="activityCode", by.y="activityCode")
						
	## taking only the columns that we want out of the data,
	## prepend columns for the source, subject and activity
	dfTrainSelect <- cbind(vSourceFactor[2], dfTrainAct[,2],
							dfTrainSubject, dfTrainData[,vColAll])
	## apply factor column labels
	colnames(dfTrainSelect)[1:3] <- vNewColumnLabels
	
	# assemble final package
	message("merge data sets")
	dfTotal <- rbind(dfTestSelect, dfTrainSelect)
	
	message(paste("store full data set as", mainDataName))
	assign(mainDataName, dfTotal, envir=.GlobalEnv, inherits=TRUE)
	
	message("creating summary set")
	dfDataMelt <- melt(dfTotal, id.vars=vNewColumnLabels)
	dcast(dfDataMelt, source + activity + subject ~ variable, mean)
}