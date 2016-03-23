library(plotly)
library(ggplot2)

df <- df[df$Aspect != "",]
df$Aspect <- droplevels(df$Aspect)

df$Aspect <- factor(df$Aspect, levels = c(
  "N",
  "NNE",
  "NE",
  "ENE",
  "E",
  "ESE",
  "SE",
  "SSE",
  "S",
  "SSW",
  "SW",
  "WSW",
  "W",
  "WNW",
  "NW",
  "NNW" 
))

num <- table(df$Aspect)
p <- plot_ly(plotly::wind, r = test, t = df$Aspect, type = "area")
layout(p, orientation = 270)