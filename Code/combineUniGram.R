setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)

#------------1-10-------------------------------------------------
filepath <- paste(c("./data",1,"/unigram.Rda"),collapse="")
uni1 <- readRDS(filepath)

filepath <- paste(c("./data",2,"/unigram.Rda"),collapse="")
uni2 <- readRDS(filepath)

filepath <- paste(c("./data",3,"/unigram.Rda"),collapse="")
uni3 <- readRDS(filepath)

filepath <- paste(c("./data",4,"/unigram.Rda"),collapse="")
uni4 <- readRDS(filepath)

filepath <- paste(c("./data",5,"/unigram.Rda"),collapse="")
uni5 <- readRDS(filepath)

filepath <- paste(c("./data",6,"/unigram.Rda"),collapse="")
uni6 <- readRDS(filepath)

filepath <- paste(c("./data",7,"/unigram.Rda"),collapse="")
uni7 <- readRDS(filepath)

filepath <- paste(c("./data",8,"/unigram.Rda"),collapse="")
uni8 <- readRDS(filepath)

filepath <- paste(c("./data",9,"/unigram.Rda"),collapse="")
uni9 <- readRDS(filepath)

filepath <- paste(c("./data",10,"/unigram.Rda"),collapse="")
uni10 <- readRDS(filepath)

uni1to10 <- rbind(uni1,uni2,uni3,uni4,uni5,uni6,uni7,uni8,uni9,uni10)

rm(uni1,uni2,uni3,uni4,uni5,uni6,uni7,uni8,uni9,uni10)

uni1to10 <- aggregate(data.frame(x = uni1to10$Freq), by=list(uni1to10$Word), FUN="sum")
colnames(uni1to10) <- c("Word","Freq")
uni1to10 <- uni1to10[order(uni1to10$Freq, decreasing = TRUE),]

dim(uni1to10[uni1to10$Freq==1,])

dir.create("./unigram/")
filep <- "./unigram/uni1to10.Rda"
saveRDS(uni1to10,filep)

#------------11-20-------------------------------
filepath <- paste(c("./data",11,"/unigram.Rda"),collapse="")
uni11 <- readRDS(filepath)

filepath <- paste(c("./data",12,"/unigram.Rda"),collapse="")
uni12 <- readRDS(filepath)

filepath <- paste(c("./data",13,"/unigram.Rda"),collapse="")
uni13 <- readRDS(filepath)

filepath <- paste(c("./data",14,"/unigram.Rda"),collapse="")
uni14 <- readRDS(filepath)

filepath <- paste(c("./data",15,"/unigram.Rda"),collapse="")
uni15 <- readRDS(filepath)

filepath <- paste(c("./data",16,"/unigram.Rda"),collapse="")
uni16 <- readRDS(filepath)

filepath <- paste(c("./data",17,"/unigram.Rda"),collapse="")
uni17 <- readRDS(filepath)

filepath <- paste(c("./data",18,"/unigram.Rda"),collapse="")
uni18 <- readRDS(filepath)

filepath <- paste(c("./data",19,"/unigram.Rda"),collapse="")
uni19 <- readRDS(filepath)

filepath <- paste(c("./data",20,"/unigram.Rda"),collapse="")
uni20 <- readRDS(filepath)

uni11to20 <- rbind(uni11,uni12,uni13,uni14,uni15,uni16,uni17,uni18,uni19,uni20)

rm(uni11,uni12,uni13,uni14,uni15,uni16,uni17,uni18,uni19,uni20)

uni11to20 <- aggregate(data.frame(x = uni11to20$Freq), by=list(uni11to20$Word), FUN="sum")
colnames(uni11to20) <- c("Word","Freq")
uni11to20 <- uni11to20[order(uni11to20$Freq, decreasing = TRUE),]

dim(uni11to20[uni11to20$Freq==1,])

filep <- "./unigram/uni11to20.Rda"
saveRDS(uni11to20,filep)


#------------21-30-------------------------------
filepath <- paste(c("./data",21,"/unigram.Rda"),collapse="")
uni21 <- readRDS(filepath)

filepath <- paste(c("./data",22,"/unigram.Rda"),collapse="")
uni22 <- readRDS(filepath)

filepath <- paste(c("./data",23,"/unigram.Rda"),collapse="")
uni23 <- readRDS(filepath)

filepath <- paste(c("./data",24,"/unigram.Rda"),collapse="")
uni24 <- readRDS(filepath)

filepath <- paste(c("./data",25,"/unigram.Rda"),collapse="")
uni25 <- readRDS(filepath)

filepath <- paste(c("./data",26,"/unigram.Rda"),collapse="")
uni26 <- readRDS(filepath)

filepath <- paste(c("./data",27,"/unigram.Rda"),collapse="")
uni27 <- readRDS(filepath)

filepath <- paste(c("./data",28,"/unigram.Rda"),collapse="")
uni28 <- readRDS(filepath)

filepath <- paste(c("./data",29,"/unigram.Rda"),collapse="")
uni29 <- readRDS(filepath)

filepath <- paste(c("./data",30,"/unigram.Rda"),collapse="")
uni30 <- readRDS(filepath)

uni21to30 <- rbind(uni21,uni22,uni23,uni24,uni25,uni26,uni27,uni28,uni29,uni30)

rm(uni21,uni22,uni23,uni24,uni25,uni26,uni27,uni28,uni29,uni30)

uni21to30 <- aggregate(data.frame(x = uni21to30$Freq), by=list(uni21to30$Word), FUN="sum")
colnames(uni21to30) <- c("Word","Freq")
uni21to30 <- uni21to30[order(uni21to30$Freq, decreasing = TRUE),]

dim(uni21to30[uni21to30$Freq==1,])

filep <- "./unigram/uni21to30.Rda"
saveRDS(uni21to30,filep)



#------------31-40-------------------------------
filepath <- paste(c("./data",31,"/unigram.Rda"),collapse="")
uni31 <- readRDS(filepath)

filepath <- paste(c("./data",32,"/unigram.Rda"),collapse="")
uni32 <- readRDS(filepath)

filepath <- paste(c("./data",33,"/unigram.Rda"),collapse="")
uni33 <- readRDS(filepath)

filepath <- paste(c("./data",34,"/unigram.Rda"),collapse="")
uni34 <- readRDS(filepath)

filepath <- paste(c("./data",35,"/unigram.Rda"),collapse="")
uni35 <- readRDS(filepath)

filepath <- paste(c("./data",36,"/unigram.Rda"),collapse="")
uni36 <- readRDS(filepath)

filepath <- paste(c("./data",37,"/unigram.Rda"),collapse="")
uni37 <- readRDS(filepath)

filepath <- paste(c("./data",38,"/unigram.Rda"),collapse="")
uni38 <- readRDS(filepath)

filepath <- paste(c("./data",39,"/unigram.Rda"),collapse="")
uni39 <- readRDS(filepath)

filepath <- paste(c("./data",40,"/unigram.Rda"),collapse="")
uni40 <- readRDS(filepath)

uni31to40 <- rbind(uni31,uni32,uni33,uni34,uni35,uni36,uni37,uni38,uni39,uni40)

rm(uni31,uni32,uni33,uni34,uni35,uni36,uni37,uni38,uni39,uni40)

uni31to40 <- aggregate(data.frame(x = uni31to40$Freq), by=list(uni31to40$Word), FUN="sum")
colnames(uni31to40) <- c("Word","Freq")
uni31to40 <- uni31to40[order(uni31to40$Freq, decreasing = TRUE),]

dim(uni31to40[uni31to40$Freq==1,])

filep <- "./unigram/uni31to40.Rda"
saveRDS(uni31to40,filep)



#------------41-50-------------------------------
filepath <- paste(c("./data",41,"/unigram.Rda"),collapse="")
uni41 <- readRDS(filepath)

filepath <- paste(c("./data",42,"/unigram.Rda"),collapse="")
uni42 <- readRDS(filepath)

filepath <- paste(c("./data",43,"/unigram.Rda"),collapse="")
uni43 <- readRDS(filepath)

filepath <- paste(c("./data",44,"/unigram.Rda"),collapse="")
uni44 <- readRDS(filepath)

filepath <- paste(c("./data",45,"/unigram.Rda"),collapse="")
uni45 <- readRDS(filepath)

filepath <- paste(c("./data",46,"/unigram.Rda"),collapse="")
uni46 <- readRDS(filepath)

filepath <- paste(c("./data",47,"/unigram.Rda"),collapse="")
uni47 <- readRDS(filepath)

filepath <- paste(c("./data",48,"/unigram.Rda"),collapse="")
uni48 <- readRDS(filepath)

filepath <- paste(c("./data",49,"/unigram.Rda"),collapse="")
uni49 <- readRDS(filepath)

filepath <- paste(c("./data",50,"/unigram.Rda"),collapse="")
uni50 <- readRDS(filepath)

uni41to50 <- rbind(uni41,uni42,uni43,uni44,uni45,uni46,uni47,uni48,uni49,uni50)

rm(uni41,uni42,uni43,uni44,uni45,uni46,uni47,uni48,uni49,uni50)

uni41to50 <- aggregate(data.frame(x = uni41to50$Freq), by=list(uni41to50$Word), FUN="sum")
colnames(uni41to50) <- c("Word","Freq")
uni41to50 <- uni41to50[order(uni41to50$Freq, decreasing = TRUE),]

dim(uni41to50[uni41to50$Freq==1,])

filep <- "./unigram/uni41to50.Rda"
saveRDS(uni41to50,filep)

#--------------------------1-50-----------------------
uni1to50 <- rbind(uni1to10,uni11to20,uni21to30,uni31to40,uni41to50)

rm(uni1to10,uni11to20,uni21to30,uni31to40,uni41to50)

uni1to50 <- aggregate(data.frame(x = uni1to50$Freq), by=list(uni1to50$Word), FUN="sum")
colnames(uni1to50) <- c("Word","Freq")
uni1to50 <- uni1to50[order(uni1to50$Freq, decreasing = TRUE),]

dim(uni1to50[uni1to50$Freq==1,])

filep <- "./unigram/uni1to50.Rda"
saveRDS(uni1to50,filep)

uni10Freq <- uni1to50[uni1to50$Freq>=10,]
filep <- "./unigram/uni10Freq.Rda"
saveRDS(uni10Freq,filep)

rm(uni1to50,uni10Freq)
