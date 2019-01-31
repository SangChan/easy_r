#10-1
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
install.packages("stringr")
Sys.setenv(JAVA_HOME ="/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/jre")
dyn.load("/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/jre/lib/server/libjvm.dylib")
library(rJava)
library(KoNLP)
library(dplyr)
useNIADic()
txt <- readLines(file("hiphop.txt", encoding = "EUC-KR"))
head(txt)
library(stringr)
txt <- str_replace_all(txt, "\\W", " ")
nouns <- extractNoun(txt)
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = FALSE)
df_word <- rename(df_word, word = Var1, freq = Freq)
df_word <- filter(df_word, nchar(word) >= 2)
top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)
top_20

install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)
pal <- brewer.pal(8,"Dark2")
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = FALSE,
          rot.per = .1,
          scale = c(4,0,3),
          color = pal)
#10.2
twitter <- read.csv("twitter.csv",header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
twitter <- rename(twitter, no = 번호, id = 계정이름, date = 작성일, tw = 내용)
twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")
head(twitter)
nouns <- extractNoun(twitter$tw)
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = FALSE)
df_word <- rename(df_word, word = Var1, freq = Freq)
df_word <- filter(df_word, nchar(word) >= 2)
top20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)
top20
library(ggplot2)
order <- arrange(top20, freq)$word
ggplot(data = top20, aes(x = word, y = freq)) +
  ylim(0,2500) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limit = order) +
  geom_text(aes(label = freq), hjust = -0.3)
pal <- brewer.pal(8,"Dark2")
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 10,
          max.words = 200,
          random.order = FALSE,
          rot.per = .1,
          scale = c(6,0.2),
          colors = pal)
