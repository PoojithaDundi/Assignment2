set.seed(6497)
Data = read.csv("~/Downloads/diabetes.csv")
View(Data)
dim(Data)
Bp = Data$BloodPressure
Bp_mean = mean(Bp)
Bp_sd = sd(Bp)
Bp_perc = quantile(Bp,0.98)
boot_strap <- function(Data, n_boot, sample_size) {
  +     bs_mean <- numeric(n_boot)
  +     bs_sd <- numeric(n_boot)
  +     bs_perc <- numeric(n_boot)
  +     
    +     for (i in 1:n_boot) {
      +         sample_bs <- sample(Data, size = sample_size, replace = TRUE)
      +         
        +        
        +         bs_mean[i] <- mean(sample_bs)
        +         bs_sd[i] <- sd(sample_bs)
        +         bs_perc[i] <- quantile(sample_bs, 0.98)
        +     }
  + list(mean = bs_mean, sd = bs_sd, perc_98 = bs_perc)
  + }
n_boot <- 500
sample_size <- 150
boot_results <- boot_strap(Bp, n_boot, sample_size)
boot_mean <- mean(boot_results$mean)
boot_sd <- sd(boot_results$mean)
plot3 = barplot(c(Bp_mean,boot_mean), col = c("black", "white"), main = "Comparison of mean of 500 and pop", ylab = "BP", names.arg = c("Bp_mean","boot_mean"))
plot4 = barplot(c(Bp_sd,boot_sd), col = c("red", "blue"), main = "Comparison of sd of 500 and pop", ylab = "BP", names.arg = c("Bp_sd","boot_sd"))
plot5 = barplot(c(Bp_perc,boot_perc), col = c("green", "yellow"), main = "Comparison of percentile of 500 and pop", ylab = "Bp", names.arg = c("Bp_perc","boot_perc"))