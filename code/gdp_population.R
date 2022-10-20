#Intro--------------------------------------------------------------------------

library(tidyverse)
gapminder_1997<-read_csv("gapminder_1997.csv")
round(3.1415, digits=2)
round(3.1415, 2)
Sys.Date() # outputs current date
getwd()

#Plotting ----------------------------------------------------------------------

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)")

#Plotting in a more consized way -----------------------------------------------

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  labs(x = "year", 
       y = "Life Expectancy", 
       title = "Do people in wealthy countries live longer?", 
       size = "Population (in millions)")

# Plotting for data exploration ------------------------------------------------

str(gapminder_data)
gapminder_data <- read_csv("gapminder_data.csv")
ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, color = continent, group = country) +
  geom_violin() +
  scale_color_brewer(palette = "Set1") +
  labs(x = "Year", 
       y = "Life Expectancy", 
       size = "Population")


ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill = continent)) +
  geom_jitter(alpha = 0.7)
  labs(x = "Continent", 
       y = "Life Expectancy", 
       size = "Population")


  ggplot(data = gapminder_1997) +
    aes(x = lifeExp) +
    geom_histogram(bins = 20)

  
#ggplot2 themes ----------------------------------------------------------------
  
ggplot(data = gapminder_1997) +
    aes(x = lifeExp) +
    geom_histogram() +
    theme(axis.text.x = element_text(angle = 45))
  
  
#Facet -------------------------------------------------------------------------
  
  ggplot(data = gapminder_1997) +
    aes(x = gdpPercap, y = lifeExp) +
    geom_point() +
    facet_wrap(vars(continent))
  
  ggplot(data = gapminder_1997) +
    aes(x = gdpPercap, y = lifeExp) +
    geom_point() +
    facet_grid(rows = vars(continent))

ggsave("awesome_plot.jpg",
       width = 6,
       height = 4)


violin_plot <- ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill = continent))
violin_plot + theme_bw()


violin_plot <- violin_plot + theme_bw()

ggsave(plot = violin_plot,
       filename = "awesome_violin_plot.jpg",
       width = 6,
       height = 4)


#Animated Plot -----------------------------------------------------------------


install.packages(c("gganimate", "gifski"))
library(gganimate)
library(gifski)



ggplot(data = gapminder_data) +
  aes(x = log(gdpPercap), y = lifeExp, size = pop, color = continent) +
  geom_point()



staticHansPlot <- ggplot(data = gapminder_data) +
  aes(x = log(gdpPercap), y = lifeExp, size = pop, color = continent) +
  geom_point(alpha = 0.5) +
  scale_color_brewer(palette = "Set1") +
  labs(x = "GDP Per Capita", y = "Life Expectancy", color = "Continent", 
       size = "Population (in millions)") +
  theme_classic()

staticHansPlot


animatedHansPlot <- staticHansPlot +
  transition_states(year, transition_length = 1, state_length = 1) +
  ggtitle("{closest_state}")

animatedHansPlot

anim_save("hansAnimatedPlot.gif",
          plot = animatedHansPlot,
          renderer = gifski_renderer())