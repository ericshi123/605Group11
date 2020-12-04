rm(list=ls())
args = (commandArgs(trailingOnly = TRUE))
data = args[1]

library(ggmap)
library(ggplot2)
#The first heatmap
register_google(key = "AIzaSyDUf9WsYILNDi5vsUOrNbQHMpebl0W2pac")
map <- get_map(location=c(lon=-73.935242,lat=40.730610),
               zoom=11, maptype='roadmap', color='bw')
map1 = ggmap(map, extent = "device") +
  geom_bin2d(data = data, aes(x = pickup_longitude,y = pickup_latitude),bins=100) +
  scale_x_continuous(limits = c(-74.05, -73.75)) +
  scale_y_continuous(limits = c(40.635, 40.815)) +
  scale_fill_gradient(low="lightblue",high="purple")
jpeg('map1.jpg')
map1
dev.off()

#code that creates "area" dataframe
library(tidyverse)
library(tidyr)

#round the coordinates to 4 decimal places
coordinates <- data %>%
  mutate(longitude_rounded = round(pickup_longitude,4)) %>%
  mutate(latitude_rounded = round(pickup_latitude,4)) %>%
  mutate(area = paste(latitude_rounded, longitude_rounded))

#select top 100 area coordinates
area = coordinates %>%
  select(area) %>%
  group_by(area) %>%
  summarise(count = n()) %>%
  top_n(100, count)
#data clean
area = area[-which(area$area=="0 0"),]
area = separate(area,col = "area",sep = " ",into = c("lat","lon"))
area$lat = as.numeric(area$lat)
area$lon = as.numeric(area$lon)

map2 = ggmap(map, extent = "device") +
  geom_point(data = area, aes(x = lon,y = lat,size=count)) +
  scale_x_continuous(limits = c(-74.05, -73.75)) +
  scale_y_continuous(limits = c(40.635, 40.815))

jpeg('map2.jpg')
map2
dev.off()
