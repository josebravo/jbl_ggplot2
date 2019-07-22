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

# border's colour
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

# bar's colours
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# fill = categorical variable --> stacked bar chart
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

