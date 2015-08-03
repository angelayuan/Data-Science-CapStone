library(shiny)
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization

unigram <- readRDS("./NGram/uniFinal.Rda")
bigram <- readRDS("./NGram/biFinal2.Rda")
trigram <- readRDS("./NGram/triFinal2.Rda")
quadrigram <- readRDS("./NGram/quadriFinal2.Rda")

cleanText <- function(inputText){
        text <- Corpus(VectorSource(inputText))
        #inspect(text)
        text <- tm_map(text, content_transformer(tolower))
        text<- tm_map(text,content_transformer(removeNumbers))
        # removing special signs: [[:alnum:]] means [0-9A-Za-z]
        text<- tm_map(text,content_transformer(removePunctuation))
        removespecial <- function(x) gsub("[^( )[:alnum:]]","",x)
        text<- tm_map(text, content_transformer(removespecial))
        # removing white space
        text<- tm_map(text, stripWhitespace)
        text[[1]]$content[1]
}

predictNextWord <- function(cleanText){
        words <- unlist(strsplit(cleanText," ")) 
        wordcount <- length(words)
        inputWord <- ""
                
        if(wordcount>=3){ 
                inputWord <- words[(wordcount-2):wordcount]
        }else if(wordcount == 2){ 
                inputWord <- c("", words)
        }else if(wordcount == 1){
                inputWord <- c("", "", words)
        }
        
        # use quadrigram to predict
        nextWord1 <- as.character(quadrigram[(quadrigram$First==inputWord[1]|stemDocument(as.character(quadrigram$First))==stemDocument(inputWord[1])) & (quadrigram$Second==inputWord[2]|stemDocument(as.character(quadrigram$Second))==stemDocument(inputWord[2])) & (quadrigram$Third==inputWord[3]|stemDocument(as.character(quadrigram$Third))==stemDocument(inputWord[3])),]$Fourth)
        # use trigram to predict
        nextWord2 <- as.character(trigram[(trigram$First==inputWord[2]|stemDocument(as.character(trigram$First))==stemDocument(inputWord[2])) & (trigram$Second==inputWord[3]|stemDocument(as.character(trigram$Second))==stemDocument(inputWord[3])),]$Third)
        # use bigram to predict
        nextWord3 <- as.character(bigram[(bigram$First==inputWord[3]|stemDocument(as.character(bigram$First))==stemDocument(inputWord[3])),]$Second)
        nextWord4 <- as.character(unigram$Word[1:6])
        nextWord <- c(nextWord1, nextWord2, nextWord3, nextWord4)
        # output 
        if(length(nextWord) <= 10)
                res <- unique(nextWord[1:length(nextWord)])
        else
                res <- unique(nextWord[1:10]) 
        grep("^[a-zA-Z]{2}",res,value=TRUE)
}
