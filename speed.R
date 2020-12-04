rm(list=ls())

#install.packages("tidyr")
library(dplyr)
library(tidyr)

data1_df <- read.csv("trip_data_1.csv", header=TRUE)
data2_df <- read.csv("trip_data_2.csv", header=TRUE)
data3_df <- read.csv("trip_data_3.csv", header=TRUE)
data4_df <- read.csv("trip_data_4.csv", header=TRUE)
data5_df <- read.csv("trip_data_5.csv", header=TRUE)
data6_df <- read.csv("trip_data_6.csv", header=TRUE)

#Speed #Speed #Speed #Speed #Speed #Speed #Speed #Speed 

#Jan,2013
data1_df %>%
  group_by(hour(pickup_datetime)) %>%
  summarise(speed = (sum(trip_distance))/(sum(trip_time_in_secs/3600))) %>%
  top_n(30, speed) %>% 
  write.csv("speed_1.csv", na="")

#Feb,2013
data2_df %>%
  group_by(hour(pickup_datetime)) %>%
  summarise(speed = (sum(trip_distance))/(sum(trip_time_in_secs/3600))) %>%
  top_n(30, speed) %>% 
  write.csv("speed_2.csv", na="")

#March,2013
data3_df %>%
  group_by(hour(pickup_datetime)) %>%
  summarise(speed = (sum(trip_distance))/(sum(trip_time_in_secs/3600))) %>%
  top_n(30, speed) %>% 
  write.csv("speed_3.csv", na="")

#April,2013
data4_df %>%
  group_by(hour(pickup_datetime)) %>%
  summarise(speed = (sum(trip_distance))/(sum(trip_time_in_secs/3600))) %>%
  top_n(30, speed) %>% 
  write.csv("speed_4.csv", na="")

#May,2013
data5_df %>%
  group_by(hour(pickup_datetime)) %>%
  summarise(speed = (sum(trip_distance))/(sum(trip_time_in_secs/3600))) %>%
  top_n(30, speed) %>% 
  write.csv("speed_5.csv", na="")

#June,2013
data6_df %>%
  group_by(hour(pickup_datetime)) %>%
  summarise(speed = (sum(trip_distance))/(sum(trip_time_in_secs/3600))) %>%
  top_n(30, speed) %>% 
  write.csv("speed_6.csv", na="")

####### Combine speed_1 to speed_6 files ########
speed1 = read.csv("speed_1.csv")
speed2 = read.csv("speed_2.csv")
speed3 = read.csv("speed_3.csv")
speed4 = read.csv("speed_4.csv")
speed5 = read.csv("speed_5.csv")
speed6 = read.csv("speed_6.csv")

speed = cbind(speed1$speed, speed2$speed, speed3$speed, speed4$speed, speed5$speed, speed6$speed)
mean_speed = print(rowMeans(speed))
table = cbind("Hour" = c(0:23), "Speed (miles per hour)" = mean_speed)
write.csv(table, file="speedTable.csv")
plot(table, main = "Speed vs Hour")
