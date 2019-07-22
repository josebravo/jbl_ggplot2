#HW tutorial/book
#3.8 Position adjustments
#https://r4ds.had.co.nz/data-visualisation.html
#https://r4ds.had.co.nz/data-visualisation.html#statistical-transformations

#3 Data visualisation
rm(list=ls())
ls()
getwd()
setwd("")
library(tidyverse)
library(ggplot2)
library(plotly)
ggplot2::diamonds
?diamonds

#cut = quality of the cut (Fair, Good, Very Good, Premium, Ideal)

# Bar Charts Adjustments #####################################################

# border's colour
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

# bar's colours
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# (1)
# fill = categorical variable --> stacked bar chart
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#  compared to (1)
# position = "fill" works like stacking, but makes each set of stacked bars the same height. 
# This makes it easier to compare proportions across groups.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

#  compared to (1)
# position = "dodge" places overlapping objects directly beside one another. 
# This makes it easier to compare individual values.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# Scatterplots Adjustments #####################################################

# this plot displays only 126 points, even though there are 234 observations in the dataset
# This problem is known as overplotting

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# position = "jitter" adds a small amount of random noise to each point.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")



