# run
# rscript install.R
#

library(foreach)

urls <- list(
  c(name="geneInfo", url="https://firebasestorage.googleapis.com/v0/b/firebase-bcloud.appspot.com/o/idep%2FgeneInfo%2FgeneInfo.zip?alt=media&token=a281e5cf-6900-493c-81e4-89ce423c26bb"),
  c(name="gmt", url="https://firebasestorage.googleapis.com/v0/b/firebase-bcloud.appspot.com/o/idep%2FgeneInfo%2Fgmt.zip?alt=media&token=5ee100d1-e645-41ef-a591-7a9ba208ce3c"),
  c(name="motif", url="https://firebasestorage.googleapis.com/v0/b/firebase-bcloud.appspot.com/o/idep%2FgeneInfo%2Fmotif.zip?alt=media&token=dc1e5972-ffd9-43a1-bbcc-49b78da6f047"),
  c(name="pathwayDB", url="https://firebasestorage.googleapis.com/v0/b/firebase-bcloud.appspot.com/o/idep%2FgeneInfo%2FpathwayDB.zip?alt=media&token=e602f2f7-102a-4cc4-8412-be2b05997daa")
)
downloadFiles <- function(obj) {
  destfile <- paste("./data/",obj['name'],".zip", sep="")
  print(destfile)
  print(obj['url'])
  download.file(obj['url'], destfile, mode="a", method="wget", cacheOK = TRUE, extra="--continue")
  #unzip (destfile, exdir = paste("./",obj['name'],sep=""))
}
unzipDownload <- function(obj){
  destfile <- paste("./data/",obj['name'],".zip", sep="")
  unzip (destfile, exdir = "./")
}
foreach(i=urls,  .combine=c) %dopar% downloadFiles(i)
foreach(i=urls,  .combine=c) %dopar% unzipDownload(i)
