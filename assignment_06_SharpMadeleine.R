# Assignment: ASSIGNMENT 6
# Name: Sharp, Madeleine
# Date: 2021-10-21

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Madeleine's PC/Documents/Madeleine/Documents/Bellevue University Courses/Masters in DS/BU DSC520/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

## Load the ggplot2 library
library(ggplot2)

## Fit a linear model using the `age` variable as the predictor and `earn` as the outcome
age_lm <- lm(earn ~ age, data = heights_df)
age_lm

## View the summary of your model using `summary()`
summary(age_lm)

## Creating predictions using `predict()`
## age_predict_df <- data.frame(earn = predict(___, ___), age=___)
## age_predict_df <- data.frame(earn = predict(age_lm, newdata = age_predict_df), age = 26)
## Broken into two steps and then run, as that worked better than the single step option commented out above.
age_df <- data.frame(age = c(24, 36, 48, 60, 72, 84, 96))
age_predict_df <- data.frame(earn = predict(age_lm, newdata = age_df), age = age_df)
age_predict_df

## Plot the predictions against the original data
ggplot(data = age_predict_df, aes(y = earn, x = age)) +
  geom_point(color='blue') +
  geom_line(color='red', data = heights_df, aes(y = earn, x = age))

mean_earn <- mean(heights_df$earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - age_predict_df$earn)^2)
## Residuals
residuals <- heights_df$earn - age_predict_df$earn
## Sum of Squares for Error
sse <- sum(residuals^2)
## R Squared R^2 = SSM\SST
r_squared <- ssm/sst

## Number of observations
n <- 1192
## Number of regression parameters
p <- 2
## Corrected Degrees of Freedom for Model (p-1)
dfm <- p - 1
## Degrees of Freedom for Error (n-p)
dfe <- n - p
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- n - 1

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm/dfm
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- sse/dfe
## Mean of Squares Total:   MST = SST / DFT
mst <- sst/dft
## F Statistic F = MSM/MSE
f_score <- msm/mse

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- 1 - (1 - r_squared)*(n - 1) / (n - p)

## Calculate the p-value from the F distribution
p_value <- pf(f_score, dfm, dft, lower.tail = F)
