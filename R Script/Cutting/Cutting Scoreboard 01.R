# This script file will do scoreboards for cutting lead measures

# This file reads Cutting Die Board Grading Data

IPB.Excel.WD <- setwd("/Users/garykitchen/Documents/IPB Work/Excel Work") # Create an object to set working directory for IPB Excel files

IPB.Excel.WD # set the working directory


### Work with Alpina Glue Gun Maintenance Scores

plotData <- read.xlsx("cutting lead measure.xlsx", sheetIndex = 1, as.data.frame = TRUE, header = TRUE) # Read worksheet object 1, the first worksheet regardless of its name.

ybreaks <- seq(80, 100, by = 1)

cuttingScores <- ggplot(plotData, aes(x=Week.of, y = Percent.scored, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

cuttingScores <- cuttingScores + labs(title = "Cutting Die Board Performance Scores", x = "Date" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 45, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) 

# Ensure things have worked

print(cuttingScores)

readkey()

pdf("cuttingScores.pdf", width = 9, height = 6) # w = 9 & h = 6 seem to work well

print(cuttingScores)

dev.off()


