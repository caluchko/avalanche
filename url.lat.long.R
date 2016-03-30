# Extracts CH1903 LV03 coordinates from SLF url
# df from avalanche.R script
library(stringr)
xy <- str_match(df$url, "Y=([0-9]+)&X=([0-9]+)") 
y <- as.numeric(xy[,2])
x <- as.numeric(xy[,3])
y[316] <- 600000 #url had scientific notation

# Conversion scripts by SLF
## Convert CH y/x to WGS lat
CH.to.WGS.lat <- function (y, x){
  
  ## Converts military to civil and  to unit = 1000km
  ## Auxiliary values (% Bern)
  y_aux <- (y - 600000)/1000000
  x_aux <- (x - 200000)/1000000
  
  ## Process lat
  lat <- {16.9023892 +
      3.238272 * x_aux -
      0.270978 * (y_aux^2) -
      0.002528 * (x_aux^2) -
      0.0447   * (y_aux^2) * x_aux -
      0.0140   * (x_aux^3)}
  
  ## Unit 10000" to 1 " and converts seconds to degrees (dec)
  lat <- lat * 100/36
  
  return(lat)  
}

## Convert CH y/x to WGS long
CH.to.WGS.lng <- function (y, x){
  
  ## Converts military to civil and  to unit = 1000km
  ## Auxiliary values (% Bern)
  y_aux <- (y - 600000)/1000000
  x_aux <- (x - 200000)/1000000
  
  ## Process long
  lng <- {2.6779094 +
      4.728982 * y_aux +
      0.791484 * y_aux * x_aux +
      0.1306   * y_aux * (x_aux^2) -
      0.0436   * (y_aux^3)}
  
  ## Unit 10000" to 1 " and converts seconds to degrees (dec)
  lng <- lng * 100/36
  
  return(lng)
}
# Append lat and long columns to data from and export
df <- mutate(df, lat = CH.to.WGS.lat(y,x), long = CH.to.WGS.lng(y,x))
write.csv(df, file = "avalanche-geo.csv", row.names = FALSE)