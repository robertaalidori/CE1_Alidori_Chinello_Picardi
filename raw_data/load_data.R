---
  title: "Multivariate Analysis_Class Exercise 1"
subtitle: "Raw dataset"
---
  
  # Set up workingplace
  ```{r} 
# Set up R (show the R code in the final document, hide warnings and suppress messages from packages) 
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)
```
```{r} 
#Load packages
library(tidyverse)
```
#Load data

```{r} 
#Load ESS11
ess11 <- readr::read_csv("ESS11.csv")

```

