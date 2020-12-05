rm(list=ls()) 
#install.packages("tidyverse")
library(tidyverse)

data1_df <- read.csv("trip_data_1.csv", header=TRUE)
data2_df <- read.csv("trip_data_2.csv", header=TRUE)
data3_df <- read.csv("trip_data_3.csv", header=TRUE)
data4_df <- read.csv("trip_data_4.csv", header=TRUE)
data5_df <- read.csv("trip_data_5.csv", header=TRUE)
data6_df <- read.csv("trip_data_6.csv", header=TRUE)

### JAN ###
#round the coordinates to 4 decimal places
coordinates1 <- data1_df %>%
  mutate(longitude_rounded = round(pickup_longitude,4)) %>%
  mutate(latitude_rounded = round(pickup_latitude,4)) %>%
  mutate(area = paste(latitude_rounded, longitude_rounded))

#select top 50 area coordinates
coordinates1 %>%
  select(area) %>%
  group_by(area) %>%
  summarise(count = n()) %>%
  top_n(50, count) %>% 
  write.csv("area_1.csv", na="")


### FEB ###
#round the coordinates to 4 decimal places
coordinates2 <- data2_df %>%
  mutate(longitude_rounded = round(pickup_longitude,4)) %>%
  mutate(latitude_rounded = round(pickup_latitude,4)) %>%
  mutate(area = paste(latitude_rounded, longitude_rounded))

#select top 50 area coordinates
coordinates2 %>%
  select(area) %>%
  group_by(area) %>%
  summarise(count = n()) %>%
  top_n(50, count) %>% 
  write.csv("area_2.csv", na="")

### MARCH ###
#round the coordinates to 4 decimal places
coordinates3 <- data3_df %>%
  mutate(longitude_rounded = round(pickup_longitude,4)) %>%
  mutate(latitude_rounded = round(pickup_latitude,4)) %>%
  mutate(area = paste(latitude_rounded, longitude_rounded))

#select top 50 area coordinates
coordinates3 %>%
  select(area) %>%
  group_by(area) %>%
  summarise(count = n()) %>%
  top_n(50, count) %>% 
  write.csv("area_3.csv", na="")

### APRIL ###
#round the coordinates to 4 decimal places
coordinates4 <- data4_df %>%
  mutate(longitude_rounded = round(pickup_longitude,4)) %>%
  mutate(latitude_rounded = round(pickup_latitude,4)) %>%
  mutate(area = paste(latitude_rounded, longitude_rounded))

#select top 50 area coordinates
coordinates4 %>%
  select(area) %>%
  group_by(area) %>%
  summarise(count = n()) %>%
  top_n(50, count) %>% 
  write.csv("area_4.csv", na="")

### MAY ###
#round the coordinates to 4 decimal places
coordinates5 <- data5_df %>%
  mutate(longitude_rounded = round(pickup_longitude,4)) %>%
  mutate(latitude_rounded = round(pickup_latitude,4)) %>%
  mutate(area = paste(latitude_rounded, longitude_rounded))

#select top 50 area coordinates
coordinates5 %>%
  select(area) %>%
  group_by(area) %>%
  summarise(count = n()) %>%
  top_n(50, count) %>% 
  write.csv("area_5.csv", na="")


### JUNE ###
#round the coordinates to 4 decimal places
coordinates6 <- data6_df %>%
  mutate(longitude_rounded = round(pickup_longitude,4)) %>%
  mutate(latitude_rounded = round(pickup_latitude,4)) %>%
  mutate(area = paste(latitude_rounded, longitude_rounded))

#select top 50 area coordinates
coordinates6 %>%
  select(area) %>%
  group_by(area) %>%
  summarise(count = n()) %>%
  top_n(50, count) %>% 
  write.csv("area_6.csv", na="")

