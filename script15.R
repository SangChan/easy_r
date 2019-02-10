# 15-1
exam <- read.csv("csv_exam.csv")
exam[]
exam[1,]
exam[2,]
exam[exam$class == 1,]
exam[exam$math >= 80,]
exam[exam$class == 1 & exam$math >= 50,]
exam[exam$english < 90 | exam$science < 50,]
exam[,1]
exam[,2]
exam[,3]
exam[,"class"]
exam[,"math"]
exam[,c("class","math","english")]
exam[1,3]
exam[5,"english"]
exam[exam$math >= 50, "english"]
exam[exam$math >= 50, c("english","science")]
exam$tot <- (exam$math + exam$english + exam$science)/3
aggregate(data=exam[exam$math >= 50 & exam$english >= 80,], tot~class, mean)
library(dplyr)
exam %>%
  filter(math >= 50, english >= 80) %>%
  mutate(tot = (math+english+science)/3) %>%
  group_by(class) %>%
  summarise(mean = mean(tot))
# 15-2
var1 <- c(1,2,3,1,2)
var2 <- factor(c(1,2,3,1,2))
var1
var2
var1+2
var2+2
class(var1)
class(var2)
levels(var1)
levels(var2)
var3 <- c("a","b","b","c")
var4 <- factor(c("a","b","b","c"))
var3
var4
class(var3)
class(var4)
mean(var1)
mean(var2)
var2 <- as.numeric(var2)
mean(var2)
class(var2)
levels(var2)
# 15-3
a <- 1
a
b <- "hello"
b
class(a)
class(b)
x1 <- data.frame(var1 = c(1,2,3),
                 var2 = c("a","b","c"))
x1
class(x1)
x2 <- matrix(c(1:12), ncol = 2)
x2
class(x2)
x3 <- array(1:20, dim = c(2,5,2))
x3
class(x3)
x4 <- list(f1 = a,
           f2 = x1,
           f3 = x2,
           f4 = x3)
x4
class(x4)
mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)
x
x$stats[,1]
x$stats[,1][3]
x$stats[,1][2]
