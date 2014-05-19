corr <- function(directory, threshold = 0) {
  corrfunc <- function(onefile) {
    data <- read.csv(file.path(directory, onefile))
    numcomplete <- sum(complete.cases(data))
    if (numcomplete > threshold) {
      return (cor(data$nitrate, data$sulfate, use="complete.obs"))
    }
  }
  sendback <- sapply(list.files(directory), corrfunc)    
  sendback <- unlist(sendback [!sapply(sendback, is.null)])
  df=data.frame(sendback)
  final = df[,1] 
  
}
