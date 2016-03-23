library(ggplot2)
winter <- filter(df, mon == "December"|
                     mon == "January"|
                     mon == "February"|
                     mon == "March"|
                     mon == "April")
rosefacet <- ggplot(winter, mapping = aes(x = deg)) +
  stat_bin(breaks = (0:16 - 0.5)/16 * 360) +
  scale_x_continuous(
    breaks = 0:7/8*360, 
    labels = c("N", "NE", "E", "SE", "S", "SW", "W", "NW")) +
  coord_polar(start=-pi/16) +
  facet_grid(. ~ mon) +
  theme_bw()+
  theme(axis.title.x = element_blank())
