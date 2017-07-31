NEI <- readRDS("EDAW4/summarySCC_PM25.rds")
SCC <- readRDS("EDAW4/Source_Classification_Code.rds")


#Motor Vehicle Sources are nothing but ON-ROAD type from NEI dataset as clarified from 
#the following website(documentation).
#https://www.epa.gov/air-emissions-inventories/national-emissions-inventory-nei

NEI.MOTOR <- NEI[NEI$type == "ON-ROAD" & NEI$fips == "24510",]

library(dplyr)

NEI.MOTOR <- NEI.MOTOR %>% group_by(year) %>% summarise("Total Emissions from Motor Vehicle Sources" = sum(Emissions,na.rm = TRUE))

library(ggplot2)

png("plot5.png")
Motor.plot <- ggplot(NEI.MOTOR,aes(as.factor(year),`Total Emissions from Motor Vehicle Sources`)) + geom_col() + ggtitle("Total Emissions/year by Motor Vehicle Sources in Baltimore City") + xlab("Year") 
print(Motor.plot)
dev.off()

