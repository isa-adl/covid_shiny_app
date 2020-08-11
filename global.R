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

#Sort by type: confirmed, death, recovered
type_bycountry = coronavirus %>% 
  filter(date == max(date)) %>%
  select(country, type, cases) %>%
  group_by(country, type) %>%
  summarise(total_cases = sum(cases)) %>%
  pivot_wider(names_from = type,
              values_from = total_cases) %>%
  arrange(-confirmed)

# Group by country, summarize to calculate total cases, find the top 7
bycountry_date <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country, date) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

bycountry <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)



top_countries_cases_bydate = bycountry_date %>% 
  group_by(country) %>%
  top_n(7, total_cases)

top_countries_by_total_cases <- bycountry_date %>%
  group_by(country) %>%
  summarize(total_cases = sum(total_cases)) %>%
  top_n(7, total_cases)

target = c("Brazil", "India", "Mexico", "Peru", "Russia", "South Africa", "US")
top_7countries = bycountry_date %>% 
  filter(country %in% target)


# Read datasets
owid_covid <- read_csv("./data/owid-covid-data.csv")

owid_bycountry = owid_covid %>% 
  group_by(location) %>%
  summarize(total_cases = sum(total_cases)) 


