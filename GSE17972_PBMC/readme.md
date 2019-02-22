# 2016-12-29
 liftOver GSE17972.hg18.bedgraph ~/work/db/hg18/hg18ToHg19.over.chain GSE17972.hg19.bedgraph tmp
 sort -u -k1,1 -k2,2n GSE17972.hg19.bedgraph > GSE17972.hg19.bedgraph.sort
 bedGraphToBigWig GSE17972.hg19.bedgraph.sort ~/work/db/hg19/hg19.chrom.sizes GSE17972.hg19.bw
 track type=bigWig color=0,0,255 visibility=2 maxHeightPixels=128:30:11 smoothingWindow=16 windowingFunction=mean name="PBMC" description="Yanhuang-methylome" bigDataUrl=http://132.239.25.238/shg047/NAS3/shg047/Yanhuang2010/GSE17972.hg19.bw

 liftOver GSE17972.hg18.bedgraph ~/work/db/hg18/hg18ToHg38.over.chain GSE17972.hg38.bedgraph tmp
 sort -u -k1,1 -k2,2n GSE17972.hg38.bedgraph > GSE17972.hg38.bedgraph.sort
 bedGraphToBigWig GSE17972.hg38.bedgraph.sort /media/Home_Raid1/shg047/work/db/hg38/hg38.chrom.sizes GSE17972.hg38.bw
 track type=bigWig color=0,0,255 visibility=2 maxHeightPixels=128:30:11 smoothingWindow=16 windowingFunction=mean name="Yanhuang-methylome" description="PBMC" bigDataUrl=http://132.239.25.238/shg047/NAS3/shg047/Yanhuang2010/GSE17972.hg38.bw
 
 GSE17972.hg19.bw
 GSE17972.hg19.bedgraph.sort
 
for i in `ls *job`
do

if [! -e ]

for i in SRR1035834 SRR1035835 SRR1035844 SRR1035831 SRR1035784 SRR1035893 SRR1035884 SRR1035843 SRR1035895 SRR1035832 SRR1035882 SRR1035881 SRR1035845 SRR1035833
do
qsub $i.fastq.download.job
done

for i in `ls *bam`
do
touch $i
done


 install CPAN
 reload cpan

 # qmap to bedgraph, liftOver hg18 to hg19 and hg38, finally sort the bedgraph 

 for i in `ls *.txt`
 do
 echo $i
 perl qmap2bedgraph.pl $i > $i.bedgraph
 done
 
 # merge liftOver 
 for i in `ls *.bedgraph`
 do
 echo $i
 liftOver $i /media/Home_Raid1/shg047/work/db/hg18/hg18ToHg19.over.chain $i.hg19 tmp
 liftOver $i /media/Home_Raid1/shg047/work/db/hg18/hg18ToHg19.over.chain $i.hg38 tmp
 done
 
 # Sort liftOver bedgraph
 for i in `ls *.bedgraph.hg19`
 do
 echo $i
 sort -k1,1 -k2,2n $i > $i.sort
 done

 for i in `ls *.bedgraph.hg38`
 do
 echo $i
 sort -k1,1 -k2,2n $i > $i.sort
 done

 # merge bedgraph by chrosome
 cat *hg18.sort > GSE17972.YanHuang.hg18.bedgraph 
 cat *hg19.sort > GSE17972.YanHuang.hg19.bedgraph 
 cat *hg38.sort > GSE17972.YanHuang.hg38.bedgraph 

 # bedgraph to bigwig 
 for i in `ls *.bedgraph`
 do
 echo $i
 bedGraphToBigWig $i ~/work/db/hg18/hg18.chrom.sizes $i.bw
 bedGraphToBigWig $i ~/work/db/hg19/hg19.chrom.sizes $i.bw
 bedGraphToBigWig $i ~/work/db/hg38/hg38.chrom.sizes $i.bw
 done
