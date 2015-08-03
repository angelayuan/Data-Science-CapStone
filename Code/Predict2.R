#--------set working directory and load library----------------
setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)
#library(wordcloud) # for wordcloud plotting
#library(ggplot2)

##-------Modeling------------------------------------------
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
        removespecial <- function(x) gsub("[^( )[:alnum:]]|á|â|ã|ä|å","",x)
        text<- tm_map(text, content_transformer(removespecial))
        # removing profanity words: need to create profanity list
        #profanitylist <- readLines("profanity.txt")
        #text<- tm_map(text,removeWords,profanitylist)
        # stem
        #text <- tm_map(text, stemDocument, language = "english")
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
        if(wordcount>=3){ # using last three words to predict new word
                qua <- grep(pattern(words,3), quadrigram$Word, value = FALSE)
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(qua,tri,bi)
        }else if(wordcount == 2){ # using last two words to predict new word
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(tri,bi) 
        }else if(wordcount == 1){
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(bi) 
        }
}




predictNextWord <- function(cleanText){
        words <- unlist(strsplit(cleanText," ")) 
        wordcount <- length(words)
        wordlist <-
        if(wordcount>=3){ # using last three words to predict new word
                qua <- grep(pattern(words,3), quadrigram$Word, value = FALSE)
                qlen <- length(qua[[1]])
                if(qlen==0){}
                
                
                
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(qua,tri,bi)
        }else if(wordcount == 2){ # using last two words to predict new word
                tri <- grep(pattern(words,2), trigram$Word, value = FALSE)
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(tri,bi) 
        }else if(wordcount == 1){
                bi <- grep(pattern(words,1), bigram$Word, value = FALSE)
                set <- list(bi) 
        }
}



text1 <- cleanText(test1)
set1 <- GetPredictSet(text1)
num = length(set1)
length(set1[[1]])
length(set1[[2]])
length(set1[[3]])



text2 <- cleanText(test2)
text3 <- cleanText(test3)
text4 <- cleanText(test4)
text5 <- cleanText(test5)
text6 <- cleanText(test6)
text7 <- cleanText(test7)
text8 <- cleanText(test8)
text9 <- cleanText(test9)
text10 <- cleanText(test10)


print(text1) # live and id          give (wrong)    !!! die
print(text2) # me about his         spiritual (wrong)  should be marital
print(text3) # arctic monkey this   morning? (wrong) or weekend?   ! should be weekend
print(text5) # to take a            look (wrong)   !try picture
print(text6) # to settl the         case (wrong) should be matter

print(text4) # help reduc your      stress
print(text7) # groceri in each      hand
print(text8) # bottom to the        top
print(text9) # bruis from play      outside
print(text10) # of adam sandler     stories?? or movie??? answer is movie


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

cleanText("top")



