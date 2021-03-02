
unzip(zipfile = "data.zip")
suppressMessages(library(dplyr)) 
suppressMessages(library(ggplot2))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS('Source_Classification_Code.rds')

#Question5: Changes of emissions from motor vehicle sources in Baltimore City

SCC_veh <- SCC[grep(pattern = "[Vv]eh", x = SCC$EI.Sector),]
QUIZ5data <- filter(NEI, fips == "24510", SCC %in% SCC_veh$SCC) %>% 
  group_by(year) %>%
  summarise(totalEmit = sum(Emissions))

png('plot5.png', width = 480, height = 480)
plot(x = QUIZ5data$year, y = QUIZ5data$totalEmit, type = "l", xlab = "Year", 
     ylab = "Total PM2.5 Emissions (Tons)", 
     main = "Total PM2.5 Emissions from Motor Vehicle Sources in Baltimore City")

dev.off()
