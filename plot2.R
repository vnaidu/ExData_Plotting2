source("dataHelper.R")

library(dplyr)

neiData  <- LoadData('summarySCC_PM25')
sccData  <- LoadData('Source_Classification_Code')

png(filename = "plot1.png",
    width = 480, height = 480,
    units = "px")
