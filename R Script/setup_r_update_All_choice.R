# This is a set up script file for R on my Mac.
# copy and paste this into consle, then hit enter     setwd("~/Documents/R Work/R Script")
# next copy and past this into console, then hit enter source("setup_r.R")

update.packages()

install.packages("ggplot2")

install.packages("gcookbook")

install.packages("dplyr")

install.packages("reshape2")

install.packages("glmnet")

install.packages("coefplot")

install.packages("Rcpp")

install.packages("knitr")

install.packages("lubridate")

install.packages("chron")

install.packages("xlsx")

require(ggplot2)

require(gcookbook)

require(dplyr)

require(reshape2)

require(knitr)

require(lubridate)

require(chron)

require(scales)

require(grid)

require(xlsx)

source('~/Documents/R Work/R Script/Conductivity/multiplot.R', chdir = TRUE)

readkey <- function()
{
    cat ("Press [enter] to continue")
    line <- readline()
}

