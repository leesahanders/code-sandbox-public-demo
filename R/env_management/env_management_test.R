## Testing over rides

library(usethis)

usethis::edir_r_environ()

options('repos')

#Override only applies during restore

Sys.getenv("RENV_CONFIG_REPOS_OVERRIDE")
Sys.setenv("RENV_CONFIG_REPOS_OVERRIDE" = "https://colorado.posit.co/rspm/all/latest")
Sys.setenv("RENV_CONFIG_REPOS_OVERRIDE" = c("COLORADO" = "https://colorado.posit.co/rspm/all/latest")) # can we even do this? not in renviron, but could in r profile

renv::restore("DBI")
renv::restore(repos = c("COLORADO" = "https://colorado.posit.co/rspm/all/latest"), rebuild=TRUE)

# Update package records in a lockfile: https://rstudio.github.io/renv/reference/record.html?q=repository#ref-examples 

# Manually update lock file 
renv::restore(rebuild=TRUE) 

# To update the lock file to the new repository: 
renv::snapshot(repos = c("COLORADO" = "https://colorado.posit.co/rspm/all/latest")) 



# https://rstudio.github.io/renv/reference/snapshot.html?q=repos%20=%20getOption(#ref-usage
repos = getOption("repos")
