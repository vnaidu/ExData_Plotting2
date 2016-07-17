source("dataHelper.R")
library(ggplot2)
library(dplyr)

NEI  <- LoadData('summarySCC_PM25')
SCC  <- LoadData('Source_Classification_Code')

SCC.coalInShortName <-
  subset(SCC$SCC, grepl("coal", SCC$Short.Name, ignore.case = T))

coalEmissions <-
  NEI %>%
  subset(NEI$SCC %in% SCC.coalInShortName) %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

ggplot(coalEmissions, aes(year, total)) +
  geom_line() +
  ggtitle("Total Emissions From Coal Combustion (1999 to 2008)") +
  xlab("Year") + ylab(expression("PM"[2.5]*"Emissions"))

ggsave("plot4.png", width = 5, height = 5)
