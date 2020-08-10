library(shiny)
library(shinydashboard)
library(plotly)
library(googleVis)
library(tidyverse)
library(DT)

coronavirus = read.csv("./data/coronavirus.csv")

mobility = read.csv('./data/Global_Mobility_Report.csv')

# # create variable with colnames as choice
choice <- colnames(coronavirus["country"])

# # Load data
# coronavirus <- read.csv("./data/coronavirus.csv", stringsAsFactors = FALSE)
# 
# Modify
data <- coronavirus %>%
  mutate(date = as.Date(date, "%Y-%m-%d")) %>%
  filter(type == "confirmed") %>%
  select(date, country, type, cases)


# By Country DF
bycountry <- coronavirus %>%
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

#cummilative cases worldwide DF
confirmed_cases = coronavirus %>%
  group_by(date) %>%
  filter(type == "confirmed") %>%
  summarize(cases = sum(cases)) %>%
  mutate(cumsum = cumsum(cases))

