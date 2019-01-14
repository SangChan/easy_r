exam <- read.csv("csv_exam.csv")
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)
View(exam)
dim(exam)
str(exam)
summary(exam)

install.packages("ggplot2")
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw
install.packages("dplyr")
library(dplyr)
df_new <- df_raw
df_new

df_new <- rename(df_new, v2 = var2)
df_new
df_raw

df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df
df$var_sum <- df$var1 + df$var2
df
df$var_mean <- (df$var1 + df$var2)/2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

mean(mpg$total)

summary(mpg$total)
hist(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)
table(mpg$test)
library(ggplot2)
qplot(mpg$test)
