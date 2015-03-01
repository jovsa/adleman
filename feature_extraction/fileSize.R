

fileNameBytes <- list.files("./data/train/", pattern="*.bytes",full.names=TRUE)
fileNameAsm <- list.files("./data/train/", pattern="*.asm",full.names=TRUE)



if(length(fileNameBytes) == length(fileNameAsm)){
  numFiles <- length(fileNameBytes)
  fileSizes <- NULL
}

for (v  in 1:numFiles)
  {
    fileName <- substr(fileNameBytes[v], 14,33)
    fileSizeBytes <- file.info(fileNameBytes[v])$size
    fileSizeAsm <- file.info(fileNameAsm[v])$size

    fileSizes <- rbind(fileSizes, data.frame(fileName, fileSizeBytes, fileSizeAsm ))                                                      
  }


