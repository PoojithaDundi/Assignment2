set.seed(6497)
Data = read.csv("~/Downloads/diabetes.csv")
View(Data)
dim(Data)
sample25 = Data[sample(768,25),]
View(sample25)
dim(sample25)
mean25 = mean(sample25$Glucose)
mean25
High_gluco25 = max(sample25$Glucose)
High_gluco25
mean_all = mean(Data$Glucose)
mean_all
High_Gluco_all = max(Data$Glucose)
High_Gluco_all
plot1 = barplot(c(mean25,mean_all), col = c("blue", "red"), main = "Comparison of mean of Glucose", ylab = "Glucose", names.arg = c("mean25","mean_all"))
plot2 = barplot(c(High_gluco25,High_Gluco_all), col = c("grey", "green"), main = "Comparison of highest level of Glucose", ylab = "Glucose", names.arg = c("High_gluco25","High_Gluco_all"))