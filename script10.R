#10-1
remove.packages("rJava")
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
Sys.setenv(JAVA_HOME ="/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/jre")
dyn.load("/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/jre/lib/server/libjvm.dylib")
library(rJava)
library(KoNLP)