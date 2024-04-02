#### Preamble ####
# Purpose: Download data for Premier League
# Author: Jerry Lu (Yen-Chia Lu)
# Email: Jerry33692@gmail.com
# Date: 1, April 2024

#### Workspace setup ####
library(tidyverse)


#### Download data ####
# read in the datasets
# Premier League season 2022~2023 raw data
raw_PL_data <- 
  read_csv(
    file = "https://www.football-data.co.uk/mmz4281/2223/E0.csv")


#### Save data ####
write_csv(raw_PL_data, "data/raw_data/raw_PL_data.csv") 