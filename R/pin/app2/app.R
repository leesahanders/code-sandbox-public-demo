# This script reads the pin we just wrote back into the IDE and displays it in a shiny app

library(dplyr)
library(tidyverse)
library(stringr)
library(readr)
library(pins)
library(rsconnect)
library(usethis)

#Check our environment variables
# usethis::edit_r_environ()

library(rsconnect)

board <- board_connect(auth = "envvar")

cars_data_back <-board %>% pin_read("lisa.anders/cars_dataset")

# DataTables example
shinyApp(
  ui = fluidPage(
    h3("Session URL components: Available from interactive apps only (Shiny)"),
    verbatimTextOutput("urlText"),
    fluidRow(
      column(12,
             dataTableOutput('table')
      )
    )
  ),
  server = function(input, output, session) {
    # Return the components of the URL in a string:
    output$urlText <- renderText({
      paste(sep = "",
            "protocol: ", session$clientData$url_protocol, "\n",
            "hostname: ", session$clientData$url_hostname, "\n",
            "pathname: ", session$clientData$url_pathname, "\n",
            #"port: ",     session$clientData$url_port,     "\n",
            #"search: ",   session$clientData$url_search,   "\n",
            "sys info user: ",   Sys.info()[["user"]],   "\n",
            "session clientdata user: ",   session$clientData$user,   "\n",
            "session user: ",   session$user,   "\n"
      )
    })
    
    output$table <- renderDataTable(cars_data_back)
  }
)