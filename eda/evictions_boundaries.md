Evictions EDA
================
Callan Hoskins
2020-01-29

  - [Read in cleaned evictions data](#read-in-cleaned-evictions-data)
  - [Find SC city with the most evictions in
    2016](#find-sc-city-with-the-most-evictions-in-2016)

``` r
# Libraries
library(tidyverse)

# Parameters
evictions_path <- here::here("data/evictions_boundaries.rds")

#===============================================================================
```

## Read in cleaned evictions data

``` r
evictions <- read_rds(evictions_path)
evictions %>% 
  glimpse()
```

    ## Observations: 397
    ## Variables: 5
    ## $ GEOID     <int> 4500100, 4500550, 4500775, 4500955, 4501360, 4501450, 45018…
    ## $ year      <int> 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016,…
    ## $ name      <chr> "Abbeville", "Aiken", "Alcolu", "Allendale", "Anderson", "A…
    ## $ evictions <dbl> 57.53, 465.05, 4.28, 24.17, 641.77, 66.57, 0.14, NA, 15.04,…
    ## $ geometry  <list> [-82.39887, -82.39849, -82.39880, -82.39976, -82.40009, -8…

## Find SC city with the most evictions in 2016

``` r
evictions %>% 
  count(GEOID, name, wt = evictions) %>% 
  top_n(n = 1, wt = n)
```

    ## # A tibble: 1 x 3
    ##     GEOID name                 n
    ##     <int> <chr>            <dbl>
    ## 1 4550875 North Charleston 3660.

North Charleston has the most evictions in 2016. Sayanara North
Charleston\!
