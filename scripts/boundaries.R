# Read in city boundaries data

# Author: Callan Hoskins
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters
data_path <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"

export_file_path <- here::here("data/boundaries.rds")
download_file_path <- here::here("data-raw/boundaries.csv")

selected_cols = c(city_id = "GEOID", city_name = "n", "geometry")

# this is a test
#===============================================================================

download.file(data_path, download_file_path)

sf::read_sf(data_path, as_tibble = TRUE) %>%
  select(!!! selected_cols) %>%
  mutate(city_id = as.integer(city_id)) %>%
  write_rds(export_file_path)


