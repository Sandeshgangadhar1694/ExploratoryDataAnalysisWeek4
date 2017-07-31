NEI <- readRDS("EDAW4/summarySCC_PM25.rds")
#SCC <- readRDS("EDAW4/Source_Classification_Code.rds")

library(dplyr)

NEI.BatimoreCity <- NEI %>% group_by(year) %>% filter(fips == "24510") %>% summarise("PM 2.5 total emissions" = sum(Emissions,na.rm = TRUE))

png("plot2.png")
plot(NEI.BatimoreCity,type = "l",col = "blue",main = "Total PM2.5 emissions/year for Baltimore City")
dev.off()