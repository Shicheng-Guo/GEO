# GPL13534	Illumina HumanMethylation450 BeadChip (HumanMethylation450_15017482)

library("GEOquery")
GSE41169 <- getGEO("GSE41169")
GSE53045 <- getGEO("GSE53045")
GSE35069 <- getGEO("GSE35069")
GSE32148 <- getGEO("GSE32148")
GSE36054 <- getGEO("GSE36054")
GSE36064 <- getGEO("GSE36064")
GSE42861 <- getGEO("GSE42861")

data1 <- as.data.frame(exprs(GSE41169[[1]]))
data2 <- as.data.frame(exprs(GSE53045[[1]]))
data3 <- as.data.frame(exprs(GSE35069[[1]]))
data4 <- as.data.frame(exprs(GSE32148[[1]]))
data5 <- as.data.frame(exprs(GSE36054[[1]]))
data6 <- as.data.frame(exprs(GSE36064[[1]]))
data7 <- as.data.frame(exprs(GSE42861[[1]]))

head(data1[1:5,1:5])
head(data2[1:5,1:5])
head(data3[1:5,1:5])
head(data4[1:5,1:5])
head(data5[1:5,1:5])
head(data6[1:5,1:5])
head(data7[1:5,1:5])

dim(data1)
dim(data2)
dim(data3)
dim(data4)
dim(data5)
dim(data6)
dim(data7)

data<-cbind(data1,data2,data3,data4,data5,data6,data7)
tmp<-t(apply(data,1,function(x) c(cpg=rownames(x),mean=mean(x,na.rm=T),
                                  median=median(x,na.rm=T),
                                  SD=sd(x,na.rm=T),
                                  Quantile=quantile(x,na.rm=T),
                                  SampleSize=length(na.omit(x)))))
write.table(tmp,file="Normal.PBMC.GEO.HM450K.Beta.txt",col.names=NA,row.names=T,sep="\t",quote=F)

tmp<-data.frame(tmp)
hypo<-subset(tmp,mean<0.3 & median<0.3 & Quantile.75.<0.3)
hype<-subset(tmp,mean>0.6 & median>0.6 & Quantile.75.>0.6)

