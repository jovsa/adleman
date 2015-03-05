# Working directory initialization

#wd <- "./Documents/GitHub/Project_Adleman" # On Jovan's local
#wd <- "./GitHub/Project_Adleman" # on EC2
wd <- ".." #After the implimentation of main
setwd(wd)

# Cleaners
wd <- NULL

source("./config/global_config.R")

# Variables
subsetExtraction <- 0
featureExtraction <- 1


if(subsetExtraction  == 1){
  source("./subset_extraction/getting_data.R")
  source("./subset_extraction/data_population.R")
  
}


if(featureExtraction  == 1){
  dataType <- "test"
  source("./feature_extraction/FFT.R")
  FFT <- FFTFunction(dataType , 100, 100 )
  write.table(FFT, file="./data/cache/FFTTrain.txt")
    
  source("./feature_extraction/fileSize.R")
  fileSize <- fileSizeFunction(dataType)
  write.table(fileSize, file="./data/cache/fileSizeTrain.txt")
  temp <- NULL
  
  
}