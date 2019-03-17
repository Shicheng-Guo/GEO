```
system("wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE76nnn/GSE76269/suppl/GSE76269_betas.extra.epigenomics.tsv.gz")
system("gunzip GSE76269_betas.extra.epigenomics.tsv.gz")
data<-read.table("~/hpc/methylation/GEO/GSE76269_betas.extra.epigenomics.tsv",head=T,row.names=1,sep="\t")
```
