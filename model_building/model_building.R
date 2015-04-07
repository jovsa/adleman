

modelFit_rf <- function(seedNum){

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
# 
# modelFit_rf <- train(Class ~.,
#                      method = "rf",
#                      trControl = fitControl,
#                      prox=TRUE,                     
#                      data = training)

modelFit_rf <- randomForest(Class ~.,trControl = fitControl, data = training, prox=TRUE)


return(modelFit_rf)

# CV$Predicted <- predict(modelFit_rf, newdata = CV)
# 
# confusionMatrix(CV$Class, CV$Predicted)

}
