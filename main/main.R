# Working directory initialization

#wd <- "./Documents/GitHub/Project_Adleman" # On Jovan's local
wd <- "./GitHub/Project_Adleman" # on EC2
#wd <- ".." #After the implimentation of main
setwd(wd)

# Cleaners
wd <- NULL

source("./config/global_config.R")

# Global Variables; 0 = Do not do; 1 = DO
seedNum <- 112
subsetExtraction <- 0
featureExtraction <- 0
readFromCache <- 1
featureList <- 1
dataSplit <- 1
modelTrain <- 1
CVResults <- 1
totalTestData <- 1
postAnalysis <- 0


if(subsetExtraction  == 1){
  source("./subset_extraction/getting_data.R")
  source("./subset_extraction/data_population.R")
  
}


# Feature extraction
if(featureExtraction  == 1){
  dataType <- "train"
  source("./feature_extraction/FFT.R")
  FFT <- FFTFunction(dataType , 100, 100)
  #write.table(FFT, file="./data/cache/FFTTrain_n_1898.txt")
    
  source("./feature_extraction/fileSize.R")
  fileSizes <- fileSizeFunction(dataType)
  #write.table(fileSizes, file="./data/cache/fileSizeTrain_n_1898.txt")
  
}


if(readFromCache ==1){
  FFT <- read.table("./data/cache/FFTTrain_n_1898.txt")
  fileSizes <- read.table("./data/cache/fileSizeTrain_n_1898.txt")
}


# TEMPER 
dataType <- "train"
###
source("./feature_extraction/segmentAnalysis.R")
segmentAnalysis <- segmentAnalysisFunction(dataType)
# TEMPER


# Feature list compilation
if(featureList  == 1){
  dataType <- "train"
  source("./features/feature_list.R")
  featureList <- featureListFunction(dataType)
}


# Data splitting
if(dataSplit  == 1){
  source("./data_split/splitter.R")
  totalData <- dataSplitFunction(seedNum)
  training <- data.frame(totalData[1])
  CV <- data.frame(totalData[2])
}


# Model traning 
if(modelTrain  == 1){
  source("./model_building/model_building.R")
  modelFit_rf <- modelFit_rf(seedNum)
}

# Cross Validating
if(CVResults  == 1){
  source("./accuracy_CV/CV_results.R")
  CVResults <- cvResultsFunction()
  
}

# Getting the testing data
if(totalTestData == 1){
  FFTTest <- read.table("./data/cache/FFTTest.txt")
  fileSizeTest <- read.table("./data/cache/fileSizeTest.txt")
  totalFeaturesList_Test <- merge(FFTTest, fileSizeTest, by = "fileName")
  totalFeaturesList_Test[,2] <- as.numeric(totalFeaturesList_Test[,2])
  totalFeaturesList_Test[,102] <- as.numeric(totalFeaturesList_Test[,102])
  totalFeaturesList_Test[,202] <- as.numeric(totalFeaturesList_Test[,202])
  totalFeaturesList_Test[,203] <- as.numeric(totalFeaturesList_Test[,203])
  row.names(totalFeaturesList_Test)<- totalFeaturesList_Test$fileName
  
#   totalFeaturesList_Test$Class <- predict(modelFit_rf,totalFeaturesList_Test[,-1])

  prob <- data.frame(predict(modelFit_rf,totalFeaturesList_Test[,-1], type="prob"))
  prob$fileName <- row.names(prob)
  sampleSubmission <- read.csv("./data/sampleSubmission.csv")
  names(sampleSubmission)[1] <- "fileName"
  sampleSubmission <- data.frame(sampleSubmission[,c(1:2)])
  
  prob <- merge(prob,sampleSubmission, by.x = "fileName")
  prob <- prob[,c(1:10)]


  names(prob)[1] <- "Id"
  names(prob)[2] <- "Prediction1"
  names(prob)[3] <- "Prediction2"
  names(prob)[4] <- "Prediction3"
  names(prob)[5] <- "Prediction4"
  names(prob)[6] <- "Prediction5"
  names(prob)[7] <- "Prediction6"
  names(prob)[8] <- "Prediction7"
  names(prob)[9] <- "Prediction8"
  names(prob)[10] <- "Prediction9"

write.csv(file="prob.csv", x=prob, row.names = FALSE) 
}


# Post Analysis
 if(postAnalysis  == 1){
  
  # Plotting variable importance
  png(filename = "./img/varImpPlot.png") 
  varImpPlot(modelFit_rf, scale = TRUE)
  dev.off()
  
  # CV results
 CVResults
   
}


