# rose diagrams of avalanche aspect faceted by month
library(ggplot2)
winter <- filter(df, mon == "December"|
                     mon == "January"|
                     mon == "February"|
                     mon == "March"|
                     mon == "April")
rosefacet <- ggplot(winter, mapping = aes(x = deg)) +
  stat_bin(breaks = (0:16 - 0.5)/16 * 360, fill ="cornflowerblue") +
  scale_x_continuous(
    breaks = 0:7/8*360, 
    labels = c("N", "NE", "E", "SE", "S", "SW", "W", "NW")) +
  coord_polar(start=-pi/16) +
  ggtitle("Slope aspect of fatal avalanches in Switzerland by month, 1995 - 2016")+
  facet_grid(. ~ mon) +
  theme_bw()+
  theme(axis.title.x = element_blank())
