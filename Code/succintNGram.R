#--------set working directory and load library----------------
setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)
#library(wordcloud) # for wordcloud plotting
#library(ggplot2)

#unigram <- readRDS("./NGram/uni1to50.Rda")
#bigram <- readRDS("./NGram/bi1to50.Rda")
#trigram <- readRDS("./NGram/tri1to50.Rda")
#quadrigram <- readRDS("./NGram/quadri1to50.Rda")

unigram <- readRDS("./unigram/uni10Freq.Rda")
bigram <- readRDS("./bigram/bi10Freq.Rda")
trigram <- readRDS("./trigram/tri10Freq.Rda")
quadrigram <- readRDS("./quadrigram/quadri10Freq.Rda")



format(object.size(unigram), units = "MB")
format(object.size(bigram), units = "MB")
format(object.size(trigram), units = "MB")
format(object.size(quadrigram), units = "MB")

uni <- data.frame(Word = as.character(unigram$Word), Freq = as.integer(unigram$Freq))
format(object.size(uni), units = "MB")
saveRDS(uni,"./unigram/uniFinal.Rda")

bi <- data.frame(Word = as.character(bigram$Word), Freq = as.integer(bigram$Freq))
format(object.size(bi), units = "MB")
saveRDS(bi,"./bigram/biFinal.Rda")

tri <- data.frame(Word = as.character(trigram$Word), Freq = as.integer(trigram$Freq))
format(object.size(tri), units = "MB")
saveRDS(tri,"./trigram/triFinal.Rda")

quadri <- data.frame(Word = as.character(quadrigram$Word), Freq = as.integer(quadrigram$Freq))
format(object.size(quadri), units = "MB")
saveRDS(quadri,"./quadrigram/quadriFinal.Rda")




#uni <- readRDS("./NGram/uniFinal.Rda")
bi <- readRDS("./NGram/biFinal.Rda")
tri <- readRDS("./NGram/triFinal.Rda")
quadri <- readRDS("./NGram/triFinal.Rda")

tmp <- lapply(as.character(bi$Word),strsplit, split=" ")
ttmp <- sapply(tmp,unlist)
bi2 <- data.frame(First = ttmp[1,], Second = ttmp[2,], Freq = bi$Freq)
format(object.size(bi2), units = "MB")
saveRDS(bi2,"./NGram/biFinal2.Rda")
rm(tmp, ttmp)

tmp <- lapply(as.character(tri$Word),strsplit, split=" ")
ttmp <- sapply(tmp,unlist)
tri2 <- data.frame(First = ttmp[1,], Second = ttmp[2,], Third = ttmp[3,], Freq = tri$Freq)
format(object.size(tri2), units = "MB")
saveRDS(tri2,"./NGram/triFinal2.Rda")
rm(tmp, ttmp)



tmp <- lapply(as.character(quadri$Word),strsplit, split=" ")
ttmp <- sapply(tmp,unlist)
quadri2 <- data.frame(First = ttmp[1,], Second = ttmp[2,], Third = ttmp[3,], Fourth = ttmp[4,], Freq = quadri$Freq)
format(object.size(quadri2), units = "MB")
saveRDS(quadri2,"./NGram/quadriFinal2.Rda")
rm(tmp, ttmp)
