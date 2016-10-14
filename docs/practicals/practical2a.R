##############################################################################
##
##					Practical 2: part a
##
##############################################################################

##############################################################################
##	Background:
##	For practical 2, we will be plotting data from the hot or not 
##	dataset (part a) you worked with in practical 1,
## If you finish early, or want additional practice. Feel free to attempt making
## some plots from the ANT dataset in the ez package. If you completed
## practical1_extra.R feel free to use that version of the dataset. Otherwise,
## you can use the dataset provided by the package. 
## To access that dataset, uncomment and run the next two lines. 
# library(ez)
# data(ANT)
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

## Problem 2 
## Plot the average time spent conversing by each condition and each 
## approach. Make two plots. In the first plot, use bars. In the second plot,
## use points. In both plots please include 95% confidence intevals as error bars.

## Please average over "Experiment" as a factor. Make sure to reuse/modify the
## appropriate summary frame from your previous script.

## Problem 3 Now add facets by experiment to your two plots. Remember you may need to
## recompute your summary frame.

## Problem 3 

## Modify your two plots from the previous problem. Give them main titles and a
## better title on more descriptive title for the y-axis. Next, make theme
## easier to see in presentations. E.g., increase the font size, make the lines
## more weighty, etc.


## Problem 4
## Let's visualize the individual participant data. Instead of faceting by 
## Experiment, facet by subject. Again, make two plots, one using bars and the 
## other using points. No need to worry about error bars any more.  Remember you
## may need to recompute your summary frame. Note: both factors are
## between-subjects, so this is just for illustration!

