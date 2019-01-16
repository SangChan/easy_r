library(dplyr)
exam <- read.csv("csv_exam.csv")
exam
exam %>% filter(class==1)
exam %>% filter(class==2)
exam %>% filter(class!=1)
exam %>% filter(class!=3)
exam %>% filter(math>50)
exam %>% filter(math<50)
exam %>% filter(english>=80)
exam %>% filter(english<=80)
exam %>% filter(class==1&math>=50)
exam %>% filter(class==2&english>=80)
exam %>% filter(math>=90|english>=90)
exam %>% filter(english<90|science<50)
exam %>% filter(class==1|class==3|class==5)
exam %>% filter(class %in% c(1,3,5))

class1 <- exam %>% filter(class==1)
class2 <- exam %>% filter(class==2)
mean(class1$math)
mean(class2$math)

exam %>% select(math)
exam %>% select(english)
exam %>% select(class,math,english)
exam %>% select(-math)
exam %>% select(-math,-english)
exam %>% filter(class==1) %>% select(english)
exam %>%
  select(id,math) %>%
  head(10)
exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class,math)

exam %>%
  mutate(total = math+english+science) %>%
  head
exam %>%
  mutate(total = math+english+science,
         mean = (math+english+science)/3) %>%
  head
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head
exam %>%
  mutate(total = math+english+science) %>%
  arrange(total) %>%
  head

exam %>% summarise(mean_math = mean(math))
exam %>% 
  group_by(class) %>%
  summarise(mean_math = mean(math))
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_city=mean(cty)) %>%
  head(10)
mpg %>%
  group_by(manufacturer) %>%
  filter(class == "suv") %>%
  mutate(tot = (cty+hwy)/2) %>%
  summarise(mean_tot = mean(tot)) %>%
  arrange(desc(mean_tot)) %>%
  head(5)

test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test1
test2
total <- left_join(test1, test2, by = "id")
total
name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim","lee","park","choi","jung"))
name
exam_new <- left_join(exam, name, by = "class")
exam_new
group_a <- data.frame(id = c(1,2,3,4,5),
                       test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70,83,65,95,80))
group_a
group_b
group_all <- bind_rows(group_a, group_b)
group_all
