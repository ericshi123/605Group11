rm(list=ls()) 
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggmap)
register_google(key = "AIzaSyDUf9WsYILNDi5vsUOrNbQHMpebl0W2pac")
area1 = read.csv("area_1.csv")
area2 = read.csv("area_2.csv")
area3 = read.csv("area_3.csv")
area4 = read.csv("area_4.csv")
area5 = read.csv("area_5.csv")
area6 = read.csv("area_6.csv")
area = bind_rows(area1,area2,area3,area4,area5,area6)
area = area[-which(area$area=="0 0"),]
length(unique(area$area))

area = separate(area,col = "area",sep = " ",into = c("lat","lon"))
area$lat = as.numeric(area$lat)
area$lon = as.numeric(area$lon)

map <- get_map(location=c(lon=-73.935242,lat=40.730610),
               zoom=12, maptype='roadmap')
ggmap(map, extent = "device") +
  geom_point(data = area, aes(x = lon,y = lat, size = count), alpha=0.2) 


