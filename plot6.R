unzip(zipfile = "data.zip")
suppressMessages(library(dplyr)) 
suppressMessages(library(ggplot2))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS('Source_Classification_Code.rds')

#Question6: Emissions from motor vehicle sources in Baltimore City vs Los Angeles County
SCC_veh <- SCC[grep(pattern = "[Vv]eh", x = SCC$EI.Sector),]
QUIZ6data_BC <- filter(NEI, fips == "24510", SCC %in% SCC_veh$SCC) %>% 
  group_by(year) %>%
  summarise(totalEmit = sum(Emissions))#Baltimore City data
QUIZ6data_LA <- filter(NEI, fips == "06037", SCC %in% SCC_veh$SCC) %>% 
  group_by(year) %>%
  summarise(totalEmit = sum(Emissions))#Los Angeles County data

png('plot6.png', width = 480, height = 480)
plot(x = QUIZ6data_BC$year, y = QUIZ6data_BC$totalEmit, type = "l", col = "red",
     xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", 
     main = "Total PM2.5 Emissions from Motor Vehicle Sources",
     ylim = c(min(QUIZ6data_BC$totalEmit, QUIZ6data_LA$totalEmit),
              max(QUIZ6data_BC$totalEmit, QUIZ6data_LA$totalEmit)))
lines(x = QUIZ6data_LA$year, y = QUIZ6data_LA$totalEmit, type = "l", col = "black")
legend("topright", legend = c("Baltimore City", "Log Angeles County"),
       col = c("red", "black"), lwd = 1, bty = "n")
dev.off()
