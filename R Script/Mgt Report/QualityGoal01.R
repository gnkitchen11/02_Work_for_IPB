# This is my first attempt at processing the Quality Goal data from Denver

# Run this from the console   setwd("~/Documents/R Work/R Script/Mgt Report") - This sets my working directory, 
# it is not necessary to run this file line by line.

# Initially, I am going to use copy and paste because it is as fast as any other way

# First, copy the data in your csv file, then execute the following code by putting the cursor in the line and hit (cmd + enter)

qData <- read.table(pipe("pbpaste"), header = TRUE, sep = "\t") 

# Check to see if the data came in, to run the code line by line, put cursor in the line "head(qData) and hit (cmd + enter)

# Continue moving the cursor and hit (cmd + enter) to execute line by line. The results appear the console screen.

head(qData) # This is the first few rows of the data frame qData

tail(qData) # This is the last few rows of the data frame qData

names(qData) # This gives the names of the data frame qData

str(qData) # This gives the structure of the data frame qData

require(lubridate) # This loads the commands in the lubridate package, first must run install.packages("lubridate")

dateymd <- dmy(qData$week_date, tz = "MST") # This transforms the variable week_date into a format that R can easily use

head(dateymd)

class(dateymd) # This tells you the class of the object dateymd

plotData <- data.frame(dateymd,qData$performance, qData$target_2014 ) # Create a data frame to be used by ggplot

names(plotData) <- paste(c("Week", "Performance", "Goal") ) # Simplify the names and make meaningful

plotData$Performance <- 100*plotData$Performance # Scale the data

plotData$Goal <- 100*plotData$Goal # Scale the data

head(plotData) # Check the data

tail(plotData) # Check the data

require(ggplot2) # This loads the commands in the ggplot2 package, first must run install.packages("ggplot2")

datebreaks <- seq(as.POSIXct("2014-05-05"), as.POSIXct("2015-01-19"), by = "2 week" ) # Creates a vector to be used for the x scale

datebreaks # Check the data

goalbreaks <- seq(0.18, 1.38, by = 0.10) # Creates a vector to be used for the y scale

goalbreaks # Check the data

names(plotData) # Show the names in the plotData data frame

# The following lines build the final graph which is graphed by executing goal.plot, the last line

goal.plot <- ggplot(plotData, aes(dateymd)) + geom_line(aes(y = Performance, colour = "Performance")) + geom_line(aes(y = Goal, colour = "Goal")) 

goal.plot <- goal.plot + scale_x_datetime(breaks = datebreaks) + scale_y_continuous(breaks = goalbreaks)

goal.plot <- goal.plot + theme(axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5))

goal.plot <- goal.plot + labs(x = "Date" , y = "Performance & Goal Measures")

print(goal.plot) # You can save this plot as a pdf

ggsave(goal.pdf, width = 4, height = 4)

