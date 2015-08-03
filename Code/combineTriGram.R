setwd("C:/MOOC/Coursera/Data Science Specialization/10. Data Science Capstone/Coursera-SwiftKey/final/en_US")
library(tm) # frame work for text mining
library(SnowballC) # for stemming
library(RWeka) # tokenization
library(reshape2)

#------------1-10-------------------------------------------------
filepath <- paste(c("./data",1,"/trigram.Rda"),collapse="")
tri1 <- readRDS(filepath)

filepath <- paste(c("./data",2,"/trigram.Rda"),collapse="")
tri2 <- readRDS(filepath)

filepath <- paste(c("./data",3,"/trigram.Rda"),collapse="")
tri3 <- readRDS(filepath)

filepath <- paste(c("./data",4,"/trigram.Rda"),collapse="")
tri4 <- readRDS(filepath)

filepath <- paste(c("./data",5,"/trigram.Rda"),collapse="")
tri5 <- readRDS(filepath)

filepath <- paste(c("./data",6,"/trigram.Rda"),collapse="")
tri6 <- readRDS(filepath)

filepath <- paste(c("./data",7,"/trigram.Rda"),collapse="")
tri7 <- readRDS(filepath)

filepath <- paste(c("./data",8,"/trigram.Rda"),collapse="")
tri8 <- readRDS(filepath)

filepath <- paste(c("./data",9,"/trigram.Rda"),collapse="")
tri9 <- readRDS(filepath)

filepath <- paste(c("./data",10,"/trigram.Rda"),collapse="")
tri10 <- readRDS(filepath)

tri1to10 <- rbind(tri1,tri2,tri3,tri4,tri5,tri6,tri7,tri8,tri9,tri10)

rm(tri1,tri2,tri3,tri4,tri5,tri6,tri7,tri8,tri9,tri10)

tri1to10 <- aggregate(data.frame(x = tri1to10$Freq), by=list(tri1to10$Word), FUN="sum")
colnames(tri1to10) <- c("Word","Freq")
tri1to10 <- tri1to10[order(tri1to10$Freq, decreasing = TRUE),]

dim(tri1to10[tri1to10$Freq==1,])

dir.create("./trigram/")
filep <- "./trigram/tri1to10.Rda"
saveRDS(tri1to10,filep)

#------------11-20-------------------------------
filepath <- paste(c("./data",11,"/trigram.Rda"),collapse="")
tri11 <- readRDS(filepath)

filepath <- paste(c("./data",12,"/trigram.Rda"),collapse="")
tri12 <- readRDS(filepath)

filepath <- paste(c("./data",13,"/trigram.Rda"),collapse="")
tri13 <- readRDS(filepath)

filepath <- paste(c("./data",14,"/trigram.Rda"),collapse="")
tri14 <- readRDS(filepath)

filepath <- paste(c("./data",15,"/trigram.Rda"),collapse="")
tri15 <- readRDS(filepath)

filepath <- paste(c("./data",16,"/trigram.Rda"),collapse="")
tri16 <- readRDS(filepath)

filepath <- paste(c("./data",17,"/trigram.Rda"),collapse="")
tri17 <- readRDS(filepath)

filepath <- paste(c("./data",18,"/trigram.Rda"),collapse="")
tri18 <- readRDS(filepath)

filepath <- paste(c("./data",19,"/trigram.Rda"),collapse="")
tri19 <- readRDS(filepath)

filepath <- paste(c("./data",20,"/trigram.Rda"),collapse="")
tri20 <- readRDS(filepath)

tri11to20 <- rbind(tri11,tri12,tri13,tri14,tri15,tri16,tri17,tri18,tri19,tri20)

rm(tri11,tri12,tri13,tri14,tri15,tri16,tri17,tri18,tri19,tri20)

tri11to20 <- aggregate(data.frame(x = tri11to20$Freq), by=list(tri11to20$Word), FUN="sum")
colnames(tri11to20) <- c("Word","Freq")
tri11to20 <- tri11to20[order(tri11to20$Freq, decreasing = TRUE),]

dim(tri11to20[tri11to20$Freq==1,])

filep <- "./trigram/tri11to20.Rda"
saveRDS(tri11to20,filep)


#------------21-30-------------------------------
filepath <- paste(c("./data",21,"/trigram.Rda"),collapse="")
tri21 <- readRDS(filepath)

filepath <- paste(c("./data",22,"/trigram.Rda"),collapse="")
tri22 <- readRDS(filepath)

filepath <- paste(c("./data",23,"/trigram.Rda"),collapse="")
tri23 <- readRDS(filepath)

filepath <- paste(c("./data",24,"/trigram.Rda"),collapse="")
tri24 <- readRDS(filepath)

filepath <- paste(c("./data",25,"/trigram.Rda"),collapse="")
tri25 <- readRDS(filepath)

filepath <- paste(c("./data",26,"/trigram.Rda"),collapse="")
tri26 <- readRDS(filepath)

filepath <- paste(c("./data",27,"/trigram.Rda"),collapse="")
tri27 <- readRDS(filepath)

filepath <- paste(c("./data",28,"/trigram.Rda"),collapse="")
tri28 <- readRDS(filepath)

filepath <- paste(c("./data",29,"/trigram.Rda"),collapse="")
tri29 <- readRDS(filepath)

filepath <- paste(c("./data",30,"/trigram.Rda"),collapse="")
tri30 <- readRDS(filepath)

tri21to30 <- rbind(tri21,tri22,tri23,tri24,tri25,tri26,tri27,tri28,tri29,tri30)

rm(tri21,tri22,tri23,tri24,tri25,tri26,tri27,tri28,tri29,tri30)

tri21to30 <- aggregate(data.frame(x = tri21to30$Freq), by=list(tri21to30$Word), FUN="sum")
colnames(tri21to30) <- c("Word","Freq")
tri21to30 <- tri21to30[order(tri21to30$Freq, decreasing = TRUE),]

dim(tri21to30[tri21to30$Freq==1,])

filep <- "./trigram/tri21to30.Rda"
saveRDS(tri21to30,filep)



#------------31-40-------------------------------
filepath <- paste(c("./data",31,"/trigram.Rda"),collapse="")
tri31 <- readRDS(filepath)

filepath <- paste(c("./data",32,"/trigram.Rda"),collapse="")
tri32 <- readRDS(filepath)

filepath <- paste(c("./data",33,"/trigram.Rda"),collapse="")
tri33 <- readRDS(filepath)

filepath <- paste(c("./data",34,"/trigram.Rda"),collapse="")
tri34 <- readRDS(filepath)

filepath <- paste(c("./data",35,"/trigram.Rda"),collapse="")
tri35 <- readRDS(filepath)

filepath <- paste(c("./data",36,"/trigram.Rda"),collapse="")
tri36 <- readRDS(filepath)

filepath <- paste(c("./data",37,"/trigram.Rda"),collapse="")
tri37 <- readRDS(filepath)

filepath <- paste(c("./data",38,"/trigram.Rda"),collapse="")
tri38 <- readRDS(filepath)

filepath <- paste(c("./data",39,"/trigram.Rda"),collapse="")
tri39 <- readRDS(filepath)

filepath <- paste(c("./data",40,"/trigram.Rda"),collapse="")
tri40 <- readRDS(filepath)

tri31to40 <- rbind(tri31,tri32,tri33,tri34,tri35,tri36,tri37,tri38,tri39,tri40)

rm(tri31,tri32,tri33,tri34,tri35,tri36,tri37,tri38,tri39,tri40)

tri31to40 <- aggregate(data.frame(x = tri31to40$Freq), by=list(tri31to40$Word), FUN="sum")
colnames(tri31to40) <- c("Word","Freq")
tri31to40 <- tri31to40[order(tri31to40$Freq, decreasing = TRUE),]

dim(tri31to40[tri31to40$Freq==1,])

filep <- "./trigram/tri31to40.Rda"
saveRDS(tri31to40,filep)



#------------41-50-------------------------------
filepath <- paste(c("./data",41,"/trigram.Rda"),collapse="")
tri41 <- readRDS(filepath)

filepath <- paste(c("./data",42,"/trigram.Rda"),collapse="")
tri42 <- readRDS(filepath)

filepath <- paste(c("./data",43,"/trigram.Rda"),collapse="")
tri43 <- readRDS(filepath)

filepath <- paste(c("./data",44,"/trigram.Rda"),collapse="")
tri44 <- readRDS(filepath)

filepath <- paste(c("./data",45,"/trigram.Rda"),collapse="")
tri45 <- readRDS(filepath)

filepath <- paste(c("./data",46,"/trigram.Rda"),collapse="")
tri46 <- readRDS(filepath)

filepath <- paste(c("./data",47,"/trigram.Rda"),collapse="")
tri47 <- readRDS(filepath)

filepath <- paste(c("./data",48,"/trigram.Rda"),collapse="")
tri48 <- readRDS(filepath)

filepath <- paste(c("./data",49,"/trigram.Rda"),collapse="")
tri49 <- readRDS(filepath)

filepath <- paste(c("./data",50,"/trigram.Rda"),collapse="")
tri50 <- readRDS(filepath)

tri41to50 <- rbind(tri41,tri42,tri43,tri44,tri45,tri46,tri47,tri48,tri49,tri50)

rm(tri41,tri42,tri43,tri44,tri45,tri46,tri47,tri48,tri49,tri50)

tri41to50 <- aggregate(data.frame(x = tri41to50$Freq), by=list(tri41to50$Word), FUN="sum")
colnames(tri41to50) <- c("Word","Freq")
tri41to50 <- tri41to50[order(tri41to50$Freq, decreasing = TRUE),]

dim(tri41to50[tri41to50$Freq==1,])

filep <- "./trigram/tri41to50.Rda"
saveRDS(tri41to50,filep)

#--------------------------1-50-----------------------
tri1to50 <- rbind(tri1to10,tri11to20,tri21to30,tri31to40,tri41to50)

rm(tri1to10,tri11to20,tri21to30,tri31to40,tri41to50)

tri1to50 <- aggregate(data.frame(x = tri1to50$Freq), by=list(tri1to50$Word), FUN="sum")
colnames(tri1to50) <- c("Word","Freq")
tri1to50 <- tri1to50[order(tri1to50$Freq, decreasing = TRUE),]

dim(tri1to50[tri1to50$Freq==1,])

filep <- "./trigram/tri1to50.Rda"
saveRDS(tri1to50,filep)

triFinal <- tri1to50[tri1to50$Freq>=3,]
filep <- "./trigram/triFinal.Rda"
saveRDS(triFinal,filep)

rm(tri1to50,triFinal)
