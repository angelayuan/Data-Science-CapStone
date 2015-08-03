uni <- readRDS("./unigram/uni1to50.Rda")  # 654032 * 2

totalCount <- sum(uni$Freq)

big3 <- sum(uni[uni$Freq>=3,]$Freq)
big4 <- sum(uni[uni$Freq>=4,]$Freq)
big5 <- sum(uni[uni$Freq>=5,]$Freq)
big6 <- sum(uni[uni$Freq>=6,]$Freq)
big7 <- sum(uni[uni$Freq>=7,]$Freq)
big8 <- sum(uni[uni$Freq>=8,]$Freq)
big9 <- sum(uni[uni$Freq>=9,]$Freq)
big10 <- sum(uni[uni$Freq>=10,]$Freq)

dim(uni[uni$Freq>=3,])
100*big3/totalCount # 98.9367

dim(uni[uni$Freq>=4,])
100*big4/totalCount # 98.77034

dim(uni[uni$Freq>=5,])
100*big5/totalCount # 98.63589

dim(uni[uni$Freq>=6,])
100*big6/totalCount # 98.5279

dim(uni[uni$Freq>=7,])
100*big7/totalCount # 98.43445

dim(uni[uni$Freq>=8,])
100*big8/totalCount # 98.34981    67491*2

dim(uni[uni$Freq>=9,])
100*big9/totalCount # 98.27301

dim(uni[uni$Freq>=10,])
100*big10/totalCount # 98.20345    58018*2

dim(uni[uni$Freq>=15,]) 
100*sum(uni[uni$Freq>=15,]$Freq)/totalCount # 97.9235  44929*2

dim(uni[uni$Freq>=20,]) 
100*sum(uni[uni$Freq>=20,]$Freq)/totalCount # 97.70626  37852*2

dim(uni[uni$Freq>=30,]) 
100*sum(uni[uni$Freq>=30,]$Freq)/totalCount # 97.36261  29995*2

saveRDS(uni[uni$Freq>=30,],"./unigram/uni30Freq.Rda")

dim(uni[uni$Freq>=50,]) 
100*sum(uni[uni$Freq>=50,]$Freq)/totalCount # 96.85335 22697*2

dim(uni[uni$Freq>=100,]) 
100*sum(uni[uni$Freq>=100,]$Freq)/totalCount # 95.93291 15500*2

saveRDS(uni[uni$Freq>=30,],"./unigram/uni100Freq.Rda")


#--------------------------------------------
bi <- readRDS("./bigram/bi1to50.Rda")  # 8608068 * 2

totalCount <- sum(bi$Freq)

dim(bi[bi$Freq>=3,]) 
100*sum(bi[bi$Freq>=3,]$Freq)/totalCount # 88.14776 1674002*2

dim(bi[bi$Freq>=10,]) 
100*sum(bi[bi$Freq>=10,]$Freq)/totalCount # 80.1682 528776*2

saveRDS(bi[bi$Freq>=10,],"./bigram/bi10Freq.Rda")


#-----------------------------------------------
tri <- readRDS("./trigram/tri1to50.Rda")  # 29333400 * 2

totalCount <- sum(tri$Freq)

dim(tri[tri$Freq>=3,]) 
100*sum(tri[tri$Freq>=3,]$Freq)/totalCount # 53.61391    2721191*2

dim(tri[tri$Freq>=10,]) 
100*sum(tri[tri$Freq>=10,]$Freq)/totalCount # 38.39902   584645*2

saveRDS(tri[tri$Freq>=10,],"./trigram/tri10Freq.Rda")

#---------------------------------------------------------

quadri <- readRDS("./quadrigram/quadri1to50.Rda")  # 29333400 * 2

totalCount <- sum(quadri$Freq)

dim(quadri[quadri$Freq>=3,]) 
100*sum(quadri[quadri$Freq>=3,]$Freq)/totalCount # 53.61391    2721191*2

dim(quadri[quadri$Freq>=10,]) 
100*sum(quadri[quadri$Freq>=10,]$Freq)/totalCount # 38.39902   584645*2

saveRDS(quadri[quadri$Freq>=10,],"./quadrigram/quadri10Freq.Rda")

