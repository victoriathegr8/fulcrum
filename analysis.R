library(tidyverse)

opdata <-  read.csv("data/op_data_2019.csv")
num_in_state <- opdata %>%
  count(State)

state_rev_total <- opdata %>%
  mutate(Total1 = gsub(",","",TotalRev)) %>%
  mutate(Total = as.numeric(Total1)) %>%
  group_by(State) %>%
  summarise(total = sum(Total))

ngdata <- read.csv("data/naturalgas.csv")
vol_total <- ngdata %>%
  group_by(Area) %>%
  summarise(total = sum(y2019, na.rm = T))

ngcompanies <- read.csv("data/ng_companies.csv")
ng_num_in_state <- ngcompanies %>%
  filter(Status == "Active") %>%
  count(ï..state)
