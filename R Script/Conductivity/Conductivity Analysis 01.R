# This is my first attempt at processing the press conductivity data

# Run this from the console   
# Initially, I am going to use copy and paste because it is as fast as any other way

# First, copy the data, then execute the following code

# Next run this from the console source("Conductivity Analysis 01.R")

# This will prepare all the data, but not the graph

conData <- read.table(pipe("pbpaste"), header = TRUE, sep = "\t") 

# Check to see if the data came in

head(conData)

names(conData)

class(conData$Date) # The class of this variable is factor, will need lubridate to change

require(lubridate)

dateymd <- dmy(conData$Date, tz = "MST")

head(dateymd)

datetime <- as.POSIXct(paste(dateymd,conData$Time, sep = " ") )

class(datetime)

head(datetime)

# In order to use ggplot, data must be in a dataframe.

plotData <- data.frame(datetime,conData$Supply_μS, as.factor(conData$Shift) )

names(plotData) <- paste(c("Date", "Supply", "Shift") ) # Simplify the names and make meaningful

head(plotData)

str(plotData)

require(ggplot2)

datebreaks <- seq(as.POSIXct("2014-07-08 08:00"), as.POSIXct("2014-09-19 08:00"), by = "3 day" )

supplybreaks <- seq(1700, 3000, by = 100)

head(datebreaks)

#pdf("Conductivity.pdf", width = 4, height = 4) # Cannot make this work well

Supply.plot <- ggplot(plotData, aes(x=Date, y = Supply, group=1 , colour = Shift   )) + geom_line() + geom_point(size = 2 ) 

Supply.plot <- Supply.plot + scale_x_datetime(breaks = datebreaks) + scale_y_continuous(breaks = supplybreaks)

Supply.plot <- Supply.plot + theme(axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5))

Supply.plot <- Supply.plot + labs(x = "Date & Time" , y = "Supply_μS") + geom_hline(yintercept = 2440, colour = "green", size = 0.5 )

Supply.plot <- Supply.plot + geom_hline(yintercept = 1936, colour = "green", size = 0.5 ) + geom_hline(yintercept = 2944, colour = "green", size = 0.5 )

print(Supply.plot)

#ggsave(Supply.pdf, width = 4, height = 4) # Cannot make this work well

#dev.off()  # Cannot make this work well



