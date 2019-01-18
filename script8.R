#8.2
library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy))
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3,6) +
  ylim(10,30)

#8.3
library(dplyr)
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
df_mpg
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()
ggplot(data = mpg, aes(x = drv)) + geom_bar()
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

#8.4
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

#8.5
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
