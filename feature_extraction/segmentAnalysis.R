
segmentAnalysisFunction <- function(fileTypes){
  dataDir <- paste0("./data/", fileTypes, "/")
  
fileNameAsm <- list.files(dataDir, pattern="*.asm",full.names=TRUE)
numFiles <- length(fileNameAsm)
fileSizes <- NULL
segmentAnalysis <- NULL

numFiles <- 3
for (v  in 1:numFiles){
  fileName <- substr(fileNameAsm[v], 14,33)
  file <- readLines(fileNameAsm[v])
  text <- sum(str_count(file, "^\\.text:"))
 
  
  
  print(text)
  
  segmentAnalysis <- rbind(segmentAnalysis, data.frame(fileName))
  }
  
  return(segmentAnalysis)

}