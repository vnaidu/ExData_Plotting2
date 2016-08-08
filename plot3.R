source("dataHelper.R")
library(ggplot2)
library(ggthemes)
library(dplyr)

NEI  <- LoadData("summarySCC_PM25")
SCC  <- LoadData("Source_Classification_Code")

NEI %>%
  filter(fips == "24510") %>%
  ggplot(aes(year, Emissions, color = type)) +
  geom_line(stat = "summary", fun.y = "sum", size = 0.8) +
  geom_point(stat = "summary", fun.y = "sum",size = 1.5) +
  ggtitle("Total Emissions in Baltimore, MD (1999 to 2008)") +
  xlab("Year") + ylab(expression("PM"[2.5]*" Emissions")) +
  scale_color_ptol(name = "Type: ") +
  theme_hc()

ggsave("plot3.png", width = 6, height = 4)
