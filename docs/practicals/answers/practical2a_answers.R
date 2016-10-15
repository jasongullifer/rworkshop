##############################################################################
##
##					Practical 2: part a
##
##############################################################################

##############################################################################
##	Background:
##	For practical 2, we will be plotting data from two datasets: the hot or not 
##	dataset (part a) you worked with in practical 1, and the ANT dataset (part b)
##	from the ez package. If you completed practical1_extra.R feel free to use
##	that version of the dataset. Otherwise, you can use the dataset provided by
##	the package.
##############################################################################

#######################     HOT OR NOT     ###################################

## Problem 1 
## Paste your script from practical 1 as a starting point. Keep only the 
## relevant comments and commands. Your goal is to get both hot_or_not datasets 
## loaded, coded for Experiment A/B, bound together, given column names, given 
## useful variable names. Don't forget to add a library() call so that you can
## load ggplot2.

## Note: this is what I would call the header of your script. It gets the data 
## imported and formatted the way you want. Then you'll never have to do it 
## again. After the header is where you would start doing aggregation and
## plotting and analysis.
rm(list=ls())
library(dplyr)
library(ggplot2)
hotornot = read.csv("../datasets/hot_or_not.csv")

hotornot$Experiment <- "A" # add experiment column to original hot or not and call it A

hotornot_rep = read.csv("../datasets/hot_or_not_rep.csv") # load the replication experiment
hotornot_rep$Experiment <- "B" # add experiment column to replication study and call it B

hotornot <- rbind(hotornot,hotornot_rep)

hotornot <- rename(hotornot, Subject=x1, Condition=x2, Approach=x3, Time=x4) #dplyr

hotornot$Condition[hotornot$Condition==1]<-"hot" 
hotornot$Condition[hotornot$Condition==2]<-"not"

hotornot$Approach[hotornot$Approach==1]<-"casual" 
hotornot$Approach[hotornot$Approach==2]<-"humor"


## Problem 2 
## Plot the average time spent conversing by each condition and each 
## approach. Make two plots. In the first plot, use bars. In the second plot,
## use points. In both plots please include 95% confidence intevals as error bars.

## Please average over "Experiment" as a factor. Make sure to reuse/modify the
## appropriate summary frame from your previous script.

summary <- hotornot %>%
  group_by(Condition, Approach) %>%
  summarise(meanTime = mean(Time, na.rm=T),
            sdTime = sd(Time, na.rm=T),
            N=n(),
            SERR = sdTime / sqrt(N),
            upper_95 = meanTime + 1.96 * SERR,
            lower_95 = meanTime - 1.96 * SERR)

summary

ggplot(summary, aes(x=Condition, y=meanTime, fill=Approach)) + 
  geom_bar(stat="identity", position = position_dodge(.9)) + 
  geom_errorbar(position=position_dodge(.9), width=.1, aes(ymin=lower_95, ymax=upper_95))

ggplot(summary, aes(x=Condition, y=meanTime, colour=Approach)) + 
  geom_point(position = position_dodge(.9))  +
  geom_errorbar(position=position_dodge(.9), width=.1, aes(ymin=lower_95, ymax=upper_95))

## Problem 3 Now add facets by experiment to your two plots. Remember you may need to
## recompute your summary frame.
summary <- hotornot %>%
  group_by(Experiment, Condition, Approach) %>%
  summarise(meanTime = mean(Time, na.rm=T),
            sdTime = sd(Time, na.rm=T),
            N=n(),
            SERR = sdTime / sqrt(N),
            upper_95 = meanTime + 1.96 * SERR,
            lower_95 = meanTime - 1.96 * SERR)

summary

ggplot(summary, aes(x=Condition, y=meanTime, fill=Approach)) + 
  geom_bar(stat="identity", position = position_dodge()) + 
  geom_errorbar(position=position_dodge(.9), width=.1, aes(ymin=lower_95, ymax=upper_95)) +
  facet_wrap(~Experiment)

ggplot(summary, aes(x=Condition, y=meanTime, colour=Approach)) + 
  geom_point(position = position_dodge(.9))  +
  geom_errorbar(position=position_dodge(.9), width=.1, aes(ymin=lower_95, ymax=upper_95))+
  facet_wrap(~Experiment)

## Problem 3 

## Modify your two plots from the previous problem. Give them main titles and a
## better title on more descriptive title for the y-axis. Next, make theme
## easier to see in presentations. E.g., increase the font size, make the lines
## more weighty, etc.

ggplot(summary, aes(x=Condition, y=meanTime, fill=Approach)) + 
  geom_bar(stat="identity", position = position_dodge()) + 
  geom_errorbar(position=position_dodge(.9), width=.1, aes(ymin=lower_95, ymax=upper_95)) +
  facet_wrap(~Experiment) +
  ggtitle("Hot or Not data") + ylab("mean time spent talking in seconds") + 
  theme_gray(base_size=24) +
  theme(plot.title = element_text(size = rel(1),lineheight=.8, face="bold"))
        
ggplot(summary, aes(x=Condition, y=meanTime, colour=Approach)) + 
  geom_point(position = position_dodge(.9), size=3)  +
  geom_errorbar(position=position_dodge(.9), width=.1, size=1, aes(ymin=lower_95, ymax=upper_95))+
  facet_wrap(~Experiment) +
  ggtitle("Hot or Not data") + ylab("mean time spent talking in seconds") + 
  theme_gray(base_size=24) +
  theme(plot.title = element_text(size = rel(1),lineheight=.8, face="bold"))


## Problem 4
## Let's visualize the individual participant data. Instead of faceting by 
## Experiment, facet by subject. Again, make two plots, one using bars and the 
## other using points. No need to worry about error bars any more.  Remember you
## may need to recompute your summary frame. Note: both factors are
## between-subjects, so this is just for illustration!

summary <- hotornot %>%
  group_by(Subject, Condition, Approach) %>%
  summarise(meanTime = mean(Time, na.rm=T))
summary

ggplot(summary, aes(x=Condition, y=meanTime, fill=Approach)) + 
  geom_bar(stat="identity", position = position_dodge()) + 
  facet_wrap(~Subject)

ggplot(summary, aes(x=Condition, y=meanTime, colour=Approach)) + 
  geom_point(position = position_dodge(.9))  +
  facet_wrap(~Subject)

