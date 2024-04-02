#### Preamble ####
# Purpose: creating model for Premier League data
# Author: Jerry Lu (Yen-Chia Lu)
# Email: Jerry33692@gmail.com
# Date: 1, April 2024

#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_PL_data <- read_csv("data/analysis_data/analysis_PL_data.csv")

### Model data ####
PL_model <-
  stan_glm(
    formula = `Full Time Home Team Goals` ~ `Home Team Shots on Target` + `Home Team Corners`,
    data = analysis_PL_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  PL_model,
  file = "models/PL_model.rds"
)