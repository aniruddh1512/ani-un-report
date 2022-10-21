library(tidyverse)

gapminder_dta <- read_csv("data/gapminder_data.csv")



# Summarizing our Data

summarize(gapminder_data, averagelifeExp=mean(lifeExp))
gapminder_data %>% summarize(averagelifeExp=mean(lifeExp))

gapminder_data_summarized <- gapminder_data %>%
  summarize(average(lifeExp = mean(lifeExp))
            
            
            
# FIltering our data

gapminder_data %>%
  filter(year == 2007) %>%
  summarize(average = mean(lifeExp))


#Exercise: find the earliest year in your data

gapminder_data %>% summarize(first_year = min(year))

# what is the mean gdp per capita for that year

gapminder_data %>%
  filter(year == 1952) %>%
  summarize(average = mean(gdpPercap))


#Grouping data

gapminder_data %>%
  group_by(year) %>%
  summarize(average = mean(lifeExp))

gapminder_data %>%
  group_by(continent) %>%
  summarize(average = mean(lifeExp), min(lifeExp))


#Adding new columns using mutate

gapminder_data %>%
  mutate(gdp = pop*gdpPercap,
          popInmillions = pop/1000000)

gapminder_data %>%
  select(pop, year)

gapminder_data %>%
  select(gdpPercap, everything())

#moving between long and wide data using

select(country, continent, year, lifeExp) %>%
  pivot_wider(names_from = year, values_from = lifeExp)

#Dataset for analysis

gapminder_data <- read_csv("data/gapminder_data.csv") %>%
  filter(year == 2007 & continent == "Americas") %>%
  select(-year, -continent)