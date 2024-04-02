#### Preamble ####
# Purpose: simulate data for premier league
# Author: Jerry Lu (Yen-Chia Lu)
# Email: Jerry33692@gmail.com
# Date: 1, April 2024

#### Workspace setup ####
library(tidyverse)
library(dplyr)
#### Simulate ####
set.seed(853) # Ensure reproducibility

num_matches <- 200 # Number of matches to simulate
avg_home_goals <- 1.5 # Average number of goals scored by home teams
avg_away_goals <- 1.2 # Average number of goals scored by away teams
avg_possession <- 50 # Average possession percentage
possession_sd <- 5 # Standard deviation for possession
avg_home_corners <- 5 # Average number of corners for home teams
avg_away_corners <- 4 # Average number of corners for away teams

sim_football_data <- tibble(
  HomeGoals = rpois(n = num_matches, lambda = avg_home_goals),
  AwayGoals = rpois(n = num_matches, lambda = avg_away_goals),
  HomePossession = rnorm(n = num_matches, mean = avg_possession, sd = possession_sd),
  AwayPossession = 100 - HomePossession, # Assuming total possession is 100%
  HomeCorners = rpois(n = num_matches, lambda = avg_home_corners),
  AwayCorners = rpois(n = num_matches, lambda = avg_away_corners)
) |>
  mutate(
    HomePossession = round(HomePossession, 1),
    AwayPossession = round(AwayPossession, 1)
  )

# Display the first few rows of the simulated data
head(sim_football_data)