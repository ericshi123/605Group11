#Arguments: data file
#Library: randomForest
#Output: creates lm_time_pred.txt, and rf_time_pred.jpg


rm(list=ls())

if (require("randomForest")) {
  print("Loaded package randomForest.")
} else {
  print("Failed to load package randomForest.")
}

args = (commandArgs(trailingOnly = TRUE))
# Predict trip time given other variables

# Linear Regression
data <- args[1] 
df <- read.csv(data)
smp_size <- floor(0.75 * nrow(df))
set.seed(123)
train_ind <- sample(seq_len(nrow(df)), size = smp_size)
train <- df[train_ind, ]
test <- df[-train_ind, ]
lm_time <- lm(trip_time_in_secs ~ trip_distance + pickup_longitude + pickup_latitude + dropoff_longitude + dropoff_latitude,data=train)
# Saving output
sink(file=paste(data,"_lm.txt",sep=''))
cat(mean((test$trip_time_in_secs - predict.lm(lm_time, test)) ^ 2))
sink()

## Random Forest Regression
rf <- randomForest(trip_time_in_secs ~ trip_distance + pickup_longitude + pickup_latitude + dropoff_longitude + dropoff_latitude, data=df, mtry = 3, importance = TRUE, na.action = na.omit)

saveRDS(rf, file=paste(data,"_rf.rds",sep=''))

#jpeg("rf_time_pred.jpg")
#plot(rf)
#dev.off()
