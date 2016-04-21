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

#### clean.R: clean dataset, subset and derive variables ####
source("scripts/clean.R")

#### dict.R: create data dictionary for dataset ####
source("scripts/dict.R")

#### clean2.R: change KOOS variable names ####
source("scripts/clean2.R")