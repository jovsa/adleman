rm(list = ls())

totalFeaturesList <- read.table(file =  "totalFeaturesList.txt")
totalFeaturesList$Class <- as.factor(totalFeaturesList$Class)

set.seed(112)
inTraining <- createDataPartition(totalFeaturesList$Class, p = .70, list = FALSE)
training <- totalFeaturesList[ inTraining,]
CV  <- totalFeaturesList[-inTraining,]

# Invoking parallel processing
cl <- makeCluster(detectCores())
registerDoParallel(cl)


# Random Forest
set.seed(112)


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

CV$Predicted <- predict(modelFit_rf, newdata = CV)

confusionMatrix(CV$Class, CV$Predicted)
