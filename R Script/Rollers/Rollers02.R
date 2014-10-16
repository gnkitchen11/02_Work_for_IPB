# This file reads Roller Striping Data

# This file 

setwd("/Users/garykitchen/Documents/IPB Work/Excel Work") # Set working directory

getwd()

# Get roller strip data and prepare scatter charts by Tangent Line ID and Date

excel01 <- read.xlsx("Roller Data Collection.xlsx", sheetIndex = 1, as.data.frame = TRUE, header = TRUE) # Read worksheet object 1, the first worksheet regardless of its name. # No problem reading this file using read.xlsx(). Why?

# There is no time variable in these worksheets! 

excel01$Week <- as.factor(excel01$Week)

dim(excel01) # Check the dimensions of the data frame for any problems.

str(excel01) # Check the structure of the data frame for any problems.

head(excel01) # Check the top of the data frame for any problems.

tail(excel01) # Check the bottom of the data frame for any problems.



########## Develop WIG scores and charts for striping

numerator <- as.data.frame(aggregate(WIG_score ~ Week , excel01, sum , na.rm=TRUE)) # This gives the numerator of the performance score.nu

numerator$Week <- as.integer(numerator$Week)

denominator <- as.data.frame(aggregate(WIG_opportunity ~ Week , excel01, sum , na.rm=TRUE)) # This gives the denominator of the performance score.

numerator$WIG_opportunity <- denominator$WIG_opportunity

numerator$perScores <- (numerator$WIG_score/numerator$WIG_opportunity)*100

ybreaks <- seq(0, 100, by = 5)

end <- dim(numerator)

end <- end[1]

xbreaks <- seq(1,end, by = 1)

StripeScores <- ggplot(numerator, aes(x=Week, y = perScores, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

StripeScores <- StripeScores + labs(title = "Striping WIG Monitoring Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) + scale_x_continuous(breaks = xbreaks)

# Ensure things have worked

print(StripeScores)

readkey()

pdf("StripeScores.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(StripeScores)

dev.off()

################ End of WIG scores and charts for Striping



ybreaks <- seq(0,14, by = 1)   # prepare y axis label values for plotting

rollerTlines <- qplot(RollerTangent_line , StripWidthBefor , data = excel01 , colour = Nominal , geom = "jitter" ) 

rollerTlines <- rollerTlines + labs(title = "Scatter Plot by Tangent Line ID", x = "Tangent Line ID" , y = "Stripe Width") + theme(title=element_text(size = 9), axis.title.x=element_text(size = 7), axis.title.y=element_text(size = 7), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5)) + scale_y_continuous(breaks = ybreaks) + theme(legend.position = "bottom")

drillIn <- rollerTlines + facet_wrap(~Date)

plot.strip01 <- qplot(RollerTangent_line , StripWidthBefor , data = excel01 , colour = Nominal , geom = "jitter" ) 

plot.strip01 <- plot.strip01 + theme(axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5))

plot.strip01 <- plot.strip01 + labs(title = "Roller Stripe Readings" , x = "Position of Measurement" , y = "Stripe Measurement") + facet_wrap(~Unit)

plot.strip01 <- plot.strip01 + labs(title = "Scatter Plot by Unit Number", x = "Tangent Line ID" , y = "Stripe Width") + theme(title=element_text(size = 9), axis.title.x=element_text(size = 7), axis.title.y=element_text(size = 7), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5)) + scale_y_continuous(breaks = ybreaks) + theme(legend.position = "bottom")


# Ensure things have worked

print(rollerTlines)

readkey()

print(drillIn)

readkey()

print(plot.strip01)

readkey()


pdf("rollerTangentLines.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(rollerTlines)

dev.off()

pdf("RTLdrillIn.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(drillIn)

dev.off()

pdf("rollerstripe.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(plot.strip01)

dev.off()

# ****************************************************************

# Get roller durometer data and prepare scatter charts 

excel02 <- read.xlsx("Roller Data Collection.xlsx", 2) # Read worksheet object 2, the second worksheet regardless of its name.  # No problem reading this file using read.xlsx(). Why?

dim(excel02) # Check the dimensions of the data frame for any problems.

str(excel02) # Check the structure of the data frame for any problems.

head(excel02) # Check the top of the data frame for any problems.

tail(excel02) # Check the bottom of the data frame for any problems.



########## Develop WIG scores and charts for Durometer Readings

numerator <- as.data.frame(aggregate(WIG_score ~ Week , excel02, sum , na.rm=TRUE)) # This gives the numerator of the performance score.nu

numerator$Week <- as.integer(numerator$Week)

denominator <- as.data.frame(aggregate(WIG_opportunity ~ Week , excel02, sum , na.rm=TRUE)) # This gives the denominator of the performance score.

numerator$WIG_opportunity <- denominator$WIG_opportunity

numerator$perScores <- (numerator$WIG_score/numerator$WIG_opportunity)*100

ybreaks <- seq(90, 100, by = .25)

end <- dim(numerator)

end <- end[1]

xbreaks <- seq(1,end, by = 1)

DurometerScores <- ggplot(numerator, aes(x=Week, y = perScores, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

DurometerScores <- DurometerScores + labs(title = "Durometer WIG Monitoring Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) + scale_x_continuous(breaks = xbreaks)

# Ensure things have worked

print(DurometerScores)

readkey()

pdf("DurometerScores.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(DurometerScores)

dev.off()

################ End of WIG scores and charts for Durometer reading




excel02$Unit <- as.factor(excel02$Unit)

ybreaks <- seq(18,42, by = 2)   # prepare y axis label values for plotting

durometerChart01 <- qplot(Unit , Durometer , data = excel02 , colour = Roller , geom = "jitter" ) 

durometerChart01 <- durometerChart01 + labs(title = "Scatter Plot by Unit and Roller", x = "Unit Number" , y = "Durometer Reading") + theme(title=element_text(size = 9), axis.title.x=element_text(size = 7), axis.title.y=element_text(size = 7), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5)) + scale_y_continuous(breaks = ybreaks) + theme(legend.position = "bottom")

durometerChart02 <- durometerChart01 + facet_wrap(~Location)

# Ensure things have worked

print(durometerChart01)

readkey()

print(durometerChart02)

readkey()

pdf("rollerDurometer01.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(durometerChart01 )

dev.off()

pdf("rollerDurometer02.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(durometerChart02)

dev.off()


