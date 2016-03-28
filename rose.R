# rose diagram of avalanche aspect
library(ggplot2)
rose <- ggplot(mapping = aes(x = df$deg)) +
  stat_bin(breaks = (0:16 - 0.5)/16 * 360, fill ="cornflowerblue") +
  scale_x_continuous(
    breaks = 0:7/8*360, 
    labels = c("N", "NE", "E", "SE", "S", "SW", "W", "NW")
  ) +
  coord_polar(start=-pi/16)+
  ggtitle("Slope aspect of fatal avalanches in Switzerland, 1995 - 2016")+
  theme_bw()+
  theme(
    axis.title.x = element_blank()
    )
