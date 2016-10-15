##############################################################################
##
##					Practical 1
##
##############################################################################

##############################################################################
##	Background:
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

## Clear the workspace for problem 10. Generally good to do at the beginning of
## a script
rm(list=ls())

## Problem #0
## Load the dplyr package
library(dplyr)

## Problem #1 Load the  as a data frame. How would we check that the data loaded
## okay? What are the dimensions of the dataset?
hotornot = read.csv("../datasets/hot_or_not.csv")
str(hotornot)
head(hotornot)
dim(hotornot)

########################################################################################
###### PROBLEM 9/10/11 #################################################################
## If you want to see what the data is like without including the replication
## skip the this section Problem #9/10, best done at the beginning to avoid
## repeating yourself
hotornot$Experiment <- "A" # add experiment column to original hot or not and call it A

hotornot_rep = read.csv("../datasets/hot_or_not_rep.csv") # load the replication experiment
str(hotornot_rep)  # an astute observer will notice there are some NAs in the dataset
head(hotornot_rep) # an astute observer with a good memory will remember this when using mean() !
dim(hotornot_rep)  

hotornot_rep$Experiment <- "B" # add experiment column to replication study and call it B

## Problem #10 binding the replication to the old dataset. Note, I'm overwriting
## the original data here. 
hotornot <- rbind(hotornot,hotornot_rep)
########################################################################################
########################################################################################

## Problem #2 
## Rename the columns to have appropriate names. You may use base R or dplyr. 
## NOTE: Condition is the 2nd column and Approach is the 3rd column. Also, 
## Subject is the 1st column and Time is the 4th.

hotornot <- rename(hotornot, Subject=x1, Condition=x2, Approach=x3, Time=x4) #dplyr
# OR
#colnames(hotornot) = c("Subject","Condition","Approach","Time") #base R

# Note: when you add in the replication experiment (Problem 9/10/11), with base R column renaming,
# you will also have to change your colnames() call a bit to avoid messing with 
# your new Experiment column. This is why dplyr is a little bit easier to use,
# you only change the columns you want to change.
colnames(hotornot)[1:4] = c("Subject","Condition","Approach","Time") #only change columns 1-4

## Problem #3
## Rename the observations of conditions and approaches to have meaningful
## names, rather than numbers.

hotornot$Condition[hotornot$Condition==1]<-"hot" 
hotornot$Condition[hotornot$Condition==2]<-"not"

hotornot$Approach[hotornot$Approach==1]<-"casual" 
hotornot$Approach[hotornot$Approach==2]<-"humor"

##	Problem #4
## Using dplyr, create a new dataframe called "summary" that contains the mean
## Time spent talking to the confederate, the standard deviation, and the number
## of observations for each cell of the 2x2 design. Take a look at summary

summary <- hotornot %>%
  group_by(Condition, Approach) %>%
  summarise(meanTime = mean(Time),
            sdTime = sd(Time),
            N=n())

summary

## Problem #5
## How would you change your code above to also report the standard error of the
## mean for each of the cells? Refresher: the standard error is the standard
## deviation divided by the square root of N (sqrt() is the function in R).

summary <- hotornot %>%
  group_by(Condition, Approach) %>%
  summarise(meanTime = mean(Time),
            sdTime = sd(Time),
            N=n(),
            SERR = sdTime / sqrt(N))

summary # If you did it differently, did you get the same result?



## Problem #6
## How would you change your code to also report 95% confidence intervals (e.g.,
## an upper level an lower level)? Refresher: 95% of the sampling distribution
## should fall between 1.96 standard errors below the mean and 1.96 standard
## errors above the mean

summary <- hotornot %>%
  group_by(Condition, Approach) %>%
  summarise(meanTime = mean(Time),
            sdTime = sd(Time),
            N=n(),
            SERR = sdTime / sqrt(N),
            upper_95 = meanTime + 1.96 * SERR,
            lower_95 = meanTime - 1.96 * SERR)

summary

## Problem #7
## Output your summary dataframe with all the information (mean, sd, serr, n,
## 95%s) to a csv file.

write.csv(summary, "hotornot_summary.csv", row.names = F)

## Problem 8
## What can you learn from looking at the descriptive statistics?

# Seems like if you're hot, your approach doesn't matter so much. If you're not, approach matters!

## Congrats! You now have a script that will load, recode, and compute 
## descriptive statistics for your dataset. This will be useful for plotting and
## analysis.
## 
## However, you have decided to run a replication study. This data is located in
## hot_or_not_rep.csv. The general format of the csv is the same as before. What
## you would like to do is add this data to the original dataset, and add a
## column to the new data.frame to code "Experiment (A or B)".

## Problem 9
## Where would be the optimal place to add this import operation to your script
## to save yourself typing?

# At the beginning. Load all the data together, bind it, then do the recoding. 
# This way you don't need multiple copies of the recoding script. Also, it will
# be nice and orderly for people reading your script trying to see what you did.

## Problem 10 Place the appropriate commands to import the new data and bind it 
## to the original data. Then compute the descriptive statistics as you did 
## before. However, this time you should include your experiment variable to see
## if results differ by experiment.  Is there something weird going on?
## 
## Note: it would be appropriate to clear your workspace at the beginning of the
## file, or to at least reload the original hot_or_not data from scratch. This 
## will prevent errors binding the two datasets

summary <- hotornot %>%
  group_by(Experiment, Condition, Approach) %>%
  summarise(meanTime = mean(Time),
            sdTime = sd(Time),
            N=n(),
            SERR = sdTime / sqrt(N),
            upper_95 = meanTime + 1.96 * SERR,
            lower_95 = meanTime - 1.96 * SERR)

summary

## There is something weird going on! We're getting NAs in the descriptives, 
## suggesting that there are some NA values in the input dataset (in the 
## replication experiment). The astute observer already realized this and
## hopefully remembered to account for it. We'd probably want to double check
## our data sheet to make sure those NAs belong there, or to see if something
## was miscoded. For now, we can have R ignore NAs when it computes the mean.

summary <- hotornot %>%
  group_by(Experiment, Condition, Approach) %>%
  summarise(meanTime = mean(Time, na.rm=T),
            sdTime = sd(Time, na.rm=T),
            N=n(),
            SERR = sdTime / sqrt(N),
            upper_95 = meanTime + 1.96 * SERR,
            lower_95 = meanTime - 1.96 * SERR)

summary

## Problem 11
## Does it seem like there is an advantage to having a R script vs doing the
## same exercise in excel?

# I think so. If we added the replication into Excel, we'd have to recode
# everything again, where here we just reran the commands after we imported the
# data. This would save you a good amount of time if you had a huge dataset. 

# In excel you would probably use pivot tables to compute the descriptives. 
# You'd have to rerun these pivot tables (or use formulas if you aren't
# aware of pivot tables yet), which requires a lot of pointing and clicking.

# Finally, the computation of standard error here in R is pretty straightfoward,
# and doesn't require you to expand your formulas for your new dataset.


## Last note: the script is still a bit messy. To clean it up, I would remove 
## the multiple statements that create "summary", and just keep the summary that
## supplies all the descriptive stats and confidence intervals for Experiment X
## Conditin X Approach. Finally, I'd move the write.csv to the bottom.

## Want more? Try out practical1_masochist.R
