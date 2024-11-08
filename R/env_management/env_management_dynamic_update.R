library(renv)
library(tidyverse)
library(rsconnect)
library(rstudioapi)

## List all folders in directory 
folders <- list.dirs(path = ".", full.names = TRUE, recursive = TRUE) 

## List all files
files <- list.files(path = ".", full.names = TRUE, recursive = TRUE) 

## List all folders with a renv.lock file 
files_renv <- grepl("*renv.lock", c(files))

## List all folders with a manifest.json file
files_manifest <- grepl("*manifest.json", c(files))

## List all folders with a .Rproj project file
files_rproj <- grepl("*.Rproj", c(files))
  
## Turn it into a table
files_tbl <- data.frame(files=c(files), renv=c(files_renv), manifest = c(files_manifest), rproj = c(files_rproj)) %>%
  mutate(folder = sub("\\/[^/]*$", "", files)) %>% 
  select(folder, files, renv, manifest, rproj) %>% 
  mutate(renv2=ifelse(renv, files, "")) %>%
  mutate(manifest2=ifelse(manifest, files, "")) %>%
  mutate(rproj2=ifelse(rproj, files, "")) 
  #mutate(folder = sub("\\.[^.]*$", "", files)) # This removes everything after the last .

proj_tbl <- files_tbl %>% 
  select(-files) %>% 
  group_by(folder) %>%
  summarize(renv1 = max(renv), manifest1 = max(manifest), rproj1 = max(rproj),
            renv2 = max(renv2), manifest2 = max(manifest2), rproj2 = max(rproj2)) %>%
  ungroup() %>% 
  mutate(good = renv1 + manifest1 +rproj1) %>%
  filter(good == 3)

# https://stackoverflow.com/questions/52471073/remove-or-replace-everything-after-a-specified-character-in-r-strings

i=1
folder=proj_tbl$folder[i]
file_renv=proj_tbl$renv2[i]
file_manifest=proj_tbl$manifest2[i]
file_rproj=proj_tbl$rproj2[i]
path = paste0(getwd(),"/",folder)

print(paste0("Starting on ", folder))

system(paste0("R -e 'renv::record(",'"',"renv@1.0.11",'"); renv::restore(packages = "renv"); renv::install(); renv::snapshot(); rsconnect::writeManifest()'), wait = TRUE, timeout = 0)

#R -e 'renv::record("renv@1.0.11"); renv::restore(packages = "renv"); renv::install(); renv::snapshot(); rsconnect::writeManifest()'

  
## Update one project from terminal 
#R -e 'renv::install(); renv::snapshot()'
#From Kevin: Calling renv::install() without arguments will install the latest-available version of any project dependencies.

#- Use `renv::record("renv@1.0.7")` to record renv 1.0.7 in the lockfile.
#- Use `renv::restore(packages = "renv")` to install renv 1.0.11 into the project library.


# This will use the default R version, which on 11/8/2024 was 4.4.1

#R -e 'renv::record("renv@1.0.11"); renv::restore(packages = "renv"); renv::install(); renv::snapshot(); rsconnect::writeManifest()'

# https://stackoverflow.com/questions/37724057/open-r-project-in-rstudio-programmatically
#openProject() in package rstudioapi
# https://pkgs.rstudio.com/rstudioapi/articles/projects.html
#openProject(path)
# This doesn't work - since it interrupts the code from running
