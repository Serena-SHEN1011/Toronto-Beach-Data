#### Preamble ####
# Purpose: Sanity check of the data
# Author: Ziyuan Shen
# Date: 22 September 2024 
# Contact: ziyuan.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE
# Any other information needed? NONE



#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/raw_data/simulated.csv")

# Test NAs
any(is.na(cleaned_data))

# Remove NAs
cleaned_data <- na.omit(data)


# Test for NAs
all(is.na(cleaned_data)) # If there is missing values in our raw dataset


## function for testing the negative numbers
check_non_negative <- function(data) {
  negative_test <- data %>%
    summarise_all(~ min(.)) %>%
    gather(key = "column", value = "min_value") %>%
    filter(min_value < 0)
  if (nrow(negative_test) == 0) {
    print("All columns have non-negative values.")
  } else {
    print("Negative values found in the following columns:") ##print when there's negative numbers
    print(negative_test)
  }
}

## check raw data
check_non_negative(data)
