dataDir <- "./data"
S3Loc <- "https://s3-us-west-2.amazonaws.com/train-kaggle-microsoft-big2015/"

# Dowloading files to the EC2 instance
for (i in 1:nrow(subsetList)){
  
  fileName <- toString(subsetList[i,1])
  fileLoc <- paste0(S3Loc,fileName)

  # For the .asm file
   download.file(paste0(fileLoc,".asm"),
                   mode = "wb",
                   destfile = paste0("./data/train/",fileName,".asm"),
                   extra = getOptions("download.file.extra"))

  # For the .byte file
  download.file(paste0(fileLoc,".bytes"),
                mode = "wb",
                destfile = paste0("./data/train/",fileName,".bytes"),
                extra = getOptions("download.file.extra"))
  
}
