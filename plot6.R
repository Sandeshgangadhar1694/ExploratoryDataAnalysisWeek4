NEI <- readRDS("EDAW4/summarySCC_PM25.rds")
#SCC <- readRDS("EDAW4/Source_Classification_Code.rds")

NEI.Baltimore.LosAngeles <- NEI[NEI$type == "ON-ROAD" & NEI$fips %in% c("24510","06037"),]

library(dplyr)

NEI.Baltimore.LosAngeles <- NEI.Baltimore.LosAngeles %>% group_by(fips,year) %>% summarise("Total Emissions by Motor Vehicle Sources" = sum(Emissions,na.rm = TRUE))
NEI.Baltimore.LosAngeles[NEI.Baltimore.LosAngeles$fips == "24510","fips"] = "Baltimore City"
NEI.Baltimore.LosAngeles[NEI.Baltimore.LosAngeles$fips == "06037","fips"] = "Los Angeles County"
#NEI.Baltimore.LosAngeles$year <- as.factor(NEI.Baltimore.LosAngeles$year)

library(ggplot2)

png("plot6.png")
Comp.plot <- ggplot(NEI.Baltimore.LosAngeles,aes(year,`Total Emissions by Motor Vehicle Sources`,color = fips)) + geom_line() + ggtitle("Comparision between Baltimore City and Los Angeles County for Total Emissions by Motor Vehicle Sources")
print(Comp.plot)
dev.off()
