data<-read.table("GSE129705_c12-ra-wb-bl-mo3-processed-data-file.txt",head=T,sep="\t",check.names = F)
rownames(data)<-data[,1]
data<-data[,-c(1:6)]
write.table(data,file="GSE129705_c12-RA-WB-bl-mo3-processed-data.txt",sep="\t",quote=F,col.names = NA,row.names = T)
