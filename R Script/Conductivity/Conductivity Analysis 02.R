# This is my second attempt at processing the press conductivity data

# Run this file by copying and pasting the following line into the R console

# source('~/Documents/R Work/R Script/Conductivity/Conductivity Analysis 02.R', chdir = TRUE)

# Set the working directory to read csv file with data

setwd("/Users/garykitchen/Documents/IPB Work/Excel Work") # Set working directory

# Read in the data, I have tried to read Excel files directly, too many problems with current packages

excel01 <- read.xlsx("Conductivity data 01.xlsx", sheetIndex = 2, as.data.frame = TRUE, header = TRUE, stringsAsFactors = FALSE )

# Changed from read.table to read.xlsx on Oct 10, 2014 because I don't want to have the extra step of creating a csv file.

# At this point here is the structure of excel01, I tried to add colClasses = c(...) but it messes up Time even worse.

# > str(excel01)
# 'data.frame':        141 obs. of  10 variables:
# $ Week         : num  1 1 1 1 1 1 2 2 2 2 ...
# $ Date         : Date, format: "2014-07-08" "2014-07-08" "2014-07-09" ...
# $ Shift        : num  1 2 1 2 1 2 1 2 1 2 ...
# $ Time         : POSIXct, format: "1899-12-30 09:00:00" NA NA ...
# $ Supply_Temp  : num  NA NA NA NA NA NA NA NA NA NA ...
# $ Supply_microS: num  2100 NA NA NA 2389 ...
# $ Mix_microS   : num  1660 NA NA NA 1553 ...
# $ Water_changed: num  1 NA NA NA 0 0 0 1 0 0 ...
# $ Quality_score: num  1 0 0 0 1 1 1 1 1 1 ...
# $ Comments     : chr  NA NA NA NA ...

# Convert Week and Shift from integer to Factor to plot on scale with Supply_microS

excel01$Week <- as.factor(excel01$Week)

excel01$Shift <- as.factor(excel01$Shift)

# One of the revisions on 10/10/2014 is to create a Scoreboard for whether or not the conducitivity data is being collected. Each week will have (4 to 6 days) x 2 shifts of data collection opportunities. The count of successes divided by the count of total opportunities will give the Performance Score for the Scoreboard.

# I need a column of 1's or 0's to count total opportunities. I need to put it inside the Excel spreadsheet.

numerator <- as.data.frame(aggregate(Quality_score ~ Week , excel01, sum , na.rm=TRUE)) # This gives the numerator of the performance score.nu

numerator$Week <- as.integer(numerator$Week)

denominator <- as.data.frame(aggregate(Opportunity ~ Week , excel01, sum , na.rm=TRUE)) # This gives the denominator of the performance score.

numerator$Opportunity <- denominator$Opportunity

numerator$perScores <- (numerator$Quality_score/numerator$Opportunity)*100

ybreaks <- seq(45, 100, by = 5)

end <- dim(numerator)

end <- end[1]

xbreaks <- seq(1,end, by = 1)

FountainhScores <- ggplot(numerator, aes(x=Week, y = perScores, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

FountainhScores <- FountainhScores + labs(title = "Fountain Solution Monitoring Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) + scale_x_continuous(breaks = xbreaks)

# Ensure things have worked

print(FountainhScores)

readkey()

pdf("FountainhScores.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(FountainhScores)

dev.off()








#################################################### Control Charts ##################

# Calculate MR for Supply Mix Conductivity

excel01$xMR <- c(NA,abs(diff(excel01$Supply__S, difference = 1)))

# Calculate contrl chart parameters

avgX <- mean(excel01$Supply__S, na.rm = TRUE)   # prepare control limits for Xchart

avgMR <-  mean(excel01$xMR, na.rm = TRUE)   # prepare control limits for MRchart and Xchart

lowerCLX <- avgX - 2.66 * avgMR   # prepare control limits for Xchart

upperCLX <- avgX + 2.66 * avgMR   # prepare control limits for Xchart

upperCLMR <- 3.268 * avgMR   # prepare control limits for MRchart

lowerCLMR <- 0   # prepare control limits for MRchart

xlimits <- c(upperCLX , avgX, lowerCLX)   # prepare control limits for Xchart

Xlimits <- data.frame(xlimits)   # prepare control limits for Xchart

mrlimits <- c(upperCLMR, avgMR, lowerCLMR)   # prepare control limits for MRchart

MRlimits <- data.frame(mrlimits)   # prepare control limits for MRchart

Xbreaks <- seq(1700, 3000, by = 100)   # prepare y axis label values for Xchart

MRbreaks <- seq(0,1100, by = 100)   # prepare y axis label values for MRchart

datebreaks <- seq(as.POSIXct("2014-07-08 08:00"), as.POSIXct("2014-10-03 08:00"), by = "3 day" ) # Really need to pass a parameter to the last date, otherwise constantly updating this line of code. # prepare x axis label values for Xchart and MRchart

# End of Calculate contrl chart parameters

# Remove first row from data because moving range is missing and this creates a warning message when using ggplot2.

excel01 <- excel01[-1, ]

# Prepare Xchart

supplyXchart <- ggplot(excel01, aes( x = Date, y = Supply__S    )) + geom_line() + geom_point( size = 1, shape = 21, fill = "white" ) 

supplyXchart  <- supplyXchart  + geom_hline(data = Xlimits, aes(  yintercept = xlimits , colour = "red"  ))

supplyXchart  <- supplyXchart + labs(title = "Individuals Control Chart for Supply Conductivity ", x = "Date & Time of Reading" , y = "Supply Conductivity in microS") + scale_x_datetime(breaks = datebreaks) + theme(title=element_text(size = 9), axis.title.x=element_text(size = 7), axis.title.y=element_text(size = 7), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5)) +   scale_y_continuous(breaks = Xbreaks, labels = comma)



# Prepare MRchart

supplyMRchart <- ggplot(excel01, aes( x = Date, y = xMR    )) + geom_line() + geom_point( size = 1, shape = 21, fill = "white" , size = "Shift" ) 

supplyMRchart  <- supplyMRchart  + geom_hline(data = MRlimits, aes(  yintercept = mrlimits , colour = "red"  ))

supplyMRchart  <- supplyMRchart + labs(title = "Moving Range Control Chart for Supply Conductivity", x = "Date & Time of Reading" , y = "Moving Range of Supply Conductivity in microS") + theme(title=element_text(size = 9), axis.title.x=element_text(size = 7), axis.title.y=element_text(size = 7), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5)) + scale_x_datetime(breaks = datebreaks) + scale_y_continuous(breaks = MRbreaks)

# Ensure things have worked

print(supplyMRchart)

readkey()

print(supplyXchart)

readkey()

# Output MRchart and Xchart to pdf file

pdf("supplycontrolcharts.pdf", width = 6, height = 9) # w = 6 & h = 9 seem to work well

multiplot(supplyMRchart,supplyXchart, col = 1) # This seems to work okay with pdf()

dev.off()

#embed_fonts("supplycontrolcharts.pdf") # Haven't found how to do this as of 9/30/2014


# Don't use this below here, it has been tried. Learn more, test again

#multiplot(supplyMRchart,supplyXchart, col = 1) # This is not working with ggsave()

#print(supplyXchart)

#ggsave("supplyXchart.pdf", width = 9, height = 7)

#print(supplyMRchart)

#ggsave("supplyMRchart.pdf", width = 9, height = 7)

#old.par <- par(mfcol = c(2,1)) # This recommendation from two sources doesn't do anything.

#plot(supplyMRchart) # Don't use this

#plot(supplyXchart) # Don't use this

#par(old.par)












