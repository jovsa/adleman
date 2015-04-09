
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
  header <- sum(str_count(file, "^HEADER:"))
  code <- sum(str_count(file, "^CODE:"))
  text <- sum(str_count(file, "^\\.text:"))
  data <- sum(str_count(file, "^\\.data:"))
  bss <- sum(str_count(file, "^\\.bss:"))
  rdata <- sum(str_count(file, "^\\.rdata:"))
  edata <- sum(str_count(file, "^\\.edata:"))
  idata <- sum(str_count(file, "^\\.idata:"))
  
  file <- NULL
  segmentAnalysis <- rbind(segmentAnalysis, data.frame(fileName,header, code,
                                                       text, data, bss, rdata, 
                                                       edata, idata))
  }
  
  return(segmentAnalysis)

}