#--------set working directory and load library----------------
setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)
#library(wordcloud) # for wordcloud plotting
#library(ggplot2)

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


unigram <- readRDS("./unigram/uniFinal.Rda")
bigram <- readRDS("./bigram/bi10Freq.Rda")
trigram <- readRDS("./trigram/tri10Freq.Rda")

cleanText <- function(inputText){
        text <- Corpus(VectorSource(inputText))
        #inspect(text)
        text <- tm_map(text, content_transformer(tolower))
        text<- tm_map(text,content_transformer(removeNumbers))
        # removing special signs: [[:alnum:]] means [0-9A-Za-z]
        text<- tm_map(text,content_transformer(removePunctuation))
        removespecial <- function(x) gsub("[^( )[:alnum:]]|á|â|ã|ä|å","",x)
        text<- tm_map(text, content_transformer(removespecial))
        # removing profanity words: need to create profanity list
        #profanitylist <- readLines("profanity.txt")
        #text<- tm_map(text,removeWords,profanitylist)
        # stem
        text <- tm_map(text, stemDocument, language = "english")
        # removing white space
        text<- tm_map(text, stripWhitespace)
        text[[1]]$content[1]
}

pattern <- function(words,n) {
        wordcount <- length(words)
        lastn <- paste(words[(wordcount-n+1):wordcount], collapse = " ")
        pattern <- paste(c("^",lastn," "), collapse = "")
        pattern        
}

GetPredictSet <- function(cleanText){
        words <- unlist(strsplit(cleanText," ")) 
        wordcount <- length(words)
        if(wordcount>=3){# using last three words to predict new word
                #qua <- grep(pattern(words,3), quadrigram$Word, value = FALSE)
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                #set <- list(qua,tri,bi)
                set <- list(tri,bi)
        }else if(wordcount == 2){
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(tri,bi) 
        }else if(wordcount == 1){
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(bi) 
        }
}



text1 <- cleanText(test1)
text2 <- cleanText(test2)
text3 <- cleanText(test3)
text4 <- cleanText(test4)
text5 <- cleanText(test5)
text6 <- cleanText(test6)
text7 <- cleanText(test7)
text8 <- cleanText(test8)
text9 <- cleanText(test9)
text10 <- cleanText(test10)


print(text1) # a case of         beer
print(text2) # would mean the    world
print(text3) # make me the       happiest
print(text4) # struggl but the   crowd???
print(text5) # date at the       beach
print(text6) # be on my          way
print(text7) # in quit some      time
print(text8) # with his littl    finger
print(text9) # faith dure the    bad
print(text10) # you must be      asleep...><   answer is insane


trigram[grep("^case of ", trigram$Word, value = FALSE),] # freq 40 beer
trigram[grep("^mean the ", trigram$Word, value = FALSE),] # freq 417 world
trigram[grep("^me the ", trigram$Word, value = FALSE),] # freq 41 happiest

trigram[grep("^but the crowd", trigram$Word, value = FALSE),] # 13
trigram[grep("^but the refer", trigram$Word, value = FALSE),] # non
trigram[grep("^but the player", trigram$Word, value = FALSE),] # non
trigram[grep("^but the defen", trigram$Word, value = FALSE),] # non
bigram[grep("^the crowd",bigram$Word, value = FALSE),] # 2021
bigram[grep("^the refer", bigram$Word, value = FALSE),] # 116
bigram[grep("^the player", bigram$Word, value = FALSE),]# 1174
bigram[grep("^the defen", bigram$Word, value = FALSE),]# 505
unigram[grep("^crowd",unigram$Word, value = FALSE),] # 6060
unigram[grep("^refer", unigram$Word, value = FALSE),] # 337
unigram[grep("^player", unigram$Word, value = FALSE),]# 12733
unigram[grep("^defen", unigram$Word, value = FALSE),]# 5077

trigram[grep("^at the ", trigram$Word, value = FALSE),]
trigram[grep("^at the mall", trigram$Word, value = FALSE),] # 332
trigram[grep("^at the grocer", trigram$Word, value = FALSE),] # 216
trigram[grep("^at the beach", trigram$Word, value = FALSE),] # 483
trigram[grep("^at the mov", trigram$Word, value = FALSE),] # 186

trigram[grep("^on my ", trigram$Word, value = FALSE),]
trigram[grep("^on my motorcycl", trigram$Word, value = FALSE),] # non
trigram[grep("^on my way", trigram$Word, value = FALSE),] # 2350
trigram[grep("^on my hors", trigram$Word, value = FALSE),] # non
trigram[grep("^on my phon", trigram$Word, value = FALSE),] # 744

trigram[grep("^quit some ", trigram$Word, value = FALSE),] # 305

trigram[grep("^his littl ", trigram$Word, value = FALSE),]
bigram[grep("^littl ey", bigram$Word, value = FALSE),] # 37
bigram[grep("^littl finger", bigram$Word, value = FALSE),] # 64
bigram[grep("^littl toe", bigram$Word, value = FALSE),] # 0
bigram[grep("^littl ear", bigram$Word, value = FALSE),] # 17
unigram[grep("^toe", unigram$Word, value = FALSE),] # 2090
unigram[grep("^finger", unigram$Word, value = FALSE),] # 6238
unigram[grep("^eye", unigram$Word, value = FALSE),] # 23663
unigram[grep("^ear", unigram$Word, value = FALSE),] # 4788

trigram[grep("^dure the ", trigram$Word, value = FALSE),]
trigram[grep("^dure the hard", trigram$Word, value = FALSE),] # 0
trigram[grep("^dure the bad", trigram$Word, value = FALSE),] # 0
trigram[grep("^dure the wors", trigram$Word, value = FALSE),] # 0
trigram[grep("^dure the sad", trigram$Word, value = FALSE),] # 0
bigram[grep("^the hard", bigram$Word, value = FALSE),] # 1314
bigram[grep("^the bad", bigram$Word, value = FALSE),] # 1820
bigram[grep("^the wors", bigram$Word, value = FALSE),] # 331
bigram[grep("^the sad", bigram$Word, value = FALSE),] # 517

trigram[grep("^must be callo", trigram$Word, value = FALSE),] # 0
trigram[grep("^must be insan", trigram$Word, value = FALSE),] # 0
trigram[grep("^must be insensit", trigram$Word, value = FALSE),] # 0
trigram[grep("^must be asleep", trigram$Word, value = FALSE),] # 0
bigram[grep("^be callo", bigram$Word, value = FALSE),] # 0
bigram[grep("^be insan", bigram$Word, value = FALSE),] # 113
bigram[grep("^be insensit", bigram$Word, value = FALSE),] # 10
bigram[grep("^be asleep", bigram$Word, value = FALSE),] # 114