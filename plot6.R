setwd("C://Project2")
getwd()
library(ggplot2)

SCC_PM25 <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
Merge_data <- merge(SCC_PM25, SCC, by="SCC")

subsetSCC_PM25 <- SCC_PM25[(SCC_PM25$fips=="24510"|SCC_PM25$fips=="06037") & SCC_PM25$type=="ON-ROAD", ]

Sum_by_Year_Fips <- aggregate(Emissions ~ year + fips, subsetSCC_PM25, sum)
Sum_by_Year_Fips$fips[Sum_by_Year_Fips$fips=="24510"] <- "Baltimore, MD"
Sum_by_Year_Fips$fips[Sum_by_Year_Fips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
PlotSetup <- ggplot(Sum_by_Year_Fips, aes(factor(year), Emissions))
PlotSetup <- PlotSetup + facet_grid(. ~ fips)
PlotSetup <- PlotSetup + geom_bar(stat="identity")  +
  xlab("Year") +
  ylab(expression('Total of PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Vehicle in Baltimore City vs Los Angeles between 1999 to 2008')
print(PlotSetup)
dev.off()
