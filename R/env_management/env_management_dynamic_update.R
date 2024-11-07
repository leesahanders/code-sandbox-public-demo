library(renv)
library(tidyverse)

## List all folders in directory 
folders <- list.dirs(path = ".", full.names = TRUE, recursive = TRUE) 

## List all files
files <- list.files(path = ".", full.names = TRUE, recursive = TRUE) 

## List all folders with a renv.lock file 
files_renv <- grepl("*renv.lock", c(files))

## List all folders with a manifest.json file
files_manifest <- grepl("*manifest.json", c(files))
  
## Turn it into a table
files_tbl <- data.frame(files=c(files), renv=c(files_renv), manifest = c(files_manifest))
  

## Make sure renv is updated 

## Update one project from terminal 
#R -e 'renv::install(); renv::snapshot()'
#From Kevin: Calling renv::install() without arguments will install the latest-available version of any project dependencies.




