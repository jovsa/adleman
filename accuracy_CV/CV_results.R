

cvResultsFunction <- function(){

CV$Predicted <- predict(modelFit_rf, newdata = CV, "prob")
confusionMatrix(CV$Class, CV$Predicted)

}
