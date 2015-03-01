
# Reading in the train results

trainLabels <- read.csv("./data/trainLabels.csv")
names(trainLabels)[1] <- paste("fileName")

totalFeaturesList <- NULL
totalFeaturesList <- merge(FFT, fileSizes, by = "fileName")
totalFeaturesList <- merge(totalFeaturesList, trainLabels, by = "fileName")

# Writing out the file
write.table(totalFeaturesList ,file="totalFeaturesList.txt",sep='\t',row.names=TRUE)
write.table(FFT ,file="FFT.txt",sep='\t',row.names=TRUE)
write.table(fileSizes ,file="fileSizes.txt",sep='\t',row.names=TRUE)
write.table(trainLabels ,file="trainLabels.txt",sep='\t',row.names=TRUE)



