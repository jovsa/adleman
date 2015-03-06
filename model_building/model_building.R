

modelFit_rf <- function(seedNum){

#featureList <- read.table(file =  "featureList.txt")
#featureList$Class <- as.factor(featureList$Class)

set.seed(seedNum)
featureList$Class <- as.factor(featureList$Class)
inTraining <- createDataPartition(featureList$Class, p = .70, list = FALSE)
training <- featureList[ inTraining,]
CV  <- featureList[-inTraining,]

# Invoking parallel processing
cl <- makeCluster(detectCores())
registerDoParallel(cl)


# Random Forest
set.seed(seedNum)

fitControl <- trainControl(## 3-fold CV
  method = "repeatedcv",
  number = 3,
  ## repeated ten times
  repeats = 3)

modelFit_rf <- train(Class ~.,
                     method = "rf",
                     trControl = fitControl,
                     prox=TRUE,                     
                     data = training)

return(modelFit_rf)

# CV$Predicted <- predict(modelFit_rf, newdata = CV)
# 
# confusionMatrix(CV$Class, CV$Predicted)

}
