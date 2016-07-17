source("dataHelper.R")
library(ggplot2)
library(dplyr)

NEI  <- LoadData("summarySCC_PM25")
SCC  <- LoadData("Source_Classification_Code")

NEI %>%
  filter(fips == "24510") %>%
  ggplot(aes(year, Emissions, color = type)) +
  geom_line(stat = "summary", fun.y = "sum") +
  ggtitle("Total Emissions in Baltimore, MD (1999 to 2008)") +
  xlab("Year") + ylab(expression("PM"[2.5]*" Emissions"))

ggsave("plot3.png", width = 5, height = 5)
