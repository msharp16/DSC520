# Assignment: Week 5:
# Name: Sharp, Madeleine
# Date: 2021-10-1

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Madeleine's PC/Documents/Madeleine/Documents/Bellevue University Courses/Masters in DS/BU DSC520/dsc520/data")

## Load the `week-6-housing` data set
house_dataset <- read.csv("week-6-housing.csv")
house_dataset

## Viewing/getting familiar with the dataset.
class(house_dataset)
str(house_dataset)
nrow(house_dataset)
ncol(house_dataset)
head(house_dataset)

## Using the dplyr package, use the 6 different operations to analyze/transform the data.
library(dplyr)
library(magrittr)
library(purrr)
## GroupBy
house_dataset %>% dplyr::group_by(building_grade)
## Summarize
house_dataset %>% dplyr::summarize(avg_price = mean(Sale.Price), median_price = median(Sale.Price))
## Mutate
house_dataset %>% dplyr::mutate(Sale.Price/square_feet_total_living)
## Filter
house_dataset %>% dplyr::filter(zip5 == "98053")
## Select
house_dataset %>% dplyr::select(Sale.Price, bedrooms, square_feet_total_living)
## Arrange
house_dataset %>% dplyr::arrange(year_built)

## Using the purrr package - perform 2 functions on your dataset.
## You could use zip_n, keep, discard, compact, etc.
## Using the purrr map function to assess which variables in the dataset are numeric.
purrr::map(house_dataset, is.numeric)
## Using the purrr pluck function to pull out all addresses in the dataset.
house_dataset %>% purrr::pluck(7)

## Use the cbind and rbind function on your dataset.
house_bed <- c("0", "1", "2", "3", "4")
house_full_bath <- c("0", "1", "2", "3", "4")
house_half_bath <- c("0", "1", "2", "3", "4")
house_bed_fullbath <- cbind(house_bed, house_full_bath)
house_bed_fullbath
house_bed_halfbath <- cbind(house_bed, house_half_bath)
house_bed_halfbath
house_type <- rbind(house_bed_fullbath, house_bed_halfbath)
house_type

## Split a string, then concatenate the results back together.
house_address_example <- house_dataset %>% purrr::pluck(7, 1)
strsplit(house_address_example, " ")
paste0(house_dataset %>% purrr::pluck(7, 1), collapse = " ")