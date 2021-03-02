unzip(zipfile = "data.zip")
suppressMessages(library(dplyr)) 
suppressMessages(library(ggplot2))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS('Source_Classification_Code.rds')

#Question2: Total emissions from PM2.5 in Baltimore City from 1999-2008

QUIZ2data <- filter(NEI, fips == "24510") %>% group_by(year) %>% 
  summarise(totalEmit = sum(Emissions))
png('plot2.png', width = 480, height = 480)
plot(x = QUIZ2data$year, y = QUIZ2data$totalEmit, type = "l", xlab = "Year", 
     ylab = "Total PM2.5 Emissions (Tons)", 
     main = "Total PM2.5 Emissions in Baltimore City")

dev.off()
