# Assignment: American Community Survey Exercise
# Name: Sharp, Madeleine
# Date: 2021-09-18

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Madeleine's PC/Documents/Madeleine/Documents/Bellevue University Courses/Masters in DS/BU DSC520/dsc520/data")

## Load the `data/r4ds/heights.csv` to
acse_dataset <- read.csv("acs-14-1yr-s0201.csv")
str(acse_dataset)
nrow(acse_dataset)
ncol(acse_dataset)

# https://ggplot2.tidyverse.org/reference/geom_histogram.html
## Create a Histogram of the HSDegree variable using the ggplot2 package.
## Set a bin size for the Histogram.
## Include a Title and appropriate X/Y axis labels on your Histogram Plot.
ggplot(acse_dataset, aes(HSDegree)) + geom_histogram(bins = 10) + ggtitle("2014 American Community Survey Data") + 
  xlab("High School Degree (%)") + ylab("Frequency (Count)")
ggplot(acse_dataset, aes(HSDegree)) + geom_histogram(bins = 20) + ggtitle("2014 American Community Survey Data") + 
  xlab("High School Degree (%)") + ylab("Frequency (Count)")
ggplot(acse_dataset, aes(HSDegree)) + geom_histogram(bins = 12, binwidth = 2.775) + ggtitle("2014 American Community Survey Data") + 
  xlab("High School Degree (%)") + ylab("Frequency (Count)")

## Include a normal curve to the Histogram that you plotted.
ggplot(acse_dataset, aes(HSDegree)) + geom_histogram(aes(y=..density..), bins = 12, binwidth = 2.775, color = "black", fill = "white") +
  ggtitle("2014 American Community Survey Data") + xlab("High School Degree (%)") + ylab("Density") +
  stat_function(fun = dnorm, color="red", args=list(mean=mean(acse_dataset$HSDegree), sd=sd(acse_dataset$HSDegree)))

## Create a Probability Plot of the HSDegree variable.
p <- ggplot(acse_dataset, aes(sample = HSDegree))
p + stat_qq()
p + stat_qq() + stat_qq_line()

## Quantify normality with numbers using the stat.desc() function.
library(pastecs)
stat.desc(acse_dataset$HSDegree, basic = TRUE, desc = TRUE, norm = TRUE, p = 0.95)



