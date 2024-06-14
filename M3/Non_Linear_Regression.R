# R code for Module 3

# Clear Environment

rm(list = ls())

# Load packages (if not already loaded)

if (!require(Ecdat)) install.packages("Ecdat")
if (!require(ISLR)) install.packages("ISLR")
if (!require(GGally)) install.packages("GGally")
if (!require(car)) install.packages("car")
if (!require(tidyverse)) install.packages("tidyverse")

# Activate Libraries

library(Ecdat) 
library(ISLR)
library(GGally)
library(car)
library(tidyverse)

# Make sure in correct working directory if using R script. (RMD files should revert to whatever directory it is saved)
# If not in correct working directory you can use the file viewer to the lower right to navigate to the folder, click more, click set as working directory.

getwd()

#### Example Section 1 ####

# read top 100 cities in the us

CitPop <- read_csv("Cities.csv", col_types = list(
  Rank = col_integer(),
  CityState = col_character(),
  Population2010 = col_integer(),
  Population2012 = col_integer(),
  Growth = col_integer()))

# Check the structure

str(CitPop)
View(head(CitPop,10))

# An Example of a Nonlinear Relationship US city Population and Rank

ggplot(CitPop, aes(x=Rank, y=Population2012)) + geom_point() + labs(x = "Rank") + labs(y = "Population 2012") +
  scale_colour_hue(l=50) + # Use a slightly darker palette than normal
  geom_smooth(method=lm, size = 1.5) +   # Add linear regression lines  
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title=element_text(size=20,face="bold")) +
  scale_y_continuous(breaks=seq(0,10000000,500000))

# theme_minimal()

# To save a visual.  After running the script for it run the following:

ggsave("myVisual2.png", width = 25)

#### End Section 1 ####

#### Example Section 2 ####

# We use the Housing dataset in the Ecdata Package in R.  You can take a look at it using this method

?Housing

# Now a look at the summary of the dataframe

summary(Housing)

# Create a dataframe h1 which has the four columns from Housing - price, lotsize, bedrooms, and bathrms 

h1 <- data.frame(Housing$price, Housing$lotsize, Housing$bedrooms, Housing$bathrms)

View(head(h1,15))

#create natural log of the variables price and lotsize and also the square of lotsize and add these new variables to h1.  You may be wondering if you can do this inside the model when the time comes.  You can, but coding wise I personally find creating the variables a better practice.

h1 <- h1 %>%
  mutate(Ln_price = log(Housing.price)) %>%
  mutate(Ln_lotsize = log(Housing.lotsize)) %>%
  mutate(lot_square = Housing.lotsize*Housing.lotsize) 

View(head(h1,15)) 

## Let's look at the different linear-log models

## Linear - Linear
# Model A:  price = b0 + b1*lotsize

a.lm <- lm(formula = price ~ lotsize , data = Housing)
summary(a.lm)

# Model A: Scatter Plot with regression line 

ggplot(Housing, aes(x=lotsize, y=price)) + geom_point() + labs(x = "lotsize") + labs(y = "price") +
  scale_colour_hue(l=50) + # Use a slightly darker palette than normal
  geom_smooth(method=lm, size = 1.5) +   # Add linear regression lines  
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title=element_text(size=20,face="bold"))

# Model A:  Diagnostics Plots

par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(a.lm) # Plot # plots the four diagnostics plots


## Linear - Log
# Model B:  price = b0 + b1*log(lotsize)

b.lm <- lm(formula = Housing.price ~ Ln_lotsize , data = h1)
summary(b.lm)

# Model B: Scatter Plot with regression line 

ggplot(h1, aes(x=Ln_lotsize, y=Housing.price)) + geom_point() + labs(x = "Ln(lotsize)") + labs(y = "price") +
  scale_colour_hue(l=50) + # Use a slightly darker palette than normal
  geom_smooth(method=lm,   # Add linear regression lines
              se=TRUE,    # Don't add shaded confidence region
              fullrange=TRUE) + # Extend regression lines
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title=element_text(size=20,face="bold"))

# Model B:  Diagnostics Plots

par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(b.lm)

## Log - Linear
# Model C:  log(price) = b0 + b1*lotsize  Log-Linear Model

c.lm <- lm(formula = Ln_price ~ Housing.lotsize , data = h1)
summary(c.lm)

# Model C: Scatter Plot with regression line 

ggplot(h1, aes(x=Housing.lotsize, y=Ln_price)) + geom_point() + geom_point() + labs(x = "lotsize") + labs(y = "Ln(price)") +
  scale_colour_hue(l=50) + # Use a slightly darker palette than normal
  geom_smooth(method=lm,   # Add linear regression lines
              se=TRUE,    # Don't add shaded confidence region
              fullrange=TRUE) + # Extend regression lines
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title=element_text(size=20,face="bold"))

# Model C:  Diagnostics Plots

par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(c.lm)

## Log - Log
# Model D:  log(price) = b0 + b1*log(lotsize)

d.lm <- lm(formula = Ln_price ~ Ln_lotsize , data = h1)
summary(d.lm)

# Model D: Scatter Plot with regression line 

ggplot(h1, aes(x=Ln_lotsize, y=Ln_price)) + geom_point() +
  scale_colour_hue(l=50) + # Use a slightly darker palette than normal
  geom_smooth(method=lm,   # Add linear regression lines
              se=TRUE,    # Don't add shaded confidence region
              fullrange=TRUE) + # Extend regression lines
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title=element_text(size=20,face="bold"))

# Model D:  Diagnostics Plots

par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(d.lm) # Plot # plots the four diagnostics plots

## Polynomial (Quadratic)
# Model E:  price = b0 + b1*lotsize + b2*lotsize2 

e.lm <- lm(formula = Housing.price ~ Housing.lotsize + lot_square, data = h1)
summary(e.lm)

# Model E: 

ggplot(h1, aes(x=lot_square, y=Housing.price)) + geom_point() +
  scale_colour_hue(l=50) + # Use a slightly darker palette than normal
  geom_smooth(method=lm,   # Add linear regression lines
              se=TRUE,    # Don't add shaded confidence region
              fullrange=TRUE) + # Extend regression lines
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title=element_text(size=20,face="bold"))

# Model E:  Diagnostics Plots

par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(e.lm) # Plot # plots the four diagnostics plots

#### End Section 2 ####

#### References ####
# Tukey Transformations
# https://onlinestatbook.com/2/transformations/tukey.html

