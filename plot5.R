setwd("C://Project2")
getwd()
library(ggplot2)

SCC_PM25 <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
Merge_data <- merge(SCC_PM25, SCC, by="SCC")

subsetSCC_PM25 <- SCC_PM25[SCC_PM25$fips=="24510" & SCC_PM25$type=="ON-ROAD",  ]

Sum_by_Year <- aggregate(Emissions ~ year, subsetSCC_PM25, sum)

png("plot5.png", width=840, height=480)
PlotSetup <- ggplot(Sum_by_Year, aes(factor(year), Emissions))
PlotSetup <- PlotSetup + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total of PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Vehicles in Baltimore City between 1999 to 2008')
print(PlotSetup)
dev.off()
