
#using pacman to install and load packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load("GEOquery","minfi","ChAMP")

#increase file download timeout
options(timeout = 600)

#download GEO object
gse <- getGEO("GSE130030", GSEMatrix = TRUE)
#get phenotype data - sample sheet
pd = pData(gse[[1]])

#get raw data - idats, processed beta matrix, etc.
getGEOSuppFiles("GSE130030")
#decompress idats
untar("GSE130030/GSE130030_RAW.tar", exdir = "GSE130030/idat")
#list files
head(list.files("GSE130030/idat", pattern = "idat"))
idatFiles <- list.files("GSE130030/idat", pattern = "idat.gz$", full = TRUE)
#decompress individual idat files
sapply(idatFiles, gunzip, overwrite = TRUE)
#read idats and create RGSet
RGSet <- read.metharray.exp("GSE130030/idat")

saveRDS(RGSet, "RGSet_GSE12345.RDS")



