# This script reads the pin we just wrote back into the IDE

library(dplyr)
library(tidyverse)
library(stringr)
library(readr)
library(pins)
library(rsconnect)
library(usethis)

#Check our environment variables
# usethis::edit_r_environ()

board <- board_connect(auth = "envvar")

cars_data_back <-board %>% pin_read("lisa.anders/cars_dataset")


