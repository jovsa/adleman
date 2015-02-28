library(rmongodb)
mongo <- mongo.create()

if(mongo.is.connected(mongo) == TRUE)
{
  #The name of the collection specified as db.collection
  collection <- "adleman.test1"
  
  #Read all data
  all_results <- mongo.find.all(mongo, collection)
  
  #query for people over the age of 50
  query <- list('age' = list ('$gte' = 50))
  over_results <- mongo.find.all(mongo, collection, query)
  
  #Inserting some data
  a <- mongo.bson.from.JSON('{"name":"John","last name":"Judi","age":75}')
  mongo.insert(mongo,collection,a)
}


