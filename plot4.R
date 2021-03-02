unzip(zipfile = "data.zip")
suppressMessages(library(dplyr)) 
suppressMessages(library(ggplot2))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS('Source_Classification_Code.rds')

#Question4: Changes of emissions from coal combustion-related sources in United States

SCC_coal <- SCC[grep(pattern = "[Cc]oal", x = SCC$EI.Sector),]
QUIZ4data <- filter(NEI, SCC %in% SCC_coal$SCC) %>% group_by(year) %>%
  summarise(totalEmit = sum(Emissions))

png('plot4.png', width = 480, height = 480)
plot(x = QUIZ4data$year, y = QUIZ4data$totalEmit, type = "l", xlab = "Year", 
     ylab = "Total PM2.5 Emissions (Tons)", 
     main = "Total PM2.5 Emissions from Coal Combustion-Related Sources")
dev.off()
