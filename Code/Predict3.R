#--------set working directory and load library----------------
setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)

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


test1 <- "When you breathe, I want to be the air for you. I'll be there for you, I'd live and I'd"
test2 <- "Guy at my table's wife got up to go to the bathroom and I asked about dessert and he started telling me about his"
test3 <- "I'd give anything to see arctic monkeys this"
test4 <- "Talking to your mom has the same effect as a hug and helps reduce your"
test5 <- "When you were in Holland you were like 1 inch away from me but you hadn't time to take a"
test6 <- "I'd just like all of these questions answered, a presentation of evidence, and a jury to settle the"
test7 <- "I can't deal with unsymetrical things. I can't even hold an uneven number of bags of groceries in each"
test8 <- "Every inch of you is perfect from the bottom to the"
test9 <- "I'm thankful my childhood was filled with imagination and bruises from playing"
test10 <- "I like how the same people are in almost all of Adam Sandler's"

test11 <- "university of"

unigram <- readRDS("./NGram/uniFinal.Rda")
bigram <- readRDS("./NGram/biFinal2.Rda")
trigram <- readRDS("./NGram/triFinal2.Rda")
quadrigram <- readRDS("./NGram/quadriFinal2.Rda")

bi <- readRDS("./NGram/biFinal.Rda")
tri <- readRDS("./NGram/triFinal.Rda")
quadri <- readRDS("./NGram/quadriFinal.Rda")


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
        
        if(wordcount>=3){ 
                inputWord <- words[(wordcount-2):wordcount]
        }else if(wordcount == 2){ 
                inputWord <- c("", words)
        }else if(wordcount == 1){
                inputWord <- c("", "", words)
        }
        
        # use quadrigram to predict
        nextWord1 <- as.character(quadrigram[quadrigram$First==inputWord[1] & quadrigram$Second==inputWord[2] & quadrigram$Third==inputWord[3],]$Fourth)
        nextWord <- nextWord1
        if(length(nextWord1) == 0){
                # use trigram to predict
                nextWord2 <- as.character(trigram[trigram$First==inputWord[2] & trigram$Second==inputWord[3],]$Third)
                nextWord <- c(nextWord,nextWord2)
                if(length(nextWord2) == 0){
                        # use bigram to predict
                        nextWord3 <- as.character(bigram[bigram$First==inputWord[3],]$Second)
                        nextWord <- c(nextWord,nextWord3)
                        if(length(nextWord3) == 0){
                                nextWord4 <- as.character(unigram$Word[1:6])
                                nextWord <- c(nextWord,nextWord4)
                        }
                }
        }
        # output 
        if(length(nextWord) <= 10)
                res <- unique(nextWord[1:length(nextWord)])
        else
               res <- unique(nextWord[1:10]) 
        grep("^[a-zA-Z]{2}",res,value=TRUE)
}


predictNextWord1 <- function(cleanText){
        words <- unlist(strsplit(cleanText," ")) 
        wordcount <- length(words)
        
        if(wordcount>=3){ 
                inputWord <- words[(wordcount-2):wordcount]
        }else if(wordcount == 2){ 
                inputWord <- c("", words)
        }else if(wordcount == 1){
                inputWord <- c("", "", words)
        }
        
        # use quadrigram to predict
        nextWord1 <- as.character(quadrigram[(quadrigram$First==inputWord[1]|stemDocument(as.character(quadrigram$First))==stemDocument(inputWord[1])) & (quadrigram$Second==inputWord[2]|stemDocument(as.character(quadrigram$Second))==stemDocument(inputWord[2])) & (quadrigram$Third==inputWord[3]|stemDocument(as.character(quadrigram$Third))==stemDocument(inputWord[3])),]$Fourth)
        nextWord <- nextWord1
        if(length(nextWord1) == 0){
                # use trigram to predict
                nextWord2 <- as.character(trigram[(trigram$First==inputWord[2]|stemDocument(as.character(trigram$First))==stemDocument(inputWord[2])) & (trigram$Second==inputWord[3]|stemDocument(as.character(trigram$Second))==stemDocument(inputWord[3])),]$Third)
                nextWord <- c(nextWord,nextWord2)
                if(length(nextWord2) == 0){
                        # use bigram to predict
                        nextWord3 <- as.character(bigram[(bigram$First==inputWord[3]|stemDocument(as.character(bigram$First))==stemDocument(inputWord[3])),]$Second)
                        nextWord <- c(nextWord,nextWord3)
                        if(length(nextWord3) == 0){
                                nextWord4 <- as.character(unigram$Word[1:6])
                                nextWord <- c(nextWord,nextWord4)
                        }
                }
        }
        # output 
        if(length(nextWord) <= 10)
                res <- unique(nextWord[1:length(nextWord)])
        else
                res <- unique(nextWord[1:10]) 
        grep("^[a-zA-Z]{2}",res,value=TRUE)
}

predictNextWord2 <- function(cleanText){
        words <- unlist(strsplit(cleanText," ")) 
        wordcount <- length(words)
        
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
                res <- unique(nextWord[1:20]) 
        grep("^[a-zA-Z]{2}",res,value=TRUE)
}

text11 <- cleanText(test11)
predictNextWord(text11)
predictNextWord1(text11)
predictNextWord2(text11)






text1 <- cleanText(test1)
predictNextWord(text1)
predictNextWord1(text1)
predictNextWord2(text1)


text2 <- cleanText(test2)
predictNextWord(text2)
predictNextWord1(text2)
predictNextWord2(text2)

text3 <- cleanText(test3)
predictNextWord(text3)
predictNextWord1(text3)
predictNextWord2(text3)

text4 <- cleanText(test4)
predictNextWord(text4)
predictNextWord1(text4)
predictNextWord2(text4)

text5 <- cleanText(test5)
predictNextWord(text5)
predictNextWord1(text5)
predictNextWord2(text5)

text6 <- cleanText(test6)
predictNextWord(text6)
predictNextWord1(text6)
predictNextWord2(text6)

text7 <- cleanText(test7)
predictNextWord(text7)
predictNextWord1(text7)
predictNextWord2(text7)

text8 <- cleanText(test8)
predictNextWord(text8)
predictNextWord1(text8)
predictNextWord2(text8)

text9 <- cleanText(test9)
predictNextWord(text9)
predictNextWord1(text9)
predictNextWord2(text9)

text10 <- cleanText(test10)
predictNextWord(text10)
predictNextWord1(text10)
predictNextWord2(text10)


print(text1) # live and id          + die
print(text2) # me about his         spiritual (wrong)  should be marital
print(text3) # arctic monkey this   morning? (wrong) or weekend?   ! should be weekend
print(text5) # to take a            + picture
print(text6) # to settl the         case (wrong) should be matter

print(text4) # help reduc your      stress
print(text7) # groceri in each      hand
print(text8) # bottom to the        + top
print(text9) # bruis from play      outside
print(text10) # of adam sandler     movie

unigram <- readRDS("./NGram/uniFinal.Rda")
bigram <- readRDS("./NGram/biFinal.Rda")
trigram <- readRDS("./NGram/triFinal.Rda")
quadrigram <- readRDS("./NGram/quadriFinal.Rda")


trigram[grep("^and id di", trigram$Word, value = FALSE),] # 0 
trigram[grep("^and id sleep", trigram$Word, value = FALSE),] # 0
trigram[grep("^and id eat", trigram$Word, value = FALSE),] # 0
trigram[grep("^and id giv", trigram$Word, value = FALSE),] # 0
bigram[grep("^id die", bigram$Word, value = FALSE),] # 62 
bigram[grep("^id sleep", bigram$Word, value = FALSE),] # 11
bigram[grep("^id eat", bigram$Word, value = FALSE),] # 32
bigram[grep("^id give", bigram$Word, value = FALSE),] # 270

trigram[grep("^about his marit", trigram$Word, value = FALSE),] # 0
trigram[grep("^about his horticultur", trigram$Word, value = FALSE),] # 0
trigram[grep("^about his financi", trigram$Word, value = FALSE),] # 0
trigram[grep("^about his spiritu", trigram$Word, value = FALSE),] # 0
bigram[grep("^his marit", bigram$Word, value = FALSE),] # 0 
bigram[grep("^his horticultur", bigram$Word, value = FALSE),] # 0
bigram[grep("^his financi", bigram$Word, value = FALSE),] # 18
bigram[grep("^his spiritu", bigram$Word, value = FALSE),] # 32

trigram[grep("^monkey this ", trigram$Word, value = FALSE),] #0
bigram[grep("^this morn", bigram$Word, value = FALSE),] # 10615
bigram[grep("^this decad", bigram$Word, value = FALSE),] # 62
bigram[grep("^this weekend", bigram$Word, value = FALSE),] # 9747
bigram[grep("^this month", bigram$Word, value = FALSE),] # 3062

trigram[grep("^reduc your ", trigram$Word, value = FALSE),]
bigram[grep("^your sleepi", bigram$Word, value = FALSE),] # 15
bigram[grep("^your happi", bigram$Word, value = FALSE),] # 
bigram[grep("^your stress", bigram$Word, value = FALSE),] # 67
bigram[grep("^your hunger", bigram$Word, value = FALSE),] # 33


trigram[grep("^take a look", trigram$Word, value = FALSE),] # 1317
trigram[grep("^take a walk", trigram$Word, value = FALSE),] # 190
trigram[grep("^take a pictur", trigram$Word, value = FALSE),] # 553
trigram[grep("^take a minut", trigram$Word, value = FALSE),] # 160


trigram[grep("^settl the ", trigram$Word, value = FALSE),] # 0 
bigram[grep("^the incid", bigram$Word, value = FALSE),] # 540
bigram[grep("^the account", bigram$Word, value = FALSE),] # 460
bigram[grep("^the matter", bigram$Word, value = FALSE),] # 1082
bigram[grep("^the case", bigram$Word, value = FALSE),] # 4252

trigram[grep("^in each toe", trigram$Word, value = FALSE),] # 0
trigram[grep("^in each finger", trigram$Word, value = FALSE),] # 0
trigram[grep("^in each arm", trigram$Word, value = FALSE),] # 0
trigram[grep("^in each hand", trigram$Word, value = FALSE),] # 18

bigram[grep("^each toe", bigram$Word, value = FALSE),] # 0
bigram[grep("^each finger", bigram$Word, value = FALSE),] # 0
bigram[grep("^each arm", bigram$Word, value = FALSE),] # 22
bigram[grep("^each hand", bigram$Word, value = FALSE),] # 41

trigram[grep("^to the middl", trigram$Word, value = FALSE),] # 141
trigram[grep("^to the center", trigram$Word, value = FALSE),] # 165
trigram[grep("^to the top", trigram$Word, value = FALSE),] # 964
trigram[grep("^to the side", trigram$Word, value = FALSE),] # 393

trigram[grep("^from play ", trigram$Word, value = FALSE),]
bigram[grep("^play insid", bigram$Word, value = FALSE),] # 20
bigram[grep("^play daili", bigram$Word, value = FALSE),] # 0
bigram[grep("^play week", bigram$Word, value = FALSE),] # 0
bigram[grep("^play outsid", bigram$Word, value = FALSE),] # 150

trigram[grep("^adam sandler ", trigram$Word, value = FALSE),]
trigram[grep("^sandler ", trigram$Word, value = FALSE),]
bigram[grep("^sandler ", bigram$Word, value = FALSE),]

unigram[grep("^movi", unigram$Word, value = FALSE),] # 27746
unigram[grep("^pictur", unigram$Word, value = FALSE),] # 23862
unigram[grep("^novel", unigram$Word, value = FALSE),] # 8239
unigram[grep("^stori", unigram$Word, value = FALSE),] # 37881
