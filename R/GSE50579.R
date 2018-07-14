library("GEOquery")
gse <- getGEO("GSE50579", GSEMatrix = TRUE)
show(gse)
filePaths = getGEOSuppFiles("GSE50579")
filePaths
dim(pData(gse[[1]]))
head(pData(gse[[1]])[, 1:3])
df1 <- getGSEDataTables("GSE50579")
lapply(df1, head)

