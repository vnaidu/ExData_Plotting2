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
  filter(fips == "24510" | fips == "06037") %>%
  select(Emissions, year, fips) %>%
  group_by(year, fips) %>%
  summarise(total = sum(Emissions))

ggplot(motorEmissions, aes(year, total, color = fips)) +
  geom_line(size = .75) +
  geom_point(size = 1.5) +
  ggtitle("Total Emissions from Motor Vehicle Sources (1999-2008)\n
          Los Angeles County Vs. Baltimore City") +
  xlab("Year") + ylab(expression("PM"[2.5]*" Emissions")) +
  scale_color_ptol(name = "Location",
                  labels = c("LA County, CA", "Baltimore, MD")) +
  theme_hc()


ggsave("plot6.png", width = 7, height = 7)
