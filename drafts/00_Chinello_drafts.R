library(tidyverse)
library(dplyr)

ESS11 <- readr::read_csv("raw_data/ESS11.csv")

view(ESS11)

#Recode di ESS11 tenendo solo le variabili inerenti a health e income.
#Manca una vera e propria variabile income ma possiamo cercare quali sono i paesi più poveri
#e quali i più ricchi e fare un plot in base a quelli

#Questa è solo una prima prova

#Come faccio il recode del gender? 1 = Men; 2 = Women


ESS11_recoded <- ESS11 |> 
  select(c("cntry", "agea", "gndr", "health", "ctrlife", "medtrnp", "hltprca", "fnsdfml" )) |> 
  rename (country = cntry,
         age = agea,
         gender = gndr,
         control_over_life = ctrlife,
         no_med_treatment = medtrnp,
         cancer_12_months = hltprca,
         poor_when_kids = fnsdfml)

view(ESS11_recoded)
