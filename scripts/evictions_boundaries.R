# Join cities and boundaries data

# Author: Callan Hoskins
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters
data_boundaries <- here::here("data/boundaries.rds")
data_evictions <- here::here("data/evictions.rds")

export_file_path <- here::here("data/evictions_boundaries.rds")

join_columns <-
  c(
    "GEOID" = "city_id",
    "name" = "city_name"
  )

#===============================================================================

evictions <- read_rds(data_evictions)
boundaries <- read_rds(data_boundaries)

evictions %>%
  left_join(boundaries, by = join_columns) %>%
  write_rds(export_file_path)
