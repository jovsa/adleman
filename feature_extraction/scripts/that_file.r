itemNames <- c("Good","Better","Best")
itemSizes <- c(1,2,3)
itemHeights <- c(4,5,6)
table <- data.frame(itemSizes,itemHeights)
rownames(table) = itemNames

library(rmongodb)
library(RJSONIO)
mongo <- mongo.create()

if (mongo.is.connected(mongo) == TRUE)
{
  collection <- "adleman_test"
  
  for (i in 1:nrow(table))
  {
    print(toJSON(table[i,]))
    #table[i,"itemSizes"]
    #table[i,"itemHeights"]
    #print(table[2,1])
    #print(table[2,2])
    #print(table[3,2])
  }
  
  #mongo.insert(mongo,collection,a)
}

