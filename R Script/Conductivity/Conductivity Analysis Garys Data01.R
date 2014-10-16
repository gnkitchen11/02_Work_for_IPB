# This file analyzes data I collected on fountain solution supply conductivity

require(xlsx) # Load xlsx package

setwd("/Users/garykitchen/Documents/IPB Work/Excel Work") # Set working directory

getwd()

excel01 <- read.xlsx("Conductivity data 01.xlsx", sheetIndex = 1, as.data.frame = TRUE, header = TRUE, colClasses=c(Time='character'),stringsAsFactors=FALSE)
) # Read worksheet object 1, the first worksheet regardless of its name.

dim(excel01) # Check the dimensions of the data frame for any problems.

str(excel01) # Check the structure of the data frame for any problems.

head(excel01) # Check the top of the data frame for any problems.

tail(excel01) # Check the bottom of the data frame for any problems.


