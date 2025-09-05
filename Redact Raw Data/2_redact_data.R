# ---------------------------------------------------------------------------- #
# Redact Data
# Author: Jeremy W. Eberle
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
# Notes ----
# ---------------------------------------------------------------------------- #

# Before running this script, restart R (CTRL+SHIFT+F10 on Windows), set your working 
# directory to the parent folder, and ensure that the raw CSV files obtained from the 
# Private Component of the Managing Anxiety OSF project (https://osf.io/pvd67/) are in 
# "./data/1_raw_full/". This script will import raw data from "./data/1_raw_full/" and 
# output redacted data to "./data/2_redacted/".

# For raw data files that contain potential identifiers, this script redacts the
# relevant data so that subsequent cleaning can be run on a dataset that can be 
# shared and made public. This way all data cleaning steps are transparent and 
# reproducible without compromising potentially identifiable information.

# Rather than changing the structure of the raw data files, this script replaces
# potentially identifiable values with the value "REDACTED_BY_CLEANING_SCRIPT".
# Because it does not change the raw data structure, the script should run on 
# already redacted data files in addition to raw data files without error.

# Scope: This script is based on (a) a partial set of 20 data tables as of 2/2/2019, 
# that were obtained from Sonia Baee on 1/18/2023, and (b) a larger set of 26 data 
# tables as of 2/2/2019, that were obtained from Sonia Baee on 9/3/2020 (who stated 
# on that date that they represent the latest version of the database on the R34 server 
# and that she obtained them from Claudia Calicho-Mamani)

# TODO: Note extent to which extent Set A versus Set B tables are raw data (or more so)





# This script may need to be updated when applied to other data sources, as there may 
# have been changes to the database or newly collected data not accounted for by this script.

# ---------------------------------------------------------------------------- #
# Store working directory, install correct R version, load packages ----
# ---------------------------------------------------------------------------- #

# Store working directory

wd_dir <- getwd()

# Load custom functions

source("./Redact Raw Data/1_define_functions.R")

# Check correct R version, load groundhog package, and specify groundhog_day

groundhog_day <- version_control()

# No packages loaded

# ---------------------------------------------------------------------------- #
# Import raw data ----
# ---------------------------------------------------------------------------- #

# TODO: Reconcile the tables noted in Set A versus Set B above and apply this
# script to Set B tables too





# Import 20 CSV files obtained from the Private Component of the MindTrails 
# Managing Anxiety study's OSF project (https://osf.io/pvd67/) on 9/3/2025. These
# are the tables from Set A noted under Scope above.

# Obtain file names of raw CSV data files

raw_data_dir <- paste0(wd_dir, "/data/1_raw_full/")
filenames <- list.files(raw_data_dir, pattern = "*.csv", full.names = FALSE)

# Import data files into list

dat <- lapply(paste0(raw_data_dir, filenames), read.csv)

# Name data tables in list (keeping the part of the filename that comes before the 
# first underscore that is followed by a digit)

names(dat) <- sub("_\\d.*", "", filenames)

# ---------------------------------------------------------------------------- #
# Specify columns to retain ----
# ---------------------------------------------------------------------------- #

# Regarding date-related columns across tables, Bethany Teachman indicated on 
# 1/13/2021 that MindTrails is not subject to HIPAA regulations, so restrictions 
# on disclosing dates of training, dates of test measures, and birth years for 
# any participants over age 89 do not apply

# ---------------------------------------------------------------------------- #
# Identify character columns ----
# ---------------------------------------------------------------------------- #

# Specify character columns to ignore

ignore_cols <- c("date", "datetime", "session", "corrected_session", "sessionName")

# Create list of table names whose tables contain nonignorable character columns

char_cols_to_check <- lapply(dat, function(df) {
  char_cols <- names(df)[sapply(df, is.character)]
  
  setdiff(char_cols, ignore_cols)
})

char_cols_to_check <- Filter(length, char_cols_to_check)

# Checked all nonignorable character columns identified in following tables. Only
# "ImageryPrime$situation" contains potential identifiable info.

checked_tables <- names(char_cols_to_check)

all(checked_tables == c("AnxietyTriggers", "CIHS", "DD_FU", "Demographics", 
                        "ImageryPrime", "MentalHealthHxTx", "MultiUserExperience", 
                        "ReturnIntention", "TrialDAO"))

# ---------------------------------------------------------------------------- #
# Redact "ImageryPrime$situation" ----
# ---------------------------------------------------------------------------- #

# Redact descriptions of an anxious situation for anxiety imagery prime task

dat$ImageryPrime$situation <- "REDACTED_BY_CLEANING_SCRIPT"

# ---------------------------------------------------------------------------- #
# List tables that have been redacted ----
# ---------------------------------------------------------------------------- #

# List all tables that have been redacted by this script so that the redacted
# files can be named appropriately when outputted

redacted_tbls <- "ImageryPrime"

# ---------------------------------------------------------------------------- #
# Export redacted data ----
# ---------------------------------------------------------------------------- #

# Prepare filenames, preventing "-redacted" from being appended multiple times
# if the script is run on any files that have already been redacted

redacted_filename_stems <- sub("*.csv", "", 
                               filenames[grep(paste0(redacted_tbls, collapse = "-|"), filenames)])

redacted_filename_stems <- gsub("-redacted", "", redacted_filename_stems)

redacted_filenames <- paste0(redacted_filename_stems, "_redacted.csv")

# Write redacted CSV files. Remember not to share corresponding raw data files.

redacted_data_dir <- "./data/2_redacted"
dir.create(redacted_data_dir)

dat_red <- dat[names(dat) %in% redacted_tbls]

for (i in 1:length(dat_red)) {
  write.csv(dat_red[[i]], 
            paste0("./data/2_redacted/", redacted_filenames[i]),
            row.names = FALSE)
}