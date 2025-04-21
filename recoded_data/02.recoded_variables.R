
-------
# Title: "02_recoded_variables" 
-------
-------
# Packages
-------
  
  library(tidyverse)
library(dplyr)
library(readr)

-------
# Load dataset with selected variables
-------
  ESS9 <- read_csv("raw_data/ESS9.csv")
  da_ESS9 <- ESS9 |> 
    select(
      happy, wltdffr
    )
  
-------
# Recode variables and add labels
------
    
# Recode and label "happy"
# create new variable happy_group which contains 3 values: 0–3 = Low; 4–6 = Medium; 7–10 = High
    
da_ESS9 <- da_ESS9 |> 
mutate(happy_group =  case_when(
      happy >= 0 & happy <= 3 ~ "Low",
      happy >= 4 & happy <= 6 ~ "Medium",
      happy >= 7 & happy <= 10 ~ "High",
      TRUE ~ NA_character_  # for missing or invalid values
    ))
  
view(da_ESS9$happy_group)
  
# Recode and label "wltdffr"
  
# create new variable wealth which contains 3 values: 0 =Fair; -4, -3, 3, 4 = Very Unfair; -1, 1, 2, -2 = Somewhat Fair 
  
da_ESS9 <- da_ESS9 |> 
    mutate(wealth = case_when(
      wltdffr == 0 ~ "Fair",
      wltdffr %in% c(-4, -3, 3, 4) ~ "Very Unfair",
      wltdffr %in% c(-2, -1, 1, 2) ~ "Somewhat Fair",
      TRUE ~ NA_character_
    )) 
  
  