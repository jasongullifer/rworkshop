##############################################################################
##
##					Practical 1
##
##############################################################################

##############################################################################
##	Problem #1-3 Background:
##	Your collaborator gives your data ("hot or not.csv") collected with Matlab.
##	The data come to you without meaningful column labels (Thanks, Matlab!). 
##	Everything is coded numerically. You and your collaborator are 
##	interested in the effectiveness of different ways of introducing oneself 
##	to be attractive others. Two confederates (one hot, one not; this is factor 
##	A, attractiveness, with two levels: (1) attractive and (2) not attractive) 
##	are instructed to use one of two ways to get to know someone (factor B, 
##	approach, with two levels: (1) casual conversation and (2) humor). Each 
##	confederate finds and accosts five different people using each approach 
##	(n = 5 per cell), and the dependent measure is how long the confederate is 
##	able to engage an accosted individual in conversation.
##
##############################################################################

##	Problem #1 Load the  as a data frame. How would we check that the data loaded
##	okay? What are the dimensions of the dataset?

## Problem #2 
## Rename the columns to have appropriate names. You may use base R or dplyr. 
## NOTE: Condition is the 2nd column and Approach is the 3rd column. Also, 
## Subject is the 1st column and Time is the 4th.

## Problem #3
## Rename the observations of conditions and approaches to have meaningful
## names, rather than numbers.

##	Problem #4
## Using dplyr, create a new dataframe called "summary" that contains the mean
## Time spent talking to the confederate, the standard deviation, and the number
## of observations for each cell of the 2x2 design.

## Problem #5
## How would you change your code above to also report the standard error of the
## mean for each of the cells? Refresher: the standard error is the standard
## deviation divided by the square root of N (sqrt() is the function in R).

## Problem #6
## How would you change your code to also report 95% confidence intervals (e.g.,
## an upper level an lower level)? Refresher: 95% of the sampling distribution
## should fall between 1.96 standard errors below the mean and 1.96 standard
## errors above the mean

## Problem #7
## Output your summary dataframe with all the information (mean, sd, serr, n,
## 95%s) to a csv file.
