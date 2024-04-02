#### Preamble ####
# Purpose: testing data for Premier League
# Author: Jerry Lu (Yen-Chia Lu)
# Email: Jerry33692@gmail.com
# Date: 1, April 2024

#### Workspace setup ####
library(testthat)

# Test 1: The dataset has the correct number of columns
test_that("Dataset has the correct number of columns", {
  expect_equal(ncol(analysis_PL_data), 16)
})

# Test 2: The dataset contains the specified columns
test_that("Dataset has the specified columns", {
  expected_columns <- c("Home Team", "Away Team", "Full Time Home Team Goals", 
                        "Full Time Away Team Goals", "Full Time Result", "Home Team Shots",
                        "Away Team Shots", "Home Team Shots on Target", "Away Team Shots on Target",
                        "Home Team Corners", "Away Team Corners", "Home Team Yellow Cards",
                        "Away Team Yellow Cards", "Home Team Red Cards", "Away Team Red Cards", "Referee")
  expect_true(all(expected_columns %in% names(analysis_PL_data)))
})

# Test 3: Full Time Result contains only "H", "D", "A"
test_that("Full Time Result is correct", {
  expect_true(all(analysis_PL_data$`Full Time Result` %in% c("H", "D", "A")))
})

# Test 4: Check for non-negative goal values
test_that("Goal values are non-negative", {
  expect_true(all(analysis_PL_data$`Full Time Home Team Goals` >= 0 & analysis_PL_data$`Full Time Away Team Goals` >= 0))
})

# Test 5: Shots on target should not exceed total shots
test_that("Shots on target do not exceed total shots", {
  expect_true(all(analysis_PL_data$`Home Team Shots` >= analysis_PL_data$`Home Team Shots on Target` & analysis_PL_data$`Away Team Shots` >= analysis_PL_data$`Away Team Shots on Target`))
})

# Test 6: No missing values in key columns
test_that("There are no missing values in key columns", {
  key_columns <- c("Home Team", "Away Team", "Full Time Result")
  expect_true(all(complete.cases(analysis_PL_data[key_columns])))
})

# Test 7: Check for realistic range of corners (0-20)
test_that("Corner values are within a realistic range", {
  expect_true(all(analysis_PL_data$`Home Team Corners` >= 0 & analysis_PL_data$`Home Team Corners` <= 20 &
                    analysis_PL_data$`Away Team Corners` >= 0 & analysis_PL_data$`Away Team Corners` <= 20))
})

# Test 8: Yellow and red cards are within plausible limits (0-5 for reds, 0-10 for yellows)
test_that("Card counts are within plausible limits", {
  expect_true(all(analysis_PL_data$`Home Team Yellow Cards` >= 0 & analysis_PL_data$`Home Team Yellow Cards` <= 10 &
                    analysis_PL_data$`Away Team Yellow Cards` >= 0 & analysis_PL_data$`Away Team Yellow Cards` <= 10 &
                    analysis_PL_data$`Home Team Red Cards` >= 0 & analysis_PL_data$`Home Team Red Cards` <= 5 &
                    analysis_PL_data$`Away Team Red Cards` >= 0 & analysis_PL_data$`Away Team Red Cards` <= 5))
})

# Test 9: Referee names are non-empty strings
test_that("Referee column contains valid names", {
  expect_true(all(nchar(as.character(analysis_PL_data$Referee)) > 0))
})

# Test 10: Ensure no duplicate matches based on teams and referee
test_that("There are no duplicate matches", {
  unique_matches <- analysis_PL_data %>%
    distinct(`Home Team`, `Away Team`, Referee)
  expect_equal(nrow(analysis_PL_data), nrow(unique_matches))
})