# This is a set up script file for R on my Mac.
# copy and paste this into consle, then hit enter     setwd("~/Documents/R Work/R Script")
# next copy and past this into console, then hit enter source("setup_r.R")

require(ggplot2)

require(gcookbook)

require(dplyr)

require(reshape2)

require(knitr)

require(lubridate)

require(chron)

require(scales)

require(grid)

require(xlsx) # Load xlsx package

source('~/Documents/R Work/R Script/Conductivity/multiplot.R', chdir = TRUE)

readkey <- function()
{
    cat ("Press [enter] to continue")
    line <- readline()
}

source('~/Documents/R Work/R Script/Conductivity/Conductivity Analysis 02.R', chdir = TRUE)

readkey()

source('~/Documents/R Work/R Script/Rollers/Rollers02.R', chdir = TRUE)



