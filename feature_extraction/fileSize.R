
trainDir <- "./data/train/"

fileName <- list.files()

fileSizes <- NULL


for (v in fileName)
  {
    fileName <- v
    fileSize <- file.info(v)$size
    
    fileSizes <- rbind(fileSizes, data.frame(fileName, fileSize))
                                                          
  #fileSizes <- c(fileSizes,file.info(v)$size)
  }


