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