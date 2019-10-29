
```
wget -r -l 1 -nd -e robots=off --reject jpg,html https://ftp.ncbi.nlm.nih.gov/geo/series/GSE16nnn/GSE16256/suppl/

library("GEOquery")
GSE16256 <- getGEO("GSE16256")
data <- as.data.frame(exprs(GSE16256[[1]]))
phen <- pData(phenoData(GSE16256[[1]]))

phen1<-sapply(strsplit(as.character(phen$characteristics_ch1.7),"[:]"),function(x) as.numeric(unlist(x)[2]))  # status 1:control, 2:scz
phen1[phen1==1]<-"Normal"
phen1[phen1==2]<-"schizophrenia"
phen2<-sapply(strsplit(as.character(phen$characteristics_ch1),"[:]"),function(x) (unlist(x)[2]))  # gender

data1=na.omit(data)
PCAPlot(t(data1),phen1,output="GSE41169.scz.normal.pdf",multifigure=T)  # status
PCAPlot(t(data1),phen2,output="GSE41169.gender.pdf",multifigure=T)  # gender
```
