##################################################################################
##
## Practical 1 Extra: For those who finished the first practical, who are more advanced
## R users, or who are masochists
##
##################################################################################
## 
## Messy ANT Data: Taken from "ez" package.
## 
## You can get more information about the data set here: 
## http://www.inside-r.org/packages/cran/ez/docs/ANT2
## 
## Attentional Networking Task: The Attentional Networking Task (ANT) is a sort 
## of cued Flanker task. There are four types of cue condition: (1) No cue, (2) 
## Central cue, (3) Double Cue, and (4) Spatial cue.  There are three types of 
## flankers: (1) Neutral, (2) Congruent, and (3) Incongruent. Flanker arrows may
## appear either up or down (above or below fixation), and the central/target 
## arrow may point either left or right. Ultimately, you want to extract summary
## data per participant per cue and flanker condition. Additionally, you need to
## compute 3 effects: the Alerting effect, the Orienting effect, and the
## Conflict effect. All of this should be done for each of the two groups
## "Control" and "Treatment"
##
##      These effects are computed as follows:
##
##	Alerting Effect = (RT to Double cue trials) - (RT to No cue trials)

##	Orienting Effect = (RT to Spatial cue trials) - (RT to Center cue trials)

##	Conflict Effect = (RT to Congruent trials) - (RT to Incongruent trials)

##
## Messy dataset: In this version of the data, subnum #7 is missing data from
## the last half of the experiment, subnum #14 made all errors in the
## incongruent cells, and subnum #12 mistakenly reversed their responses.
## 
################################################################################

################################################################################
## Problem #0
## Load the dplyr package and the ez package

##	Problem #1
##	Using the ANT2 task data from the ez package, load the data in R. 

data(ANT2) #this is a freebie... to load a dataset in a package, 
#simply use the data() function and it will place it in your workspace!

## What is the dataset called in your environment? 

##	Problem #2 
##We know that subnum 7 is missing a large amount of data. Remove subnum 7 from
##the dataset. Subnum 12 reversed the buttons in his/her responses, so all of
##the 1s in the "error" column should be 0s, and vice versa. Fix this reversal, or create
##a new corrected error column.

##	Problem #3 
## The terrible software that ran this version of the ANT task created an
## "error" column rather than an "accuracy" column. Error codes 1 if the
## participant made an error and 0 if they were accurate. Create a new column
## called "accuracy" using the inverse of the error column. (Note: there are NAs
## in these data that you need to preserve.)

##	Problem #4
## For this task, a reviewer is concerned about the presence of outlier trials 
## in your data, and they suggest that you (1) for each participant, 
## identify/code trials with a reaction time 2.5 SD above or below that 
## participant's mean reaction time; (2) exclude those trials from analysis. 
## These trials should be identified from correct responses only, not incorrect
## responses.

## Problem #5
## How many outliers were there as a percentage of the dataset? What should you tell the reviewer?

## Problem #6
## Using only correct trials, create summary dataframes that contain the
## relevant information to compute each of the following effects for each subject: alerting 
## effect, orienting effect, conflict effect (using reaction time; see below for
## a reminder of the trials involved). It's fine to have separate dplyr calls
## for each effect! You don't actually have to compute the effect.
