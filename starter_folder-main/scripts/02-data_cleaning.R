#### Preamble ####
# Purpose: Cleans the Toronto beaches data into an analysis dataset
# Author: Ziyuan Shen
# Date: 22 September 2024 
# Contact: ziyuan.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE
# Any other information needed? NONE


####Step 1: Workspace setup ####
library(tidyverse)

raw_data <- read_csv("data/raw_data/raw_data.csv")

#### Step 2: Select the eight key variables ####
key_variables <- raw_data %>%
  select(dataCollectionDate, beachName, windSpeed, airTemp, rain, waterTemp, waterFowl, turbidity)

#### Step 3: Check for missing values ####
any(is.na(key_variables))

# Optionally, you can view how many missing values exist in each column
colSums(is.na(key_variables))

#### Step 4: Remove rows with missing values ####
cleaned_data <- na.omit(key_variables)

# Step 5: Remove outliers with reasonable limits
cleaned_data <- data %>%
  # Remove rows where key columns have NA values
  filter(!is.na(waterTemp) & !is.na(windSpeed) & !is.na(airTemp) & 
           !is.na(turbidity) & !is.na(rainAmount) & !is.na(waterFowl)) %>%
  # Remove rows with non-finite values (e.g., Inf, -Inf) for key numeric columns
  filter(is.finite(waterTemp) & is.finite(windSpeed) & is.finite(airTemp)) %>%
  # Filter water temperature (waterTemp) to be between 0°C and 40°C
  filter(waterTemp >= 0 & waterTemp <= 40) %>%
  # Filter wind speed (windSpeed) to be between 0 and 100 km/h
  filter(windSpeed >= 0 & windSpeed <= 100) %>%
  # Filter air temperature (airTemp) to be between -10°C and 40°C
  filter(airTemp >= -10 & airTemp <= 40)

#### Step 6: Save cleaned data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")





