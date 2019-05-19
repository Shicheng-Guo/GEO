```
library("GEOquery")
GSE65908 <- getGEO("GSE65908")
data <- as.data.frame(exprs(GSE65908[[1]]))
```
