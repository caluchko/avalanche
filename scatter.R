#radial scatter plot published in plotly using plotly R API
library(plotly)
library(ggplot2)

Sys.setenv("plotly_username"="caluchko")
Sys.setenv("plotly_api_key"="cqdk1g1p7k")

df$Activity <- as.factor(df$Activity)
p <- plot_ly(plotly::hobbs, r = df$Elevation..m., t = df$degjit, color = df$activity,
             opacity = .8, mode = "markers") %>%
layout(title = "Fatal Swiss avalanches 1995 - 2016: Slope aspect, elevation, and activity",
       orientation = 270, radialaxis = list(ticksuffix = "m", orientation = -40))
p
plotly_POST(p, filename = "av_scatter")

