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
