
featureListFunction <- function(fileTyes){
# Reading in the train results

trainLabels <- read.csv("./data/trainLabels.csv")
names(trainLabels)[1] <- paste("fileName")

totalFeaturesList_Train <- NULL
totalFeaturesList_Train <- merge(FFT, fileSizes, by = "fileName")
totalFeaturesList_Train <- merge(totalFeaturesList_Train, trainLabels, by = "fileName")

# Writing out the file
# write.table(totalFeaturesList_Train ,file="totalFeaturesList_Train.txt",sep='\t',row.names=TRUE)
# write.table(FFT ,file="FFT.txt",sep='\t',row.names=TRUE)
# write.table(fileSizes ,file="fileSizes.txt",sep='\t',row.names=TRUE)
# write.table(trainLabels ,file="trainLabels.txt",sep='\t',row.names=TRUE)
}


