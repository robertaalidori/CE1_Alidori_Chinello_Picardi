# Title: "02_variable_selected" 

# Packages

library(tidyverse)
library(dplyr)

# Load dataset 

ESS9 <- read_csv("raw_data/ESS9.csv")

# Select variables for data analysis 

# Selected variables: level of happiness and wealth fair/unfair (we need to decide which one of the two to keep)

ESS9_recoded <- ESS9 |> 
    select(
      happy, wltdffr
    ) |> 
    rename(
      wealth_diff = wltdffr
    )
  
# Check the structure of the dataset

view(ESS9_recoded)

write.csv(ESS9_recoded, "recoded_data/ESS9_recoded.csv", row.names = FALSE)
