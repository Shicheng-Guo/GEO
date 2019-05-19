```
library("GEOquery")
GSE45665 <- getGEO("GSE45665")
data1 <- as.data.frame(exprs(GSE45665[[1]]))
```
