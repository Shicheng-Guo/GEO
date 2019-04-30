setwd("/home/guosa/hpc/GEO/meth450")
library("GEOquery")
input<-read.table("GPL13534.txt")
for(i in 1:nrow(input)){
  temp <- getGEO(input[i,1],getGPL = F)
  beta <- as.data.frame(exprs(temp[[1]]))
  phen <- pData(phenoData(temp[[1]]))
  data<-list()
  data$beta=beta
  data$phen=phen
  save(data,file=paste(input[i,1],".RData",sep=""))
}

