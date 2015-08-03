
#--------set working directory and load library----------------
setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)
#library(wordcloud) # for wordcloud plotting
#library(ggplot2)


#----------load original data and sample data-------------------
blogs <- readLines("en_US.blogs.txt")
# randomly select a sample
set.seed(123)
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


#----------Preprocessing---------------------------------------
# combine three sample datasets into a corpus
corpus <- Corpus(DirSource("./sample1p/"), readerControl = list(language="en_US"))
corpus <- tm_map(corpus, PlainTextDocument)

# transform to lower case
corpus <- tm_map(corpus, content_transformer(tolower))
# removing numbers
corpus<- tm_map(corpus,content_transformer(removeNumbers))
# removing special signs: [[:alnum:]] means [0-9A-Za-z]
removeabbr <- function(x) gsub("'","",x)
corpus<- tm_map(corpus, content_transformer(removeabbr))
removespecial <- function(x) gsub("[^( )[:alnum:]]|á|â|ã|ä"," ",x)
corpus<- tm_map(corpus, content_transformer(removespecial))
# removing profanity words: need to create profanity list
profanitylist <- readLines("profanity.txt")
corpus<- tm_map(corpus,removeWords,profanitylist)
# stem
# corpus <- tm_map(corpus, stemDocument, language = "english")
# removing white space
corpus<- tm_map(corpus, stripWhitespace)

saveRDS(corpus, file = "./sample1p/corpus.Rda")


#--------NGram Tokenization--------------------------------
corpus <- readRDS("./sample1p/corpus.Rda")

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

saveRDS(unigram, file = "./sample1p/unigram.Rda")
saveRDS(bigram, file = "./sample1p/bigram.Rda")
saveRDS(trigram, file = "./sample1p/trigram.Rda")
saveRDS(quadrigram, file = "./sample1p/quadrigram.Rda")

unigram <- readRDS("./sample1p/unigram.Rda")
bigram <- readRDS("./sample1p/bigram.Rda")
trigram <- readRDS("./sample1p/trigram.Rda")
quadrigram <- readRDS("./sample1p/quadrigram.Rda")

##-------Modeling------------------------------------------
test1 <- "The guy in front of me just bought a pound of bacon, a bouquet, and a case of"
test2 <- "You're the reason why I smile everyday. Can you follow me please? It would mean the"
test3 <- "Hey sunshine, can you follow me and make me the"
test4 <- "Very early observations on the Bills game: Offense still struggling but the"
test5 <- "Go on a romantic date at the"
test6 <- "Well I'm pretty sure my granny has some old bagpipes in her garage I'll dust them off and be on my"
test7 <- "Ohhhhh #PointBreak is on tomorrow. Love that film and haven't seen it in quite some"
test8 <- "After the ice bucket challenge Louis will push his long wet hair out of his eyes with his little"
test9 <- "Be grateful for the good times and keep the faith during the"
test10 <- "If this isn't the cutest thing you've ever seen, then you must be"


cleanText <- function(inputText){
        text <- Corpus(VectorSource(inputText))
        #inspect(text)
        text <- tm_map(text, content_transformer(tolower))
        text<- tm_map(text,content_transformer(removeNumbers))
        # removing special signs: [[:alnum:]] means [0-9A-Za-z]
        removeabbr <- function(x) gsub("'","",x)
        text<- tm_map(text, content_transformer(removeabbr))
        removespecial <- function(x) gsub("[^( )[:alnum:]]|á|â|ã|ä"," ",x)
        text<- tm_map(text, content_transformer(removespecial))
        # removing profanity words: need to create profanity list
        profanitylist <- readLines("profanity.txt")
        text<- tm_map(text,removeWords,profanitylist)
        # stem
        text <- tm_map(text, stemDocument, language = "english")
        # removing white space
        text<- tm_map(text, stripWhitespace)
        text[[1]]$content[1]
}

pattern <- function(words,n) {
        lastn <- paste(words[(wordcount-n+1):wordcount], collapse = " ")
        pattern <- paste(c("^",lastn," "), collapse = "")
        pattern        
}

GetPredictSet <- function(cleanText){
        words <- unlist(strsplit(cleanText," ")) 
        wordcount <- length(words)
        if(wordcount>=3){# using last three words to predict new word
                qua <- grep(pattern(words,3), quadrigram$Word, value = FALSE)
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(qua,tri,bi)        
        }else if(wordcount == 2){
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(tri,bi) 
        }else if(wordcount == 1){
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(bi) 
        }
}



text <- cleanText(test1)
sets <- GetPredictSet(text)


quadrigram[sets[[1]],]
trigram[sets[[2]],]
bigram[sets[[3]],]

grep("^of beer", bigram$Word, value = TRUE)


