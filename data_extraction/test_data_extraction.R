
sampleSubmission <- read.csv("./data/sampleSubmission.csv")

testFiles <- sampleSubmission[, "Id"]

S3Loc <- "https://s3-us-west-2.amazonaws.com/test-kaggle-microsoft-big2015/"


# Dowloading files to the EC2 instance
for (i in 1:length(testFiles)){
  print(i)
  fileName <- toString(testFiles[i])
  fileLoc <- paste0(S3Loc,fileName)
  
  # For the .asm file
  download.file(paste0(fileLoc,".asm"),
                mode = "wb",
                destfile = paste0("./data/test/",fileName,".asm"),
                extra = getOptions("download.file.extra"))
  
  # For the .byte file
  download.file(paste0(fileLoc,".bytes"),
                mode = "wb",
                destfile = paste0("./data/test/",fileName,".bytes"),
                extra = getOptions("download.file.extra"))
  
}



