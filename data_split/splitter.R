

dataSplitFunction <- function(seedNum){

  set.seed(seedNum)
  featureList$Class <- as.factor(featureList$Class)
  inTraining <- createDataPartition(featureList$Class, p = .70, list = FALSE)
  training <- featureList[ inTraining,]
  CV  <- featureList[-inTraining,]
  
  return(list(training[,-1], CV[,-1]))

}
