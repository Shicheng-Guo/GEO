
```
# for ips methylatin 450K analysis
library("GEOquery")
source("https://raw.githubusercontent.com/Shicheng-Guo/GEO/master/R/PCAPlot.R")
GSE108785 <- getGEO("GSE108785")
data <- as.data.frame(exprs(GSE108785[[1]]))
phen <- pData(phenoData(GSE108785[[1]]))
head(phen)
phen1<-phen[,grep("disease",colnames(phen))]
data1=na.omit(data)
PCAPlot(t(data1),phen1,output="GSE108785.pdf",multifigure=T)  # status
```
