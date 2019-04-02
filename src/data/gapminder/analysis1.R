#
library(here)
library(tidyverse)

gapminder <- readr::read_csv(here("data/gapminder/raw/gapminder_data.csv"))              

# oldschool
mean(gapminder$gdpPercap[gapminder$continent == "Africa"])
mean(gapminder$gdpPercap[gapminder$continent == "Americas"])

year_country_gdp <- select(gapminder,year, country, gdpPercap)
head(year_country_gdp)

# using pipes
year_country_gdp <- gapminder %>%
  select(year, country, gdpPercap, continent) %>%
  filter(continent == "Europe")
head(year_country_gdp)

#challenge
af_values <- gapminder %>%
  filter(continent == "Africa") %>%
       select(year, country, lifeExp)    
head(af_values)

# next challenge to use group_by

gapminder %>%
  group_by(continent) %>%
  summarize(mean_val = mean(gdpPercap))

gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp = mean(lifeExp), sd_gdpPercap = sd(gdpPercap))
  
# pipe into a plot

ggplot(gapminder, aes(x = year, y = lifeExp, color = continent)) + 
  geom_line() + 
  facet_wrap( ~ country)

gapminder %>% 
  filter(continent == "Africa") %>%
  ggplot ( aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~ country)



  