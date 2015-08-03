##------Task 0 Understanding the problem-------------------------- 
# 1. Obtaining the data
# 2. Familiarizing yourself with NLP and text mining

setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(wordcloud) # for wordcloud plotting
library(ggplot2)


# read in original data
blogs <- readLines("en_US.blogs.txt")
# randomly select a sample
set.seed(123456)
# rbinom(N,1,p): generates a sequence of N trials, each with 
# probability p of success. R returns a sequence of 1's and 0's
index <- rbinom(n = length(blogs), size = 1, prob = 0.02) # containing 10% 1
blogs <- blogs[index==1] # selecting those lines with index==1
# save the sample into file for future use
write.csv(blogs, file = "blogs.sample.csv", row.names = FALSE, col.names = FALSE)


# read in original data
twitter <- readLines("en_US.twitter.txt")
# randomly select a sample
set.seed(123456)
index <- rbinom(n = length(twitter), size = 1, prob = 0.02) # containing 10% 1
twitter <- twitter[index==1] # selecting those lines with index==1
# save the sample into file for future use
write.csv(twitter, file = "twitter.sample.csv", row.names = FALSE, col.names = FALSE)


# read in original data
news <- readLines("en_US.news.txt")
# randomly select a sample
set.seed(123456)
index <- rbinom(n = length(news), size = 1, prob = 0.02) # containing 10% 1
news <- news[index==1] # selecting those lines with index==1
# save the sample into file for future use
write.csv(news, file = "news.sample.csv", row.names = FALSE, col.names = FALSE)

# clean up global environment
rm(blogs, twitter, news)


# combine three sample datasets into a corpus
corpus <- Corpus(DirSource("./sample/"), readerControl = list(language="en_US"))
corpus <- tm_map(corpus, PlainTextDocument)

# Preprocessing
#corpus <- tm_map(corpus, content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")), 
#                 mc.cores=2)

# transform to lower case
corpus <- tm_map(corpus, content_transformer(tolower))
# removing punctuation
corpus<- tm_map(corpus,content_transformer(removePunctuation))
# removing numbers
corpus<- tm_map(corpus,content_transformer(removeNumbers))

# removing special signs: [[:alnum:]] means [0-9A-Za-z]
removespecial <- function(x) gsub("[^[0-9A-Za-z]]"," ",x)
corpus<- tm_map(corpus, content_transformer(removespecial))

# removing English stop words
corpus<- tm_map(corpus,removeWords,stopwords("english"))
# removing profanity words: need to create profanity list
profanitylist <- readLines("profanity.txt")
corpus<- tm_map(corpus,removeWords,profanitylist)
# stem
#corpus <- tm_map(corpus, stemDocument, language = "english")
# removing white space
corpus<- tm_map(corpus, stripWhitespace)

# create a wordcloud
wordcld <- wordcloud (corpus, scale=c(4,0.5), max.words=200, 
                      random.order=FALSE, rot.per=0.4, 
                      use.r.layout=FALSE, colors=brewer.pal(8, 'Dark2'))



library(ngram)

a <- "I have a dream that one day I have a dream"
ng <- ngram(a, n = 2)


str <- "A B A C A B B"
ng <- ngram(str, n=2)
ng


#---From forum-------------------------
#TA
library(tm)
library(RWeka)
Tokenizer <- function(x) NGramTokenizer(x, Weka_control(min=1, max=3))
control <- list(tokenize=Tokenizer, tolower=TRUE)
dtm <- DocumentTermMatrix(corpus, control=control)
# This is a simple way to get started, but you may find it 
# limiting once you want to try novel algorithms or load all the data.



#--------------------





inspect(corpus)
# create a term-document matrix for corpus data set
corpusTDM <- TermDocumentMatrix(corpus) 

corpusDTM <- DocumentTermMatrix(corpus) # rows: doc ID; col: term
inspect(corpusDTM[1:3,1:3])

# word frequencies
#corpusDTMHighFreq <- findFreqTerms(corpusDTM, lowfreq = 10, highfreq = Inf)

test <- WordTokenizer(corpus)
test1 <- data.frame(table(test))
# tokenization
# unigram
unigram <- NGramTokenizer(corpus, control =Weka_control(min = 1, max = 1))
unigram <- data.frame(table(unigram))
unigram <-unigram[order(unigram$Freq, decreasing = TRUE),]
colnames(unigram) <- c("Word","Freq")

# bigram
bigram <- NGramTokenizer(corpus, control =Weka_control(min = 2, max = 2))
bigram <- data.frame(table(bigram))
bigram <-bigram[order(bigram$Freq, decreasing = TRUE),]
colnames(bigram) <- c("Word","Freq")

# trigram
trigram <- NGramTokenizer(corpus, control =Weka_control(min = 3, max = 3))
trigram <- data.frame(table(trigram))
trigram <-trigram[order(trigram$Freq, decreasing = TRUE),]
colnames(trigram) <- c("Word","Freq")


saveRDS(unigram, file = "./sample/unigram.Rda")
saveRDS(bigram, file = "./sample/bigram.Rda")
saveRDS(trigram, file = "./sample/trigram.Rda")

unigram <- readRDS("./sample/unigram.Rda")
bigram <- readRDS("./sample/bigram.Rda")
trigram <- readRDS("./sample/trigram.Rda")

aa <- grep("^right(.*)", bigram$Word, value = TRUE)


grep("^case(.*)", bigram$Word, value = TRUE)

grep("^mean(.*)", bigram$Word, value = TRUE)

grep("^make me (.*)", trigram$Word, value = TRUE)

grep("^make (.*)", bigram$Word, value = TRUE)

grep("^struggl r(.*)", bigram$Word, value = TRUE)
grep("^struggl d(.*)", bigram$Word, value = TRUE)
grep("^struggl p(.*)", bigram$Word, value = TRUE)
grep("^struggl c(.*)", bigram$Word, value = TRUE)

grep("^still struggl(.*)", trigram$Word, value = TRUE)

grep("^refere$", unigram$Word, value = TRUE)
grep("^defens$", unigram$Word, value = TRUE)
grep("^player$", unigram$Word, value = TRUE)
grep("^crowd$", unigram$Word, value = TRUE)

grep("^refere$", unigram$Word, value = FALSE)
grep("^defens$", unigram$Word, value = FALSE)
grep("^player$", unigram$Word, value = FALSE)
grep("^crowd$", unigram$Word, value = FALSE)


grep("^at the(.*)", trigram$Word, value = TRUE)
grep("^date at(.*)", trigram$Word, value = TRUE)
grep("^date(.*)", bigram$Word, value = TRUE)


grep("^date m(.*)", bigram$Word, value = TRUE)
grep("^date g(.*)", bigram$Word, value = TRUE)
grep("^date m(.*)", bigram$Word, value = TRUE)
grep("^date b(.*)", bigram$Word, value = TRUE)

grep("^mall$", unigram$Word, value = TRUE)
grep("^groceri$", unigram$Word, value = TRUE)
grep("^movi$", unigram$Word, value = TRUE)
grep("^beach$", unigram$Word, value = TRUE)

grep("^mall$", unigram$Word, value = FALSE)
grep("^groceri$", unigram$Word, value = FALSE)
grep("^movi$", unigram$Word, value = FALSE)
grep("^beach$", unigram$Word, value = FALSE)



grep("^on my(.*)", trigram$Word, value = TRUE)
grep("^my (.*)", bigram$Word, value = TRUE)

grep("^motorcycl(.*)", unigram$Word, value = TRUE)
grep("^phon(.*)", unigram$Word, value = TRUE)
grep("^way(.*)", unigram$Word, value = TRUE)
grep("^hors(.*)", unigram$Word, value = TRUE)

grep("^motorcycl(.*)", unigram$Word, value = FALSE)
grep("^phone$", unigram$Word, value = FALSE)
grep("^way$", unigram$Word, value = FALSE)
grep("^hors$", unigram$Word, value = FALSE)

grep("^quite (.*)", bigram$Word, value = TRUE)
grep("^some (.*)", bigram$Word, value = TRUE)
grep("^see(.*))", bigram$Word, value = TRUE)


grep("^time$", unigram$Word, value = TRUE)
grep("^year$", unigram$Word, value = TRUE)
grep("^week$", unigram$Word, value = TRUE)
grep("^thing$", unigram$Word, value = TRUE)

grep("^time$", unigram$Word, value = FALSE)
grep("^year$", unigram$Word, value = FALSE)
grep("^week$", unigram$Word, value = FALSE)
grep("^thing$", unigram$Word, value = FALSE)

grep("^littl ey(.*)", bigram$Word, value = TRUE)
grep("^littl toe(.*)", bigram$Word, value = TRUE)
grep("^littl finger(.*)", bigram$Word, value = TRUE)
grep("^littl ear(.*)", bigram$Word, value = TRUE)

grep("^littl toe(.*)", bigram$Word, value = FALSE)
grep("^littl finger(.*)", bigram$Word, value = FALSE)

grep("^dur(.*)", bigram$Word, value = TRUE)
grep("^faith(.*)", trigram$Word, value = TRUE)

grep("^hard$", unigram$Word, value = TRUE)
grep("^bad$", unigram$Word, value = TRUE)
grep("^wors$", unigram$Word, value = TRUE)
grep("^sad$", unigram$Word, value = TRUE)

grep("^hard$", unigram$Word, value = FALSE)
grep("^bad$", unigram$Word, value = FALSE)
grep("^wors$", unigram$Word, value = FALSE)
grep("^sad$", unigram$Word, value = FALSE)

grep("^must in(.*)", bigram$Word, value = TRUE)
grep("^must a(.*)", bigram$Word, value = TRUE)
grep("^must call(.*)", bigram$Word, value = TRUE)

grep("^insensit$", unigram$Word, value = TRUE)
grep("^insane$", unigram$Word, value = TRUE)
grep("^asleep$", unigram$Word, value = TRUE)
grep("^callous$", unigram$Word, value = TRUE)

grep("^insensit$", unigram$Word, value = FALSE)
grep("^insane$", unigram$Word, value = FALSE)
grep("^asleep$", unigram$Word, value = FALSE)
grep("^callous$", unigram$Word, value = FALSE)






head(unigram,20)

par(mar = c(10,8,2,2), las = 2)
barplot( height = unigram$Freq[1:20], names.arg = unigram$Word[1:20], horiz = FALSE, col = heat.colors(20) , main = "Top 20 Unigram Word" , ylab = "Frequency")
barplot( height = bigram$Freq[1:20], names.arg = bigram$Word[1:20], horiz = FALSE, col = heat.colors(20) , main = "Top 20 Bigram Word" , ylab = "Frequency")
barplot( height = trigram$Freq[1:20], names.arg = trigram$Word[1:20], horiz = FALSE, col = heat.colors(20) , main = "Top 20 Trigram Word" , ylab = "Frequency")

unigram$ratio <- sapply(1:length(unigram$Word), function(x) sum(unigram$Freq[1:x]))
unigram$ratio <- unigram$ratio*100/sum(unigram$Freq)
plot(unigram$ratio)

unigram$no <- 1:length(unigram$Word)

g <- ggplot(unigram, aes(x = no, y = ratio))
g + geom_line() + labs(title = "Number of Unique Word vs. Their Coverage of Total Words") + labs(x = "Number of Unique Word", y = "Coverage of Total Words (%)")






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

con <- file("en_US.blogs.txt","r")
lineBlogs <- readLines(con, 10)
close(con)

con <- file("en_US.twitter.txt","r")
lineTwitter <- readLines(con, n = 10)
close(con)

con <- file("en_US.news.txt","r")
lineNews <- readLines(con)
close(con)



# 1. Tokenization - identifying appropriate tokens such as words, 
# punctuation, and numbers. Writing a function that takes a file as 
# input and returns a tokenized version of it.

a <- lineNews[1]
a

b <- strsplit(a," ")
b

# seems treating each line in lineNews as a document
txt <- VectorSource(lineNews)
txt.corpus <- Corpus(txt)
inspect(txt.corpus)

# transforming into lower case
txt.corpus<- tm_map(txt.corpus,tolower)
# removing punctuation
txt.corpus<- tm_map(txt.corpus,removePunctuation)
# removing numbers
txt.corpus<- tm_map(txt.corpus,removeNumbers)
# removing English stop words
txt.corpus<- tm_map(txt.corpus,removeWords,stopwords("english"))
# use txt.corpus[1][[1]] to check the text content

txt.corpus<- tm_map(txt.corpus, stemDocument) # stem


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








