#### Preamble ####
# Purpose: Simulates Data
# Author: Ziyuan Shen
# Date: 22 September 2024 
# Contact: ziyuan.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Define the date range (from mid-May to mid-September as per the dataset)
start_date <- as.Date("2020-05-15") 
end_date <- as.Date("2020-09-15")

# Create a sequence of dates between start_date and end_date
date_sequence <- seq.Date(start_date, end_date, by = "day")

# Simulate random dates for 5 beaches (simulate for 500 observations in total)
n <- 10  # Number of observations per beach
beaches <- c("Beach1", "Beach2", "Beach3", "Beach4", "Beach5")
random_dates <- sample(date_sequence, size = n * length(beaches), replace = TRUE)

# Simulate data for the other variables
simulated_data <- tibble(
  id = 1:(n * length(beaches)),  # Create a unique ID for each observation
  dataCollectionDate = random_dates,
  beachName = rep(beaches, each = n),
  windSpeed = round(runif(n * length(beaches), min = 0, max = 50), 1),  # wind speed in km/h
  windDirection = sample(c("East", "North-East", "North", "North-West", "West", "South-West", "South", "South-East"), 
                         size = n * length(beaches), replace = TRUE),
  airTemp = round(runif(n * length(beaches), min = 10, max = 35), 1),  # air temperature in Celsius
  rain = sample(c("Yes", "No"), size = n * length(beaches), replace = TRUE, prob = c(0.3, 0.7)),
  rainAmount = ifelse(rain == "Yes", round(runif(n * length(beaches), min = 0.1, max = 30), 1), 0),  # rain in mm
  waterTemp = round(runif(n * length(beaches), min = 5, max = 25), 1),  # water temperature in Celsius
  waterFowl = sample(0:50, size = n * length(beaches), replace = TRUE),  # number of waterfowl observed
  waveAction = sample(c("none", "low", "moderate", "high"), size = n * length(beaches), replace = TRUE),
  waterClarity = sample(c("Clear", "Moderate", "Cloudy", "Very Cloudy"), size = n * length(beaches), replace = TRUE),
  turbidity = round(runif(n * length(beaches), min = 0, max = 100), 1)  # turbidity in NTUs
)

#### Write_csv
write_csv(simulated_data, file = "data/raw_data/simulated.csv")





