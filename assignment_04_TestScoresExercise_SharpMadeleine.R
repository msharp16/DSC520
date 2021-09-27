# Assignment: Week 4 - Test Scores Exercise
# Name: Sharp, Madeleine
# Date: 2021-09-24

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Madeleine's PC/Documents/Madeleine/Documents/Bellevue University Courses/Masters in DS/BU DSC520/dsc520/data")

## Load the `scores.csv' data set
## Finding the observational units in the study
scores_dataset <- read.csv("scores.csv")
scores_dataset

## Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
library(dplyr)
select(scores_dataset, "Section")
section_regular <- filter(scores_dataset, Section == "Regular")
section_sports <- filter(scores_dataset, Section == "Sports")
section_regular
section_sports


## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

##Use the Plot function to plot each Sections scores and the number of students achieving that score. 
ggplot(section_regular, aes(Score, Count)) + geom_point(color = "red") + ggtitle("Test Scores: Regular Section")
ggplot(section_sports, aes(Score, Count)) + geom_point(color = "darkred") + ggtitle("Test Scores: Sports Section")

## Also including a histogram to assess distributions
ggplot(section_regular, aes(x = Score)) + geom_histogram(bins = 4, color = "black", fill = "white") + ggtitle("Test Scores: Regular Section") + 
  xlab("Score") + ylab("Count")
ggplot(section_sports, aes(x = Score)) + geom_histogram(bins = 4, color = "black", fill = "white") + ggtitle("Test Scores: Sports Section") + 
  xlab("Score") + ylab("Count")