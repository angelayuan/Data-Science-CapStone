setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)

#------------1-10-------------------------------------------------
filepath <- paste(c("./data",1,"/bigram.Rda"),collapse="")
bi1 <- readRDS(filepath)

filepath <- paste(c("./data",2,"/bigram.Rda"),collapse="")
bi2 <- readRDS(filepath)

filepath <- paste(c("./data",3,"/bigram.Rda"),collapse="")
bi3 <- readRDS(filepath)

filepath <- paste(c("./data",4,"/bigram.Rda"),collapse="")
bi4 <- readRDS(filepath)

filepath <- paste(c("./data",5,"/bigram.Rda"),collapse="")
bi5 <- readRDS(filepath)

filepath <- paste(c("./data",6,"/bigram.Rda"),collapse="")
bi6 <- readRDS(filepath)

filepath <- paste(c("./data",7,"/bigram.Rda"),collapse="")
bi7 <- readRDS(filepath)

filepath <- paste(c("./data",8,"/bigram.Rda"),collapse="")
bi8 <- readRDS(filepath)

filepath <- paste(c("./data",9,"/bigram.Rda"),collapse="")
bi9 <- readRDS(filepath)

filepath <- paste(c("./data",10,"/bigram.Rda"),collapse="")
bi10 <- readRDS(filepath)

bi1to10 <- rbind(bi1,bi2,bi3,bi4,bi5,bi6,bi7,bi8,bi9,bi10)

rm(bi1,bi2,bi3,bi4,bi5,bi6,bi7,bi8,bi9,bi10)

bi1to10 <- aggregate(data.frame(x = bi1to10$Freq), by=list(bi1to10$Word), FUN="sum")
colnames(bi1to10) <- c("Word","Freq")
bi1to10 <- bi1to10[order(bi1to10$Freq, decreasing = TRUE),]

dim(bi1to10[bi1to10$Freq==1,])

dir.create("./bigram/")
filep <- "./bigram/bi1to10.Rda"
saveRDS(bi1to10,filep)

#------------11-20-------------------------------
filepath <- paste(c("./data",11,"/bigram.Rda"),collapse="")
bi11 <- readRDS(filepath)

filepath <- paste(c("./data",12,"/bigram.Rda"),collapse="")
bi12 <- readRDS(filepath)

filepath <- paste(c("./data",13,"/bigram.Rda"),collapse="")
bi13 <- readRDS(filepath)

filepath <- paste(c("./data",14,"/bigram.Rda"),collapse="")
bi14 <- readRDS(filepath)

filepath <- paste(c("./data",15,"/bigram.Rda"),collapse="")
bi15 <- readRDS(filepath)

filepath <- paste(c("./data",16,"/bigram.Rda"),collapse="")
bi16 <- readRDS(filepath)

filepath <- paste(c("./data",17,"/bigram.Rda"),collapse="")
bi17 <- readRDS(filepath)

filepath <- paste(c("./data",18,"/bigram.Rda"),collapse="")
bi18 <- readRDS(filepath)

filepath <- paste(c("./data",19,"/bigram.Rda"),collapse="")
bi19 <- readRDS(filepath)

filepath <- paste(c("./data",20,"/bigram.Rda"),collapse="")
bi20 <- readRDS(filepath)

bi11to20 <- rbind(bi11,bi12,bi13,bi14,bi15,bi16,bi17,bi18,bi19,bi20)

rm(bi11,bi12,bi13,bi14,bi15,bi16,bi17,bi18,bi19,bi20)

bi11to20 <- aggregate(data.frame(x = bi11to20$Freq), by=list(bi11to20$Word), FUN="sum")
colnames(bi11to20) <- c("Word","Freq")
bi11to20 <- bi11to20[order(bi11to20$Freq, decreasing = TRUE),]

dim(bi11to20[bi11to20$Freq==1,])

filep <- "./bigram/bi11to20.Rda"
saveRDS(bi11to20,filep)


#------------21-30-------------------------------
filepath <- paste(c("./data",21,"/bigram.Rda"),collapse="")
bi21 <- readRDS(filepath)

filepath <- paste(c("./data",22,"/bigram.Rda"),collapse="")
bi22 <- readRDS(filepath)

filepath <- paste(c("./data",23,"/bigram.Rda"),collapse="")
bi23 <- readRDS(filepath)

filepath <- paste(c("./data",24,"/bigram.Rda"),collapse="")
bi24 <- readRDS(filepath)

filepath <- paste(c("./data",25,"/bigram.Rda"),collapse="")
bi25 <- readRDS(filepath)

filepath <- paste(c("./data",26,"/bigram.Rda"),collapse="")
bi26 <- readRDS(filepath)

filepath <- paste(c("./data",27,"/bigram.Rda"),collapse="")
bi27 <- readRDS(filepath)

filepath <- paste(c("./data",28,"/bigram.Rda"),collapse="")
bi28 <- readRDS(filepath)

filepath <- paste(c("./data",29,"/bigram.Rda"),collapse="")
bi29 <- readRDS(filepath)

filepath <- paste(c("./data",30,"/bigram.Rda"),collapse="")
bi30 <- readRDS(filepath)

bi21to30 <- rbind(bi21,bi22,bi23,bi24,bi25,bi26,bi27,bi28,bi29,bi30)

rm(bi21,bi22,bi23,bi24,bi25,bi26,bi27,bi28,bi29,bi30)

bi21to30 <- aggregate(data.frame(x = bi21to30$Freq), by=list(bi21to30$Word), FUN="sum")
colnames(bi21to30) <- c("Word","Freq")
bi21to30 <- bi21to30[order(bi21to30$Freq, decreasing = TRUE),]

dim(bi21to30[bi21to30$Freq==1,])

filep <- "./bigram/bi21to30.Rda"
saveRDS(bi21to30,filep)



#------------31-40-------------------------------
filepath <- paste(c("./data",31,"/bigram.Rda"),collapse="")
bi31 <- readRDS(filepath)

filepath <- paste(c("./data",32,"/bigram.Rda"),collapse="")
bi32 <- readRDS(filepath)

filepath <- paste(c("./data",33,"/bigram.Rda"),collapse="")
bi33 <- readRDS(filepath)

filepath <- paste(c("./data",34,"/bigram.Rda"),collapse="")
bi34 <- readRDS(filepath)

filepath <- paste(c("./data",35,"/bigram.Rda"),collapse="")
bi35 <- readRDS(filepath)

filepath <- paste(c("./data",36,"/bigram.Rda"),collapse="")
bi36 <- readRDS(filepath)

filepath <- paste(c("./data",37,"/bigram.Rda"),collapse="")
bi37 <- readRDS(filepath)

filepath <- paste(c("./data",38,"/bigram.Rda"),collapse="")
bi38 <- readRDS(filepath)

filepath <- paste(c("./data",39,"/bigram.Rda"),collapse="")
bi39 <- readRDS(filepath)

filepath <- paste(c("./data",40,"/bigram.Rda"),collapse="")
bi40 <- readRDS(filepath)

bi31to40 <- rbind(bi31,bi32,bi33,bi34,bi35,bi36,bi37,bi38,bi39,bi40)

rm(bi31,bi32,bi33,bi34,bi35,bi36,bi37,bi38,bi39,bi40)

bi31to40 <- aggregate(data.frame(x = bi31to40$Freq), by=list(bi31to40$Word), FUN="sum")
colnames(bi31to40) <- c("Word","Freq")
bi31to40 <- bi31to40[order(bi31to40$Freq, decreasing = TRUE),]

dim(bi31to40[bi31to40$Freq==1,])

filep <- "./bigram/bi31to40.Rda"
saveRDS(bi31to40,filep)



#------------41-50-------------------------------
filepath <- paste(c("./data",41,"/bigram.Rda"),collapse="")
bi41 <- readRDS(filepath)

filepath <- paste(c("./data",42,"/bigram.Rda"),collapse="")
bi42 <- readRDS(filepath)

filepath <- paste(c("./data",43,"/bigram.Rda"),collapse="")
bi43 <- readRDS(filepath)

filepath <- paste(c("./data",44,"/bigram.Rda"),collapse="")
bi44 <- readRDS(filepath)

filepath <- paste(c("./data",45,"/bigram.Rda"),collapse="")
bi45 <- readRDS(filepath)

filepath <- paste(c("./data",46,"/bigram.Rda"),collapse="")
bi46 <- readRDS(filepath)

filepath <- paste(c("./data",47,"/bigram.Rda"),collapse="")
bi47 <- readRDS(filepath)

filepath <- paste(c("./data",48,"/bigram.Rda"),collapse="")
bi48 <- readRDS(filepath)

filepath <- paste(c("./data",49,"/bigram.Rda"),collapse="")
bi49 <- readRDS(filepath)

filepath <- paste(c("./data",50,"/bigram.Rda"),collapse="")
bi50 <- readRDS(filepath)

bi41to50 <- rbind(bi41,bi42,bi43,bi44,bi45,bi46,bi47,bi48,bi49,bi50)

rm(bi41,bi42,bi43,bi44,bi45,bi46,bi47,bi48,bi49,bi50)

bi41to50 <- aggregate(data.frame(x = bi41to50$Freq), by=list(bi41to50$Word), FUN="sum")
colnames(bi41to50) <- c("Word","Freq")
bi41to50 <- bi41to50[order(bi41to50$Freq, decreasing = TRUE),]

dim(bi41to50[bi41to50$Freq==1,])

filep <- "./bigram/bi41to50.Rda"
saveRDS(bi41to50,filep)

#--------------------------1-50-----------------------
bi1to50 <- rbind(bi1to10,bi11to20,bi21to30,bi31to40,bi41to50)

rm(bi1to10,bi11to20,bi21to30,bi31to40,bi41to50)

bi1to50 <- aggregate(data.frame(x = bi1to50$Freq), by=list(bi1to50$Word), FUN="sum")
colnames(bi1to50) <- c("Word","Freq")
bi1to50 <- bi1to50[order(bi1to50$Freq, decreasing = TRUE),]

dim(bi1to50[bi1to50$Freq==1,])

filep <- "./bigram/bi1to50.Rda"
saveRDS(bi1to50,filep)

bi10Freq <- bi1to50[bi1to50$Freq>=10,]
filep <- "./bigram/bi10Freq.Rda"
saveRDS(bi10Freq,filep)

bi30Freq <- bi1to50[bi1to50$Freq>=30,]
filep <- "./bigram/bi30Freq.Rda"
saveRDS(bi30Freq,filep)


rm(bi1to50,bi10Freq)
