library(dplyr)

df <- read.csv("avalanche.csv")

df$Victims..caught..buried.<- as.character(df$Victims..caught..buried.)
df$Date <- as.Date(df$Date, format = "%d-%b-%y")
df$mon <- months(df$Date)
df$mon <- factor(df$mon, levels = c("December","January", "February", "March", "April", "May", 
                                    "June","July", "August", "September", "October", "November"))
df <- mutate(df, Fatalities = as.integer(substr(Victims..caught..buried.,1,1))) %>%
      mutate(deg = ifelse(Aspect == "N", 0, 
                       ifelse(Aspect == "NNE", 22.5, 
                       ifelse(Aspect == "NE", 45,
                       ifelse(Aspect == "ENE", 67.5,
                       ifelse(Aspect == "E", 90,
                       ifelse(Aspect == "ESE", 112.5,
                       ifelse(Aspect == "SE", 135,
                       ifelse(Aspect == "SSE", 157.5,
                       ifelse(Aspect == "S", 180,
                       ifelse(Aspect == "SSW", 202.5,
                       ifelse(Aspect == "SW", 225,
                       ifelse(Aspect == "WSW", 247.5,
                       ifelse(Aspect == "W", 270,
                       ifelse(Aspect == "WNW", 292.5,
                       ifelse(Aspect == "NW", 315,
                       ifelse(Aspect == "NNW", 337.5, NA
                             ))))))))))))))))) %>%
     mutate(degjit = jitter(deg,1,7)) %>%
     mutate(activity = ifelse(Activity == "1", "Backcountry touring",
                       ifelse(Activity == "2", "Off-piste skiing/boarding",
                       ifelse(Activity == "3", "Transportation corridors",
                       ifelse(Activity == "4", "Buildings", NA
                                  )))))
     df$activity <- as.factor(df$activity)

  

