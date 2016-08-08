source("dataHelper.R")
library(ggplot2)
library(ggthemes)
library(dplyr)

NEI  <- LoadData('summarySCC_PM25')
SCC  <- LoadData('Source_Classification_Code')

SCC.motorInShortName <-
  subset(SCC$SCC, grepl("motor", SCC$Short.Name, ignore.case = T))

motorEmissions <-
  NEI %>%
  subset(NEI$SCC %in% SCC.motorInShortName) %>%
  filter(fips == "24510") %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

ggplot(motorEmissions, aes(year, total)) +
  geom_line() +
  ggtitle("Total Emissions from Motor Vehicle Sources\n Baltimore, MD (1999-2008)") +
  xlab("Year") + ylab(expression("PM"[2.5]*"Emissions")) +
  scale_color_ptol() +
  theme_hc()

ggsave("plot5.png", width = 5, height = 5)
