#### Preamble ####
# Purpose: Cleaning data for Premier League
# Author: Jerry Lu (Yen-Chia Lu)
# Email: Jerry33692@gmail.com
# Date: 1, April 2024

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(readr)
library(arrow)
#### Clean data ####
### import raw data ###
raw_PL_data <- read_csv("data/raw_data/raw_PL_data.csv")
### select variables of interest ###
analysis_PL_data <-
  raw_PL_data |>
  select(HomeTeam, AwayTeam, FTHG, FTAG, FTR, Referee, HS, AS, HST, AST, HC, AC, HY, AY, HR, AR) |>
  rename(
    `Home Team` = HomeTeam,
    `Away Team` = AwayTeam,
    `Full Time Home Team Goals` = FTHG,
    `Full Time Away Team Goals` = FTAG,
    `Full Time Result` = FTR,
    `Home Team Shots` = HS, 
    `Away Team Shots` = AS,
    `Home Team Shots on Target` = HST,
    `Away Team Shots on Target` = AST,
    `Home Team Corners` = HC, 
    `Away Team Corners` = AC,
    `Home Team Yellow Cards` = HY,
    `Away Team Yellow Cards` = AY,
    `Home Team Red Cards` = HR,
    `Away Team Red Cards` = AR
  )

#### Save data ####
write_csv(analysis_PL_data, "data/analysis_data/analysis_PL_data.csv")
write_parquet(analysis_PL_data, "data/analysis_data/analysis_PL_data.parquet")
