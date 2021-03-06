source("dataHelper.R")

NEI  <- LoadData("summarySCC_PM25")
SCC  <- LoadData("Source_Classification_Code")

yrlyBaltimoreEmissions <- NEI %>%
  filter(fips == "24510") %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

png(filename = "plot2.png",
    width = 480, height = 480,
    units = "px")

plot(yrlyBaltimoreEmissions, type = "l", xlab = "Year",
     main = "Total Emissions in Baltimore, MD (1999 to 2008)",
     ylab = expression("PM"[2.5]*" Emissions"))

dev.off()
