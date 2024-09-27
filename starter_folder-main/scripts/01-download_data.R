#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author:  Ziyuan Shen
# Date: 22 September 2024 
# Contact: ziyuan.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: NONE
# Any other information needed? NONE


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


# get package
package <- show_package("toronto-beaches-observations")
package

# get all resources for this package
resources <- list_package_resources("toronto-beaches-observations")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv") 

