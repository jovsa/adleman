# Working directory initialization

#wd <- "./Documents/GitHub/Project_Adleman" # On Jovan's local
wd <- "./GitHub/Project_Adleman" # on EC2
setwd(wd)

# Package Installation
# install.packages("rattle")
# install.packages("tm")
# install.packages("SnowballC")
# install.packages("caret")
# install.packages("plyr")
# install.packages("tau")
# install.packages("ngram")
# install.packages("knitr")
# install.packages("Matrix")
# install.packages("RWeka")
# install.packages("ggplot2")
# install.packages("reshape")
# install.packages("wordcloud")
#install.packages("Hmisc")
#install.packages("RCurl")
#install.packages("rmongodb")
# install.packages("e1071")


# Library initialization
library(rattle)
library(tm)
library(SnowballC)
library(caret)
library(plyr)
library(tau)
library(ngram)
library(knitr)
library(Matrix)
library(ggplot2)
library(reshape)
library(wordcloud)
library(Hmisc)
library(RCurl)
library(rmongodb)
library(caret)
library(e1071)

# Cleaners
wd <- NULL
