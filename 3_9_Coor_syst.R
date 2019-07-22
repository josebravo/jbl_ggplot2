#HW tutorial/book
#3.9 Coordinate systems
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
ggplot2::mpg
?diamonds
?mpg

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
