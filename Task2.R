set.seed(6497)
Data = read.csv("~/Downloads/diabetes.csv")
View(Data)
dim(Data)
sample25 = Data[sample(768,25),]
View(sample25)
dim(sample25)
bmi_25 = quantile(sample25$BMI,0.98)
bmi_25
bmi_all = quantile(Data$BMI,0.98)
bmi_all
plot3 = barplot(c(bmi_25,bmi_all), col = c("orange", "white"), main = "Comparison of bmi of 98 percentile", ylab = "BMI", names.arg = c("bmi_25","bmi_all"))