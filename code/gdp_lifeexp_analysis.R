library(tidyverse)

gapminder_1997 <- read_csv("gapminder_1997.csv")
str(gapminder_1997)

?read_csv
sum(5,6)
5+6
?sum()
round(3.14159, digits = 2)

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title = "Does wealth beget health?") +
  aes(color = continent) +
  labs(color = "Continent") +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)")

ggplot(gapminder_1997, aes(gdpPercap, lifeExp, color=continent, size = pop/1000000))+
  geom_point() +
  labs(x = "GDP Per Capita", y = "Life Expextancy", title = "Wealth and Health", color="Continent", size="Population (in millions)") +
  scale_color_brewer(palette = "Set1")

#Load in larger dataset
gapminder_data <- read_csv("gapminder_data.csv")

dim(gapminder_data)

ggplot(data = gapminder_data, aes(year, lifeExp, color = continent, group = country)) +
  geom_line()

#discrete plots
ggplot(data = gapminder_1997, aes(continent, lifeExp)) +
  geom_boxplot() 

ggplot(data = gapminder_1997, aes(continent, lifeExp)) +
  geom_violin(fill = "springgreen") +
  geom_jitter(aes(size = pop), width = 0.1)

#univariate plots

ggplot(gapminder_1997, aes(x = lifeExp)) +
  geom_histogram(bins = 10)


#plot themes

ggplot(gapminder_1997, aes(x = lifeExp)) +
  geom_histogram(bins = 20) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, color = "red"))

awesome_plot <- ggplot(gapminder_1997, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  facet_wrap(vars(continent))

ggsave(awesome_plot,
       file = "awesome_plot.jpg", 
       width = 6, height = 4, units = "in")

#exercise
violin_plot <- ggplot(gapminder_1997, aes(y = lifeExp, x = continent, fill = continent)) +
  geom_violin() + 
  theme_bw()


ggsave(violin_plot, file="awesome_violin_plot.jpg")

