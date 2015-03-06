

cvResultsFunction <- function(seedNum){

CV$Predicted <- predict(modelFit_rf, newdata = CV)
confusionMatrix(CV$Class, CV$Predicted)

}
