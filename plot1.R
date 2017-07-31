NEI <- readRDS("EDAW4/summarySCC_PM25.rds")

library(dplyr)

NEI.aggregated <- NEI %>% group_by(year) %>% summarise(Total.Emmissions = sum(Emissions,na.rm = TRUE))

png("plot1.png")
plot(NEI.aggregated$year,NEI.aggregated$Total.Emmissions,type = "l",xlab = "Year",ylab = "PM 2.5 Emissions(in Tons)",col = "blue" ,main = "Total PM 2.5 emissions/year in tons")
dev.off()
