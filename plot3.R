NEI <- readRDS("EDAW4/summarySCC_PM25.rds")

NEI.BatimoreCity <- NEI %>% group_by(year,type) %>% filter(fips == "24510") %>% summarise("PM 2.5 total emissions" = sum(Emissions,na.rm = TRUE))

library(ggplot2)

png("plot3.png")
bc <- ggplot(NEI.BatimoreCity,aes(year,`PM 2.5 total emissions`,color = type)) + geom_line() + ggtitle("Total Emissions in Baltimore City by different sources from 1999 to 2008")
print(bc)
dev.off()
