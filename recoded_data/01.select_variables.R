-------
# Title: "02_variable_selected" 
-------
-------
# Packages
-------
  
library(tidyverse)
library(dplyr)

-------
# Load dataset 
-------
ESS9 <- read_csv("raw_data/ESS9.csv")

--------
# Select variables for data analysis 
--------

# Selected variables: level of happiness and wealth fair/unfair (we need to decide which one of the two to keep)

da_ESS9 <- ESS9 |> 
    select(
      happy, wltdffr
    )
  
