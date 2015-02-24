trainLabelsDir <- "./data/trainLabels.csv"

trainLabels <- read.csv(trainLabelsDir, header = TRUE)

# Givens
numClasses <- 9
n <- 43

# Traning Proportions
sampleSize <- NULL
classID <- NULL
for(i in 1:numClasses){classID <- c(classID, toString(i)) }

# Calculated but fixed given the traning data
prop <- c(
  0.1417924181,
  0.2280088333,
  0.2707029812,
  0.0437062937,
  0.0038645565,
  0.0691019507,
  0.0366212735,
  0.1129922709,
  0.0932094222
  )

classProp <- data.frame(classID, prop)

# Class Sample Size
classID <- NULL
for(i in 1:numClasses){classID <- c(classID, toString(i)) }

classSize <- NULL
for(i in 1:numClasses){classSize <- c(classSize, 1) }

sampleSize <- data.frame(classID, classSize)

# Calculating sample size
# Case 1
sampleSize <- cbind(sampleSize, case1 <- mapply(function(x,y){round(x*y,0)}, 
                                                x = classProp$prop,
                                                y = n)) 
names(sampleSize)[3] <- "case1"

# Case 2
sampleSize <- cbind(sampleSize, case2 <- mapply(function(x,y){round(y/x,0)}, 
                                                x = numClasses,
                                                y = n)) 
names(sampleSize)[4] <- "case2"

# Case 3
sampleSize$classSize <- mapply(function(x,y){round(mean(c(x,y)),0)}, 
                                                x = sampleSize$case1,
                                                y = sampleSize$case2) 


 
