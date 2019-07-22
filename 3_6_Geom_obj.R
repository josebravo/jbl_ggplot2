#HW tutorial/book
#3.6 Geometric objects
#https://r4ds.had.co.nz/data-visualisation.html
#https://r4ds.had.co.nz/data-visualisation.html#geometric-objects

#3 Data visualisation
rm(list=ls())
ls()
getwd()
setwd("")
library(tidyverse)
library(ggplot2)
library(plotly)
ggplot2::mpg

# Do cars with big engines use more fuel than cars with small engines?
# What does the relationship between engine size and fuel efficiency look like?  
# Is it positive? Negative? Linear? Nonlinear? 
# displ = car's engine size (litres)
# hwy = car's fuel efficiency (on the highway: miles per gallon)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# The plot shows a negative relationship between engine size (displ) and fuel efficiency (hwy). 
# In other words, cars with big engines use more fuel. Does this confirm or refute your hypothesis 
# about fuel efficiency and engine size?

?mpg
summary(mpg)
# drv: f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# cyl = number of cylinders
# class = type of car

# categorica + continuous with geom_point(): existent values within each categories
ggplot(data = mpg) +
  geom_point(aes(x=cyl, y=hwy), alpha)


# two categorical variables with geom_point() is useful only to visualise possible combinations
ggplot(data = mpg) +
  geom_point(aes(x=class, y=drv))

# Warning message: Using alpha for a discrete variable is not advised.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class, alpha = class, size = cyl))

# what does alpha mean? Number of observations?
a <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), alpha = 0.2)

ggplotly(a)

# faceting and coloring by the same categorical variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = factor(cyl))) + 
  facet_wrap(~cyl)

# facet_wrap(~ cat variable nrow = n)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# facet_grid(cat variable A for rows ~ cat variable B for columns)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = factor(cyl))) + 
  facet_grid(drv ~ cyl)

# This two plots describe the same data by using different geoms 
# geom_point() and geom_smooth()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# sampe plot with different geom
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Efficiency by drv
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy,color = drv ))

?mpg


# two geoms for the same data? DUPLICATION!?
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy,color = drv)) + 
  geom_point(mapping = aes(x = displ, y = hwy,color = drv))

# ditto but with all common aesthetics to the ggplot() mapping ...
ggplot(data = mpg, mapping = aes(x = displ, y = hwy , color = drv)) + 
  geom_smooth(aes(linetype = drv)) + 
  geom_point()

# with legends
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv, color=drv))
# without legends
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv, color=drv), show.legend = FALSE)

# 2 geoms 1 dataset
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color=class)) + 
  geom_smooth()

# se = standard error
# with se
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth()
# without se
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# 2 geoms & 2 datasets
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# lm = linear model
# Add the regression line
# http://www.sthda.com/english/wiki/print.php?id=188 
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()+
  geom_smooth(method=lm)


