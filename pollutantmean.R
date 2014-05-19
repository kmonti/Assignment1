pollutantmean <- function (directory, pollutant, id = 1:332) {
  myfilelist <- list.files (path)
  filenames <- as.numeric(sub("\\.csv$", "", myfilelist))
  usefiles <- myfilelist[match(id,filenames)]
  useData1 <- lapply(file.path(path,usefiles), read.csv)
  fullData=do.call(rbind.data.frame,useData1)
  mean(fullData[,pollutant], na.rm=TRUE)
}

