source("dataHelper.R")

NEI  <- LoadData("summarySCC_PM25")
SCC  <- LoadData("Source_Classification_Code")

png(filename = "plot5.png",
    width = 480, height = 480,
    units = "px")
