setwd("/Users/dani/Desktop/senior research/")

### TO DO: set tweetTable to NULL the first time


## run the next line the first time (choose 1)
tweetTable1 = NULL
#tweetTable2 = NULL
#tweetTable3 = NULL

# if not the first time, run the statement below (choose 1)
load("tweetTable1.RData")
#load("tweetTable2.RData")
#load("tweetTable2.RData")


library(twitteR)
consumer_key = "HkZZquHaB0JKnWagbaPLSdF1p"
consumer_secret = "WPgezOYM4PEBl9m7eBDBQ66w9pCftkRRUnFVH2VlJl2ERrYjki"
access_token= "541048490-DYrzn7MzcP1AbvXAORuTl7WVq1Phlq4IEBZzLXkR"
access_secret = "GBHRXQS1hE7Wfha7gwNQw5AVrUvWYFhgTqDKDvUNbZupE"

setup_twitter_oauth(consumer_key, consumer_secret,
                    access_token = access_token,
                    access_secret = access_secret)


time = Sys.time()
##choose 1
res = searchTwitter("First night without dance this semester! #sadness but great weekend with show and banquet!!", n = 100)
#res = searchTwitter("Come see Get out tonight in the stu theatre @8pm! Free popcorn before the movie @ 7:30! First come first servce basis so get there early!", n = 100)
#res = searchTwitter("President Andrew Jackson, who died 16 years before the Civil War started, saw it coming and was angry. Would never have let it happen! ", n = 100)


person = list(name = "Danielle", major = "NMS", numbers = 1:3)

getRetweetCount <-function(x) {
  return (x$retweetCount)
}

# find number of retweets and the most retweeted one
retweets = sapply(res, getRetweetCount)
w = which.max(retweets)
num.max = retweets[w] 
i = retweets == num.max
x = res[[w]]

newRow <- data.frame(tweet = x$text, time = time, retweetCount = num.max)

##choose 1 set

tweetTable1 = rbind(tweetTable1, newRow)
save(tweetTable1, file = "tweetTable1.RData")
#tweetTable2 = rbind(tweetTable2, newRow)
#save(tweetTable2, file = "tweetTable2.RData")
#tweetTable3 = rbind(tweetTable3, newRow)
#save(tweetTable3, file = "tweetTable3.RData")



