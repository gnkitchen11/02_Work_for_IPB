# This script file will do charts for gule gun cleaning lead measures

# This file reads Glue Gun Cleaning Data

IPB.Excel.WD <- setwd("/Users/garykitchen/Documents/IPB Work/Excel Work") # Create an object to set working directory for IPB Excel files

IPB.Excel.WD # set the working directory


### Work with Print Team WIG Performance Scores

printTeam <- read.xlsx("Jim's teams score cards 4dx long USE.xlsx", sheetIndex = 1, as.data.frame = TRUE, header = TRUE, stringsAsFactors = FALSE) # Read worksheet object 1, the first worksheet regardless of its name

sbData <- data.frame(printTeam$Week,printTeam$Kept) 

TsbData <- table(sbData) # In this table NA is a value, not a missing indicator
                         # NA in the Excel file was read as a character.

end <- (length(TsbData)/3) - 1

zeros <- TsbData[1:end[1]]

ones <- TsbData[(end[1]+2):((2*end[1])+1)]

week <- seq(1:end[1])

total <- zeros + ones

perYes <- (ones/total)*100

TsbData <- (data.frame(week,zeros,ones,total,perYes) )

ybreaks <- seq(60, 100, by = 2)

xbreaks <- seq(1, 15, by = 1)

printTScores <- ggplot(TsbData, aes(x=week, y = perYes, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

printTScores <- printTScores + labs(title = "Print Team Weekly WIG Performance Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) + scale_x_continuous(breaks = xbreaks)

# Ensure things have worked

print(printTScores)

readkey()

pdf("printTScores.pdf", width = 9, height = 6) # w = 6 & h = 9 seem to work well

print(printTScores)

dev.off()


### Work with Die Cutting WIG Performance Scores

cuttingTeam <- read.xlsx("Jim's teams score cards 4dx long USE.xlsx", 2 , stringsAsFactors = FALSE) # Read worksheet object 2, the second worksheet regardless of its name

sbData <- data.frame(cuttingTeam$Week,cuttingTeam$Kept) 

TsbData <- table(sbData) # In this table NA is a value, not a missing indicator
                         # NA in the Excel file was read as a character.

end <- (length(TsbData)/3) - 1

zeros <- TsbData[1:end[1]]

ones <- TsbData[(end[1]+2):((2*end[1])+1)] #This if end is even?

week <- seq(1:end[1])

total <- zeros + ones

perYes <- (ones/total)*100

TsbData <- (data.frame(week,zeros,ones,total,perYes) )

ybreaks <- seq(54, 100, by = 2)

xbreaks <- seq(1, end[1], by = 1)

cuttingTScores <- ggplot(TsbData, aes(x=week, y = perYes, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

cuttingTScores <- cuttingTScores + labs(title = "Cutting Team Weekly WIG Performance Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) + scale_x_continuous(breaks = xbreaks)

# Ensure things have worked

print(cuttingTScores)

readkey()

pdf("cuttingTScores.pdf", width = 9, height = 6) # w = 6 & h = 9 seem to work well

print(cuttingTScores)

dev.off()


### Work with Finishing WIG Performance Scores

finishingTeam <- read.xlsx("Jim's teams score cards 4dx long USE.xlsx", 3 , stringsAsFactors = FALSE) # Read worksheet object 3, the third worksheet regardless of its name

sbData <- data.frame(finishingTeam$Week,finishingTeam$Kept) 

TsbData <- table(sbData) # In this table NA is a value, not a missing indicator
                         # NA in the Excel file was read as a character.

end <- (length(TsbData)/3) - 1

zeros <- TsbData[1:end[1]]

ones <- TsbData[(end[1]+2):((2*end[1])+1)] #This if end is even?

week <- seq(1:end[1])

total <- zeros + ones

perYes <- (ones/total)*100

TsbData <- (data.frame(week,zeros,ones,total,perYes) )

ybreaks <- seq(54, 100, by = 2)

xbreaks <- seq(1, end[1], by = 1)

finishingTScores <- ggplot(TsbData, aes(x=week, y = perYes, group=1) ) + geom_line(colour = "blue", linetype = "dotted", size = 2) + geom_point(colour = "blue" , size = 10, shape = 21 , fill = "green")

finishingTScores <- finishingTScores + labs(title = "Finishing Team Weekly WIG Performance Scores", x = "Week" , y = "Percent of Performance Score") + theme(title=element_text(size = 12), axis.title.x=element_text(size = 10), axis.title.y=element_text(size = 10), axis.text.y=element_text(size = 6), axis.text.x=element_text(angle = 0.0, vjust = 0.5, hjust = 0.5, size = 9)) + scale_y_continuous(breaks = ybreaks) + scale_x_continuous(breaks = xbreaks)

# Ensure things have worked

print(finishingTScores)

readkey()

pdf("finishingTScores.pdf", width = 9, height = 6) # w = 6 & h = 9 seem to work well

print(finishingTScores)

dev.off()

