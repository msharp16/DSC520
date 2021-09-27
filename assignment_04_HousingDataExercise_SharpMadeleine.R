# Assignment: Week 4: Housing Dataset Exercise
# Name: Sharp, Madeleine
# Date: 2021-09-25

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Madeleine's PC/Documents/Madeleine/Documents/Bellevue University Courses/Masters in DS/BU DSC520/dsc520/data")
library(plyr)
library(ggplot2)
theme_set(theme_minimal())
options(scipen = 999)

## Load the `week-6-housing` data set
house_dataset <- read.csv("week-6-housing.csv")
house_dataset

## Use the apply function on a variable in your dataset
apply(house_dataset[, 14, drop = F], 2, mean)

## Use the aggregate function on a variable in your dataset
aggregate(square_feet_total_living ~ bedrooms, house_dataset, mean)

## Use the plyr function on a variable in your dataset
## Split some data, perform a modification to the data, and then bring it back together
house_dataset_mod <- ddply(house_dataset, ~ Sale.Price, summarize, Inflation.Price = Sale.Price * 1.035)
house_dataset_mod

## Running some code to learn more about the data frame I created with plyr
is.data.frame(house_dataset_mod)
class(house_dataset_mod)
str(house_dataset_mod)
nrow(house_dataset_mod)
ncol(house_dataset_mod)

## Check distributions of the data
ggplot(house_dataset_mod, aes(x = Inflation.Price)) + geom_histogram(bins = 113, color = "black", fill = "white") + ggtitle("Housing Prices with 3.5% Inflation") + 
  xlab("Inflated Price ($)") + ylab("Count")

## Create at least 2 new variables.
house_dataset_newer <- ddply(house_dataset, ~ year_built, summarize, Less.Than.Ten = year_built < 10)
house_dataset_newer
house_dataset_high_bldgrd <- ddply(house_dataset, ~ building_grade, summarize, Greater.Than.Seven = building_grade > 7)
house_dataset_high_bldgrd