#Load the data
path <- getwd()
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = paste(path, "DATA.zip", sep = "/"))
unzip(zipfile = "DATA.zip")
suppressMessages(library(dplyr)) 
suppressMessages(library(ggplot2))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS('Source_Classification_Code.rds')

#Question1: Total emissions from PM2.5 from 1999-2008

QUIZ1data <- group_by(NEI, year) %>% summarise(totalEmit = sum(Emissions))
png('plot1.png', width = 480, height = 480)
plot(x = QUIZ1data$year, y = QUIZ1data$totalEmit, type = "l", xlab = "Year", 
     ylab = "Total PM2.5 Emissions (Tons)", 
     main = "Total PM2.5 Emissions in the US")
dev.off()
