# CE1_Alidori_Chinello_Picardi

Multivariate project


This repository contains the materials for a multivariate analysis project. 
The aim of the project is to explore the relationship between perceived economic inequality and subjective well-being using data from the European Social Survey (ESS Round 9).

## Folder Structure

"00_documents" - literature
"01_raw_data" - original ESS data (.csv)
"02_recoded_data" - cleaned and recoded datasets used for analysis
"03_analysis" — statistical analysis
"04_plots"" - graphical outputs used in the final report
"05_output" - rdm file with the final report

## Contributions

- Number of commits:
   - Luca Chinello:
   - Giulia Picardi:
   - Roberta Alidori:
- Number of issues opened:
- Number of pull rrequests opened:
- Number of pull requests accepted and merged:
- Number of new branches opened:

## Analysis Summary

We begin with descriptive statistics, followed by a chi-square test to assess the association between perceived inequality and happiness levels.  
The analysis is further supported by mean comparisons and a multivariate linear regression including control variables.

## Dependencies

The code was written in R (version 4.4.1) and uses the following libraries:

```r
library(tidyverse)
library(broom)
library(ggplot2)
