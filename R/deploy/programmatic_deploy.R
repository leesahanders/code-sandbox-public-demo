# Programmatic deploy example 

# Refer to: https://docs.rstudio.com/connect/admin/appendix/deployment-guide/ 
# and also: https://rstudiopbc.atlassian.net/wiki/spaces/SUP/pages/36212280/Troubleshooting+deployments+with+rsconnect 

# To programmatically publish content to RStudio Connect, use the functions deployDoc, deployApp, deployAPI, and deploySite from the rsconnect package. Each of these functions will require a user account and a connected server. To setup an account on a server use addConnectServer and connectUser. To view currently configured accounts use accounts. For more details visit the rsconnect reference pages.
# You can also do this through the IDE. This documentation is great: https://docs.rstudio.com/how-to-guides/rsc/publish-rmd/ 

library(rsconnect)

rsconnect::writeManifest()

rsconnect::deployApp(
  appDir = getwd(),
  #appFiles = NULL,
  account = "lisa.anders",
  server = "colorado.rstudio.com"
)

rsconnect::writeManifest(appDir = "/connectwidgets/")

