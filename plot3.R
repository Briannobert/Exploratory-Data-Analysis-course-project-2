unzip(zipfile = "data.zip")
suppressMessages(library(dplyr)) 
suppressMessages(library(ggplot2))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS('Source_Classification_Code.rds')

#Question3: Sources of PM2.5 emissions in Baltimore City from 1999-2008

QUIZ3data <- filter(NEI, fips == "24510") %>% group_by(year, type) %>% 
  summarise(totalEmit = sum(Emissions))

png('plot3.png', width = 480, height = 480)
ggplot(data = QUIZ3data, aes(x = year, y = totalEmit, color = type)) +
  geom_line() +
  labs(title = "Total PM2.5 Emissions in Baltimore City from 
             Various Sources",
       x = "Year", y = "Total PM2.5 emissions (Tons)")
dev.off()
