setwd("C:/Users/bobobo/Desktop/Project_CapStone/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)

#------------1-10-------------------------------------------------
filepath <- paste(c("./data",1,"/quadrigram.Rda"),collapse="")
quadri1 <- readRDS(filepath)

filepath <- paste(c("./data",2,"/quadrigram.Rda"),collapse="")
quadri2 <- readRDS(filepath)

filepath <- paste(c("./data",3,"/quadrigram.Rda"),collapse="")
quadri3 <- readRDS(filepath)

filepath <- paste(c("./data",4,"/quadrigram.Rda"),collapse="")
quadri4 <- readRDS(filepath)

filepath <- paste(c("./data",5,"/quadrigram.Rda"),collapse="")
quadri5 <- readRDS(filepath)

filepath <- paste(c("./data",6,"/quadrigram.Rda"),collapse="")
quadri6 <- readRDS(filepath)

filepath <- paste(c("./data",7,"/quadrigram.Rda"),collapse="")
quadri7 <- readRDS(filepath)

filepath <- paste(c("./data",8,"/quadrigram.Rda"),collapse="")
quadri8 <- readRDS(filepath)

filepath <- paste(c("./data",9,"/quadrigram.Rda"),collapse="")
quadri9 <- readRDS(filepath)

filepath <- paste(c("./data",10,"/quadrigram.Rda"),collapse="")
quadri10 <- readRDS(filepath)

quadri1to10 <- rbind(quadri1,quadri2,quadri3,quadri4,quadri5,quadri6,quadri7,quadri8,quadri9,quadri10)

rm(quadri1,quadri2,quadri3,quadri4,quadri5,quadri6,quadri7,quadri8,quadri9,quadri10)

quadri1to10 <- aggregate(data.frame(x = quadri1to10$Freq), by=list(quadri1to10$Word), FUN="sum")
colnames(quadri1to10) <- c("Word","Freq")
quadri1to10 <- quadri1to10[order(quadri1to10$Freq, decreasing = TRUE),]

dim(quadri1to10[quadri1to10$Freq==1,])

dir.create("./quadrigram/")
filep <- "./quadrigram/quadri1to10.Rda"
saveRDS(quadri1to10,filep)

#------------11-20-------------------------------
filepath <- paste(c("./data",11,"/quadrigram.Rda"),collapse="")
quadri11 <- readRDS(filepath)

filepath <- paste(c("./data",12,"/quadrigram.Rda"),collapse="")
quadri12 <- readRDS(filepath)

filepath <- paste(c("./data",13,"/quadrigram.Rda"),collapse="")
quadri13 <- readRDS(filepath)

filepath <- paste(c("./data",14,"/quadrigram.Rda"),collapse="")
quadri14 <- readRDS(filepath)

filepath <- paste(c("./data",15,"/quadrigram.Rda"),collapse="")
quadri15 <- readRDS(filepath)

filepath <- paste(c("./data",16,"/quadrigram.Rda"),collapse="")
quadri16 <- readRDS(filepath)

filepath <- paste(c("./data",17,"/quadrigram.Rda"),collapse="")
quadri17 <- readRDS(filepath)

filepath <- paste(c("./data",18,"/quadrigram.Rda"),collapse="")
quadri18 <- readRDS(filepath)

filepath <- paste(c("./data",19,"/quadrigram.Rda"),collapse="")
quadri19 <- readRDS(filepath)

filepath <- paste(c("./data",20,"/quadrigram.Rda"),collapse="")
quadri20 <- readRDS(filepath)

quadri11to20 <- rbind(quadri11,quadri12,quadri13,quadri14,quadri15,quadri16,quadri17,quadri18,quadri19,quadri20)

rm(quadri11,quadri12,quadri13,quadri14,quadri15,quadri16,quadri17,quadri18,quadri19,quadri20)

quadri11to20 <- aggregate(data.frame(x = quadri11to20$Freq), by=list(quadri11to20$Word), FUN="sum")
colnames(quadri11to20) <- c("Word","Freq")
quadri11to20 <- quadri11to20[order(quadri11to20$Freq, decreasing = TRUE),]

dim(quadri11to20[quadri11to20$Freq==1,])

filep <- "./quadrigram/quadri11to20.Rda"
saveRDS(quadri11to20,filep)


#------------21-30-------------------------------
filepath <- paste(c("./data",21,"/quadrigram.Rda"),collapse="")
quadri21 <- readRDS(filepath)

filepath <- paste(c("./data",22,"/quadrigram.Rda"),collapse="")
quadri22 <- readRDS(filepath)

filepath <- paste(c("./data",23,"/quadrigram.Rda"),collapse="")
quadri23 <- readRDS(filepath)

filepath <- paste(c("./data",24,"/quadrigram.Rda"),collapse="")
quadri24 <- readRDS(filepath)

filepath <- paste(c("./data",25,"/quadrigram.Rda"),collapse="")
quadri25 <- readRDS(filepath)

filepath <- paste(c("./data",26,"/quadrigram.Rda"),collapse="")
quadri26 <- readRDS(filepath)

filepath <- paste(c("./data",27,"/quadrigram.Rda"),collapse="")
quadri27 <- readRDS(filepath)

filepath <- paste(c("./data",28,"/quadrigram.Rda"),collapse="")
quadri28 <- readRDS(filepath)

filepath <- paste(c("./data",29,"/quadrigram.Rda"),collapse="")
quadri29 <- readRDS(filepath)

filepath <- paste(c("./data",30,"/quadrigram.Rda"),collapse="")
quadri30 <- readRDS(filepath)

quadri21to30 <- rbind(quadri21,quadri22,quadri23,quadri24,quadri25,quadri26,quadri27,quadri28,quadri29,quadri30)

rm(quadri21,quadri22,quadri23,quadri24,quadri25,quadri26,quadri27,quadri28,quadri29,quadri30)

quadri21to30 <- aggregate(data.frame(x = quadri21to30$Freq), by=list(quadri21to30$Word), FUN="sum")
colnames(quadri21to30) <- c("Word","Freq")
quadri21to30 <- quadri21to30[order(quadri21to30$Freq, decreasing = TRUE),]

dim(quadri21to30[quadri21to30$Freq==1,])

filep <- "./quadrigram/quadri21to30.Rda"
saveRDS(quadri21to30,filep)



#------------31-40-------------------------------
filepath <- paste(c("./data",31,"/quadrigram.Rda"),collapse="")
quadri31 <- readRDS(filepath)

filepath <- paste(c("./data",32,"/quadrigram.Rda"),collapse="")
quadri32 <- readRDS(filepath)

filepath <- paste(c("./data",33,"/quadrigram.Rda"),collapse="")
quadri33 <- readRDS(filepath)

filepath <- paste(c("./data",34,"/quadrigram.Rda"),collapse="")
quadri34 <- readRDS(filepath)

filepath <- paste(c("./data",35,"/quadrigram.Rda"),collapse="")
quadri35 <- readRDS(filepath)

filepath <- paste(c("./data",36,"/quadrigram.Rda"),collapse="")
quadri36 <- readRDS(filepath)

filepath <- paste(c("./data",37,"/quadrigram.Rda"),collapse="")
quadri37 <- readRDS(filepath)

filepath <- paste(c("./data",38,"/quadrigram.Rda"),collapse="")
quadri38 <- readRDS(filepath)

filepath <- paste(c("./data",39,"/quadrigram.Rda"),collapse="")
quadri39 <- readRDS(filepath)

filepath <- paste(c("./data",40,"/quadrigram.Rda"),collapse="")
quadri40 <- readRDS(filepath)

quadri31to40 <- rbind(quadri31,quadri32,quadri33,quadri34,quadri35,quadri36,quadri37,quadri38,quadri39,quadri40)

rm(quadri31,quadri32,quadri33,quadri34,quadri35,quadri36,quadri37,quadri38,quadri39,quadri40)

quadri31to40 <- aggregate(data.frame(x = quadri31to40$Freq), by=list(quadri31to40$Word), FUN="sum")
colnames(quadri31to40) <- c("Word","Freq")
quadri31to40 <- quadri31to40[order(quadri31to40$Freq, decreasing = TRUE),]

dim(quadri31to40[quadri31to40$Freq==1,])

filep <- "./quadrigram/quadri31to40.Rda"
saveRDS(quadri31to40,filep)



#------------41-50-------------------------------
filepath <- paste(c("./data",41,"/quadrigram.Rda"),collapse="")
quadri41 <- readRDS(filepath)

filepath <- paste(c("./data",42,"/quadrigram.Rda"),collapse="")
quadri42 <- readRDS(filepath)

filepath <- paste(c("./data",43,"/quadrigram.Rda"),collapse="")
quadri43 <- readRDS(filepath)

filepath <- paste(c("./data",44,"/quadrigram.Rda"),collapse="")
quadri44 <- readRDS(filepath)

filepath <- paste(c("./data",45,"/quadrigram.Rda"),collapse="")
quadri45 <- readRDS(filepath)

filepath <- paste(c("./data",46,"/quadrigram.Rda"),collapse="")
quadri46 <- readRDS(filepath)

filepath <- paste(c("./data",47,"/quadrigram.Rda"),collapse="")
quadri47 <- readRDS(filepath)

filepath <- paste(c("./data",48,"/quadrigram.Rda"),collapse="")
quadri48 <- readRDS(filepath)

filepath <- paste(c("./data",49,"/quadrigram.Rda"),collapse="")
quadri49 <- readRDS(filepath)

filepath <- paste(c("./data",50,"/quadrigram.Rda"),collapse="")
quadri50 <- readRDS(filepath)

quadri41to50 <- rbind(quadri41,quadri42,quadri43,quadri44,quadri45,quadri46,quadri47,quadri48,quadri49,quadri50)

rm(quadri41,quadri42,quadri43,quadri44,quadri45,quadri46,quadri47,quadri48,quadri49,quadri50)

quadri41to50 <- aggregate(data.frame(x = quadri41to50$Freq), by=list(quadri41to50$Word), FUN="sum")
colnames(quadri41to50) <- c("Word","Freq")
quadri41to50 <- quadri41to50[order(quadri41to50$Freq, decreasing = TRUE),]

dim(quadri41to50[quadri41to50$Freq==1,])

filep <- "./quadrigram/quadri41to50.Rda"
saveRDS(quadri41to50,filep)

#-----------------------------------------------------
quadri1to10<- readRDS("./quadrigram/quadri1to10.Rda") # 10248647*2

totalCount <- sum(quadri1to10$Freq)

100*sum(quadri1to10[quadri1to10$Freq>=2,]$Freq)/totalCount  # 18.49195
dim(quadri1to10[quadri1to10$Freq>=2,]) # 592211  *2

100*sum(quadri1to10[quadri1to10$Freq>=3,]$Freq)/totalCount  # 12.6366
dim(quadri1to10[quadri1to10$Freq>=3,]) # 245363 *2

100*sum(quadri1to10[1:5000000,]$Freq)/totalCount  # 56.1774
dim(quadri1to10[1:5000000,]) # 5000000 *2


quadri11to20<- readRDS("./quadrigram/quadri11to20.Rda") # 10258746*2

totalCount <- sum(quadri11to20$Freq)

100*sum(quadri11to20[quadri11to20$Freq>=2,]$Freq)/totalCount  # 17.47415
dim(quadri11to20[quadri11to20$Freq>=2,]) # 565298  *2

100*sum(quadri11to20[quadri11to20$Freq>=3,]$Freq)/totalCount  # 11.541
dim(quadri11to20[quadri11to20$Freq>=3,]) # 216887 *2

100*sum(quadri11to20[1:5000000,]$Freq)/totalCount  # 55.22929
dim(quadri11to20[1:5000000,]) # 5000000 *2



quadri1to20 <- rbind(quadri1to10,quadri11to20)
rm(quadri1to10,quadri11to20)

quadri1to20 <- aggregate(data.frame(x = quadri1to20$Freq), by=list(quadri1to20$Word), FUN="sum")
colnames(quadri1to20) <- c("Word","Freq")
quadri1to20 <- quadri1to20[order(quadri1to20$Freq, decreasing = TRUE),]

dim(quadri1to20[quadri1to20$Freq==1,])
filep <- "./quadrigram/quadri1to20.Rda"
saveRDS(quadri1to20,filep)



quadri21to30 <- readRDS("./quadrigram/quadri21to30.Rda")
quadri31to40 <- readRDS("./quadrigram/quadri31to40.Rda")
quadri21to40 <- rbind(quadri21to30,quadri31to40)

rm(quadri21to30,quadri31to40)

quadri21to40 <- aggregate(data.frame(x = quadri21to40$Freq), by=list(quadri21to40$Word), FUN="sum")
colnames(quadri21to40) <- c("Word","Freq")
quadri21to40 <- quadri21to40[order(quadri21to40$Freq, decreasing = TRUE),]

dim(quadri21to40[quadri21to40$Freq==1,])
filep <- "./quadrigram/quadri21to40.Rda"
saveRDS(quadri21to40,filep)


dim(quadri1to20[quadri1to20$Freq>=2,])
dim(quadri21to40[quadri21to40$Freq>=2,])

quadri1to20 <- quadri1to20[quadri1to20$Freq>=2,]
quadri21to40 <- quadri21to40[quadri21to40$Freq>=2,]

quadri1to40 <- rbind(quadri1to20,quadri21to40)

quadri1to40 <- aggregate(data.frame(x = quadri1to40$Freq), by=list(quadri1to40$Word), FUN="sum")

rm(quadri1to20,quadri21to40)
filep <- "./quadrigram/quadri1to40.Rda"
saveRDS(quadri1to40,filep)


quadri41to50<- readRDS("./quadrigram/quadri41to50.Rda")

quadri1to50<- rbind(quadri1to40,quadri41to50) 
rm(quadri1to40,quadri41to50)
quadri1to50 <- aggregate(data.frame(x = quadri1to50$Freq), by=list(quadri1to50$Word), FUN="sum")
colnames(quadri1to50) <- c("Word","Freq")
quadri1to50 <- quadri1to50[order(quadri1to50$Freq, decreasing = TRUE),]

filep <- "./quadrigram/quadri1to50.Rda"
saveRDS(quadri1to50,filep)

dim(quadri1to50[quadri1to50$Freq>=10,])

quadri1to50 <- quadri1to50[quadri1to50$Freq>=2,]
filep <- "./quadrigram/quadriFinal.Rda"
saveRDS(quadri1to50,filep)

quadri1to50 <- quadri1to50[quadri1to50$Freq>=10,]
filep <- "./quadrigram/quadri10Freq.Rda"
saveRDS(quadri1to50,filep)
