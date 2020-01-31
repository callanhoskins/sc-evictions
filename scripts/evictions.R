# Reads in city evictions data from South Carolina

# Author: Callan Hoskins
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(here)

# Parameters

data_path <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"

export_file_path <- here::here("data/evictions.rds")
download_file_path <- here::here("data-raw/evictions.csv")

selected_col_names <- c("GEOID", "year", "name", "evictions")
selected_col_types <-
  cols(
    "year" = col_integer(),
    "GEOID" = col_integer(),
    "name" = col_character(),
    "evictions" = col_double()
  )

# here is a test
#===============================================================================
download.file(data_path, destfile = download_file_path)

vroom::vroom(
  data_path,
  col_types = selected_col_types
) %>%
  select(!!! selected_col_names) %>%
  filter(year == 2016L) %>%
  write_rds(path = export_file_path)
