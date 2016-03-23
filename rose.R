library(ggplot2)
rose <- ggplot(mapping = aes(x = df$deg)) +
  stat_bin(breaks = (0:16 - 0.5)/16 * 360, fill ="cornsilk") +
  scale_x_continuous(
    breaks = 0:7/8*360, 
    labels = c("N", "NE", "E", "SE", "S", "SW", "W", "NW")
  ) +
  coord_polar(start=-pi/16)+
  
  theme(
    axis.title.x = element_blank(),
    panel.background = element_rect(fill = "darkgrey"))