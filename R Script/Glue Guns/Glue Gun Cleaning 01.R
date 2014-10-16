# This script file will do charts for gule gun cleaning lead measures

# This file reads Glue Gun Cleaning Data

IPB.Excel.WD <- setwd("/Users/garykitchen/Documents/IPB Work/Excel Work") # Create an object to set working directory for IPB Excel files

IPB.Excel.WD # set the working directory


### Work with Alpina Glue Gun Maintenance Scores

gluegunAlpina <- read.xlsx("Finishing Gun Cleaning Data.xlsx", sheetIndex = 4, as.data.frame = TRUE, header = TRUE) # Read worksheet object 4, the fourth worksheet regardless of its name.

gluegunAlpina$rowTotals <- gluegunAlpina$cleaned_guns + gluegunAlpina$guns_used  +  gluegunAlpina$guns_purged + gluegunAlpina$data_quality

plotData <- as.data.frame(aggregate(rowTotals ~ group , gluegunAlpina, sum , na.rm=TRUE))

plotData$rowTotals <- (plotData$rowTotals/82)*100

plotData$group <- as.factor(plotData$group)

plotDataA <- plotData

ybreaks <- seq(50, 100, by = 1)

AlpinaScores <- ggplot(plotData, aes(x=group, y = rowTotals, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

AlpinaScores <- AlpinaScores + labs(title = "Alpina Weekly Glue Gun Maintenance Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) 

# Ensure things have worked

print(AlpinaScores)

readkey()

pdf("AlpinaScores.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(AlpinaScores)

dev.off()


### Work with Domino Glue Gun Maintenance Scores

gluegunDomino <- read.xlsx("Finishing Gun Cleaning Data.xlsx", sheetIndex = 5, as.data.frame = TRUE, header = TRUE) # Read worksheet object 5, the fifth worksheet regardless of its name.

gluegunDomino$rowTotals <- gluegunDomino$cleaned_guns + gluegunDomino$guns_used  +  gluegunDomino$guns_purged + gluegunDomino$data_quality

plotData <- as.data.frame(aggregate(rowTotals ~ group , gluegunDomino, sum , na.rm=TRUE))

plotData$rowTotals <- (plotData$rowTotals/82)*100

plotData$group <- as.factor(plotData$group)

plotDataD <- plotData

ybreaks <- seq(50, 100, by = .25)

DominoScores <- ggplot(plotData, aes(x=group, y = rowTotals, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

DominoScores <- DominoScores + labs(title = "Domino Weekly Glue Gun Maintenance Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) 

# Ensure things have worked

print(DominoScores)

readkey()

pdf("DominoScores.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(DominoScores)

dev.off()



### Work with Media Glue Gun Maintenance Scores

gluegunMedia <- read.xlsx("Finishing Gun Cleaning Data.xlsx", sheetIndex = 6, as.data.frame = TRUE, header = TRUE) # Read worksheet object 6, the sixth worksheet regardless of its name.

gluegunMedia$rowTotals <- gluegunMedia$cleaned_guns + gluegunMedia$guns_used  +  gluegunMedia$guns_purged + gluegunMedia$data_quality

plotData <- as.data.frame(aggregate(rowTotals ~ group , gluegunMedia, sum , na.rm=TRUE))

plotData$rowTotals <- (plotData$rowTotals/62)*100

plotData$group <- as.factor(plotData$group)

plotDataM <- plotData

ybreaks <- seq(50, 100, by = 1)

MediaScores <- ggplot(plotData, aes(x=group, y = rowTotals, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

MediaScores <- MediaScores + labs(title = "Media Weekly Glue Gun Maintenance Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) 

# Ensure things have worked

print(MediaScores)

readkey()

pdf("MediaScores.pdf", width = 9, height = 6) # w = 6 & h = 9 seem to work well

print(MediaScores)

dev.off()
