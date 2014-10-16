# This file reads Roller Striping Data

# This file also has implementations of material studied in various books

# This file also uses R base graphs.

# This file has been superseeded by Rollers01.R but contains some useful learning to be reviewed at some point.

setwd("/Users/garykitchen/Documents/IPB Work/Excel Work") # Set working directory

excel01 <- read.xlsx("Roller Data Collection.xlsx", sheetIndex = 1, as.data.frame = TRUE, header = TRUE) # Read worksheet object 1, the first worksheet regardless of its name.

dim(excel01) # Check the dimensions of the data frame for any problems.

str(excel01) # Check the structure of the data frame for any problems.

head(excel01) # Check the top of the data frame for any problems.

tail(excel01) # Check the bottom of the data frame for any problems.

index01 <- nrow(subset(excel01, Unit != "NA") ) # This counts the number of values not equal to NA or not missing. 
                                     # Does not include col name. The first index in the next command is this value + 1

index01
                                    
index01 <- index01 + 1 

excel01 <- excel01[-index01:-456, ] # To see if this worked, check the dimensions and tail again. It worked.

#excel01$Nominal <- as.factor(excel01$Nominal) # I want the variable Nominal to be a factor for plotting.

plot.strip01 <- qplot(RollerTangent_line , StripWidthBefor , data = excel01 , colour = Nominal , geom = "jitter" ) 

plot.strip01 <- plot.strip01 + theme(axis.text.x=element_text(angle = 80, vjust = 0.5, hjust = 0.5, size = 5))

plot.strip01 <- plot.strip01 + labs(title = "Roller Stripe Readings" , x = "Position of Measurement" , y = "Stripe Measurement") + facet_wrap(~Unit)

# Ensure things have worked

print(plot.strip01)

pdf("rollerstripe.pdf")

print(plot.strip01)

dev.off()

names(excel01)

# The tables below do not provide important information, they were created to learn the process of making tables.

#table(excel01$RollerTangent_line, excel01$Location) # Provide a talbe of counts for Roller_Tangent_line and Location

#margin.table(table(excel01$RollerTangent_line, excel01$Location), 1 ) # Sums accross Location levels for each level of RollerTangent_line

#margin.table(table(excel01$RollerTangent_line, excel01$Location), 2 ) # Sums accross RollerTangent_line levels for each level of Location

#prop.table(table(excel01$RollerTangent_line, excel01$Location), 1 ) # Marginal Relative Frequency accross Location levels for each level of RollerTangent_line

#prop.table(table(excel01$RollerTangent_line, excel01$Location), 2 ) # Marginal Relative Frequency accross RollerTangent_line levels for each level of Location

# End of table making script.









