##------Task 0 Understanding the problem-------------------------- 
# 1. Obtaining the data
# 2. Familiarizing yourself with NLP and text mining

setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
#library(openNLP)
#library(qdap)
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)
#library(wordcloud) # for wordcloud plotting
#library(ggplot2)


# read in original data
blogs <- readLines("en_US.blogs.txt")
# randomly select a sample
set.seed(123)
# rbinom(N,1,p): generates a sequence of N trials, each with 
# probability p of success. R returns a sequence of 1's and 0's
index <- rbinom(n = length(blogs), size = 1, prob = 0.02) # containing 10% 1
blogs <- blogs[index==1] # selecting those lines with index==1
# save the sample into file for future use
write.csv(blogs, file = "./sample2p/blogs.sample.csv", row.names = FALSE, col.names = FALSE)


# read in original data
twitter <- readLines("en_US.twitter.txt")
# randomly select a sample
set.seed(123)
index <- rbinom(n = length(twitter), size = 1, prob = 0.02) # containing 10% 1
twitter <- twitter[index==1] # selecting those lines with index==1
# save the sample into file for future use
write.csv(twitter, file = "./sample2p/twitter.sample.csv", row.names = FALSE, col.names = FALSE)


# read in original data
news <- readLines("en_US.news.txt")
# randomly select a sample
set.seed(123)
index <- rbinom(n = length(news), size = 1, prob = 0.02) # containing 10% 1
news <- news[index==1] # selecting those lines with index==1
# save the sample into file for future use
write.csv(news, file = "./sample2p/news.sample.csv", row.names = FALSE, col.names = FALSE)

# clean up global environment
rm(blogs, twitter, news)


# combine three sample datasets into a corpus
corpus <- Corpus(DirSource("./sample1p/"), readerControl = list(language="en_US"))
corpus <- tm_map(corpus, PlainTextDocument)

# Preprocessing
# sentence splitting
#corpus <- tm_map(corpus, sent_detect)
# transform to lower case
corpus <- tm_map(corpus, content_transformer(tolower))
# removing numbers
corpus<- tm_map(corpus,content_transformer(removeNumbers))
# removing punctuation
#corpus<- tm_map(corpus,content_transformer(removePunctuation))
# removing special signs: [[:alnum:]] means [0-9A-Za-z]
removeabbr <- function(x) gsub("'","",x)
corpus<- tm_map(corpus, content_transformer(removeabbr))
removespecial <- function(x) gsub("[^( )[:alnum:]]|á|â|ã|ä"," ",x)
corpus<- tm_map(corpus, content_transformer(removespecial))

# removing English stop words
# corpus<- tm_map(corpus,removeWords,stopwords("english"))
# removing profanity words: need to create profanity list
profanitylist <- readLines("profanity.txt")
corpus<- tm_map(corpus,removeWords,profanitylist)
# stem
corpus <- tm_map(corpus, stemDocument, language = "english")
# removing white space
corpus<- tm_map(corpus, stripWhitespace)

saveRDS(corpus, file = "./sample1p/corpus.Rda")

# create a wordcloud
wordcld <- wordcloud (corpus, scale=c(4,0.5), max.words=200, 
                      random.order=FALSE, rot.per=0.4, 
                      use.r.layout=FALSE, colors=brewer.pal(8, 'Dark2'))


#--------TOKENIZE----------------------------------
# Unigram

GetNGram <- function(theCorpus,n){
        Tokenizer <- function(x) NGramTokenizer(x, Weka_control(min= n, max= n))
        control <- list(tokenize=Tokenizer, tolower=TRUE)
        tdm <- TermDocumentMatrix(theCorpus, control=control)
        #inspect(unigram_tdm[1:10,1:3])
        #inspect(unigram_tdm[1000:1010,1:3])
        df <- melt(as.matrix(tdm), value.name = "Count")[,c("Terms","Count")]
        #object.size(df)

        ngram <- aggregate(data.frame(x = df$Count), by=list(df$Terms), FUN="sum")
        colnames(ngram) <- c("Word","Freq")
        ngram <- ngram[order(ngram$Freq, decreasing = TRUE),]
        ngram
} 

unigram <- GetNGram(corpus, 1)
bigram <- GetNGram(corpus, 2)
trigram <- GetNGram(corpus, 3)
quadrigram <- GetNGram(corpus, 4)

#----quiz 2----------------------------------
grep("^a case of", quadrigram$Word, value = TRUE)
grep("^case of", trigram$Word, value = TRUE)

grep("^of soda(.*)", bigram$Word, value = TRUE)
grep("^of chees(.*)", bigram$Word, value = TRUE)
grep("^of pretzel(.*)", bigram$Word, value = TRUE)
grep("^of beer(.*)", bigram$Word, value = TRUE)

grep("^of soda(.*)", bigram$Word, value = FALSE)
grep("^of chees(.*)", bigram$Word, value = FALSE)
grep("^of pretzel(.*)", bigram$Word, value = FALSE)
grep("^of beer(.*)", bigram$Word, value = FALSE)


grep("^would mean the(.*)", quadrigram$Word, value = TRUE)

grep("^make me the(.*)", quadrigram$Word, value = TRUE)
grep("^me the (.*)", trigram$Word, value = TRUE)

grep("^me the smell(.*)", trigram$Word, value = TRUE)
grep("^me the happi(.*)", trigram$Word, value = TRUE)
grep("^me the sad(.*)", trigram$Word, value = TRUE)
grep("^me the blu(.*)", trigram$Word, value = TRUE)


grep("^struggl but the(.*)", quadrigram$Word, value = TRUE)
grep("^but the (.*)", trigram$Word, value = TRUE)

grep("^but the refer(.*)", trigram$Word, value = TRUE)
grep("^but the defen(.*)", trigram$Word, value = TRUE)
grep("^but the player(.*)", trigram$Word, value = TRUE)
grep("^but the crowd(.*)", trigram$Word, value = TRUE)

grep("^date at the(.*)", quadrigram$Word, value = TRUE)
grep("^at the mal(.*)", trigram$Word, value = TRUE)
grep("^at the grocer(.*)", trigram$Word, value = TRUE)
grep("^at the movi(.*)", trigram$Word, value = TRUE)
grep("^at the beach(.*)", trigram$Word, value = TRUE)

grep("^at the mal(.*)", trigram$Word, value = FALSE)
grep("^at the grocer(.*)", trigram$Word, value = FALSE)
grep("^at the beach(.*)", trigram$Word, value = FALSE)

grep("^be on my(.*)", quadrigram$Word, value = TRUE)
grep("^on my motorcyc(.*)", trigram$Word, value = TRUE)
grep("^on my phone(.*)", trigram$Word, value = TRUE)
grep("^on my way(.*)", trigram$Word, value = TRUE)
grep("^on my hors(.*)", trigram$Word, value = TRUE)

grep("^on my phone(.*)", trigram$Word, value = FALSE)
grep("^on my way(.*)", trigram$Word, value = FALSE)


grep("^in quite some(.*)", quadrigram$Word, value = TRUE)
grep("^quite some(.*)", trigram$Word, value = TRUE)
grep("^some time(.*)", bigram$Word, value = TRUE)
grep("^some year(.*)", bigram$Word, value = TRUE)
grep("^some week(.*)", bigram$Word, value = TRUE)
grep("^some thing(.*)", bigram$Word, value = TRUE)

grep("^some time(.*)", bigram$Word, value = FALSE)
grep("^some year(.*)", bigram$Word, value = FALSE)
grep("^some week(.*)", bigram$Word, value = FALSE)
grep("^some thing(.*)", bigram$Word, value = FALSE)

grep("^with his littl(.*)", quadrigram$Word, value = TRUE)
grep("^his littl(.*)", trigram$Word, value = TRUE)
grep("^littl eye(.*)", bigram$Word, value = TRUE)
grep("^littl toe(.*)", bigram$Word, value = TRUE)
grep("^littl finger(.*)", bigram$Word, value = TRUE)
grep("^littl ear(.*)", bigram$Word, value = TRUE)

grep("^faith dur(.*)", quadrigram$Word, value = TRUE)
grep("^during(.*)", trigram$Word, value = TRUE)
grep("^the hard", bigram$Word, value = TRUE)
grep("^the bad", bigram$Word, value = TRUE)
grep("^the wors", bigram$Word, value = TRUE)
grep("^the sad", bigram$Word, value = TRUE)

grep("^the hard$", bigram$Word, value = FALSE)
grep("^the bad$", bigram$Word, value = FALSE)
grep("^the wors$", bigram$Word, value = FALSE)
grep("^the sad$", bigram$Word, value = FALSE)

grep("^you must be(.*)", quadrigram$Word, value = TRUE)
grep("^must be insens(.*)", trigram$Word, value = TRUE)
grep("^must be insan(.*)", trigram$Word, value = TRUE)
grep("^must be asleep(.*)", trigram$Word, value = TRUE)
grep("^must be call(.*)", trigram$Word, value = TRUE)

grep("^be insens(.*)", bigram$Word, value = TRUE)
grep("^be insan(.*)", bigram$Word, value = TRUE)
grep("^be asleep(.*)", bigram$Word, value = TRUE)
grep("^be call(.*)", bigram$Word, value = TRUE)

grep("^be insan(.*)", bigram$Word, value = FALSE)

grep("^insens(.*)", unigram$Word, value = TRUE)
grep("^insan(.*)", unigram$Word, value = TRUE)
grep("^asleep(.*)", unigram$Word, value = TRUE)
grep("^call(.*)", unigram$Word, value = TRUE)

grep("^insan(.*)", unigram$Word, value = FALSE)
grep("^asleep(.*)", unigram$Word, value = FALSE)

saveRDS(unigram, file = "./sample1p/unigram.Rda")
saveRDS(bigram, file = "./sample1p/bigram.Rda")
saveRDS(trigram, file = "./sample1p/trigram.Rda")
saveRDS(trigram, file = "./sample1p/quadrigram.Rda")

# unigram <- readRDS("./sample/unigram.Rda")
# bigram <- readRDS("./sample/bigram.Rda")
# trigram <- readRDS("./sample/trigram.Rda")













unigram$ratio <- sapply(1:length(unigram$Word), function(x) sum(unigram$Freq[1:x]))
unigram$ratio <- unigram$ratio*100/sum(unigram$Freq)
unigram$no <- 1:length(unigram$Word)





#--------------------------------------------
#--------------------------------------------
# inspection of the corpus
length(corpus) # the number of documents in the corpus
summary(corpus) # list the three documents

# view metadata for the first document
meta(corpus[[1]])
# length of each document
length(corpus[[1]]$content) # 90378
length(corpus[[2]]$content) # 7712
length(corpus[[3]]$content) # 236309

# view the first line of the first sample data
corpus[[1]]$content[2]



##-------Task 1 Data acquisition and cleaning---------------------
# Tips and hints
# You can use the file() and readLines() functions to read a fixed 
# number of lines into R to begin your exploration.


# 1. Tokenization - identifying appropriate tokens such as words, 
# punctuation, and numbers. Writing a function that takes a file as 
# input and returns a tokenized version of it.


# 2. Profanity filtering - removing profanity and other words you 
# do not want to predict.


##-------Task 2 Exploratory analysis------------------------------
# Tips and hints
# How to sample the data using file() and readLines() to obtain a 
# representative sample.
# Think hard about ways you can "compress" the data


# 1. Exploratory analysis - perform a thorough exploratory analysis 
# of the data, understanding the distribution of words and 
# relationship between the words in the corpora.


# 2. Understand frequencies of words and word pairs - build figures 
# and tables to understand variation in the frequencies of words 
# and word pairs in the data.


##-------Task 3 Modeling------------------------------------------
# Tips and hints
# Starting simply, using your sampled data
# How would you build the model if you were predicting using only 
# one previous word


# 1. Build basic n-gram model - using the exploratory analysis
# you performed, build a basic n-gram model for predicting the 
# next word based on the previous 1, 2, or 3 words.



# 2. Build a model to handle unseen n-grams - in some cases people 
# will want to type a combination of words that does not appear in 
# the corpora. Build a model to handle cases where a particular 
# n-gram isn't observed.




##-------Task 4 Prediction-----------------------------------------
# Tips and hints
# How does the model that just predicts the most frequent words 
# work in terms of accuracy?
# How much improvement do you get by using just the previous word 
# to predict the next?
# Consider building the models on smaller samples to check how they 
# perform before scaling up to the whole data set.
# When you fit a predictive model at this step, check the size of 
# the object using the object.size() function, try to build models 
# that have the smallest size possible while retaining accuracy.




# 1. Build a predictive model based on the previous data modeling
# steps - you may combine the models in any way you think is 
# appropriate.




# 2. Evaluate the model for efficiency and accuracy - use timing 
# software to evaluate the computational complexity of your model. 
# Evaluate the model accuracy using different metrics like 
# perplexity, accuracy at the first word, second word, and third word.








