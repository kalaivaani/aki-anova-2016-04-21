################################### Project: nested ANOVA analysis for Aki's miRNA experiments #####################################
# date: 2016-04-21
# written by: Kala Sundararajan
# biomarker data from Akihiro Nakamura

########################### do.R: load, clean/merge, and analyse data ###############################
rm(list = ls())
library(plyr)
library(lubridate)

#### load functions ####
source("Y:/LEAP/23. LEAP OA Data Quality/scripts/functions.R")

#### load.R: load data ####
source("scripts/load.R")

#### analysis.R: nested ANOVA analysis ####
source("scripts/analysis.R")