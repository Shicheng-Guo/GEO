PCAPlot<-function(data,pheno,output,multifigure=T){
  pca <- prcomp(data,center=T,scale = F)  # Here, input file: row is individual and column is variable
  outputfile=paste(output,".pdf",sep="")
  pdf(outputfile)
  if(multifigure){
    par(mfrow=c(2,2),mar=c(4,4,4,4)) 
  }
  plot((pca$sdev[1:10])^2,type="o",xaxt="n",ylab="Variances",xlab="Principle Components",col="red",lwd=2)
  axis(1,at=0:10,labels=paste("PC",0:10,sep=""))
  var<-c()
  for(i in 1:length(pca$sdev)){var[i]<-sum((pca$sdev[1:i])^2)/sum((pca$sdev)^2)}
  plot(var,ylab="total variance",xlab="number of principle components",lwd=2,type="l")
  abline(h=0.8,col="grey",lty=2)
  abline(v=which(var>0.8)[1],col="grey",lty=2)
  scores <- data.frame(pheno, pca$x[,1:3])
  col = as.numeric(as.factor(pheno))
  plot(x=scores$PC1,y=scores$PC2, xlim=c(min(scores$PC1),max(scores$PC1)),ylim=c(min(scores$PC2),max(scores$PC2)),type="n",xlab="PC1",ylab="PC2")
  for(i in 1:length(scores$PC1)){
    points(scores$PC1[i],scores$PC2[i],pch=as.numeric(as.factor(pheno))[i],col=col[i],cex=0.8,lwd=2)
  }
  legend("topleft",legend=names(table(pheno)),pch=1:length(table(pheno)),col=1:length(table(pheno)),bty="n",pt.lwd=2,,cex=0.5)
  plot(x=scores$PC1,y=scores$PC3, xlim=c(min(scores$PC1),max(scores$PC1)),ylim=c(min(scores$PC3),max(scores$PC3)),type="n",xlab="PC1",ylab="PC3")
  for(i in 1:length(scores$PC1)){
    points(scores$PC1[i],scores$PC3[i],pch=as.numeric(as.factor(pheno))[i],col=col[i],cex=0.9,lwd=2)
  }
  legend("bottomleft",legend=names(table(pheno)),pch=1:length(table(pheno)),col=1:length(table(pheno)),bty="n",pt.lwd=2,cex=0.5)
  dev.off()
}
