##Import Data
setwd("~/Dropbox/Mestrado/CAP-386-Introduction-To-Data-Science/project/data")
data = read.table("data20030801to20031130.txt")
plot(data$V5, type='linear')