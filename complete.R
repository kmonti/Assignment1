complete = function(directory, id= 1:332) {
  myfilelist <- list.files (path)
  filenames <- as.numeric(sub("\\.csv$", "", myfilelist))
  usefiles <- myfilelist[match(id,filenames)]
  useData1 <- lapply(file.path(path,usefiles), read.csv)
  fullData=do.call(rbind.data.frame,useData1)
  cc <- complete.cases(fullData)
  fullData <- fullData[cc,]
  result <-  tapply(fullData[,"sulfate"],fullData[,"ID"], length)  
  df <- data.frame(id=names(result), nobs=result)
  return(df)
}
