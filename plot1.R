source("dataHelper.R")

NEI  <- LoadData("summarySCC_PM25")
SCC  <- LoadData("Source_Classification_Code")

png(filename = "plot1.png",
    width = 480, height = 480,
    units = "px")

yearlyEmissions <- NEI %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

plot(yearlyEmissions, type = "l", xlab = "Year", ylab = expression("PM"[2.5]*" Emissions"),
     main = "Total Emissions in the United States (1999 to 2008)")

dev.off()
