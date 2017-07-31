NEI <- readRDS("EDAW4/summarySCC_PM25.rds")
SCC <- readRDS("EDAW4/Source_Classification_Code.rds")

Coal <- grepl("[Cc]oal",SCC$Short.Name)

Coal.SCC <- as.character(unique(SCC[Coal,c("SCC")]))

NEI.Coal <- NEI[NEI$SCC %in% Coal.SCC,]

library(dplyr)

NEI.Coal <- NEI.Coal %>% group_by(year) %>% summarise("Total Emissions by Coal Sources" = sum(Emissions,na.rm = TRUE))

library(ggplot2)

png("plot4.png")
Coal.plot <- ggplot(NEI.Coal,aes(as.factor(year),`Total Emissions by Coal Sources`)) + geom_col() + ggtitle("Emissions from coal combustion-related sources, across United States") + xlab("Year")
print(Coal.plot)
dev.off()







