setwd("C://Project2")
getwd()
library(ggplot2)

SCC_PM25 <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

subsetSCC_PM25  <- SCC_PM25[SCC_PM25$fips=="24510", ]

Sum_Year_Type <- aggregate(Emissions ~ year + type, subsetSCC_PM25, sum)

png("plot3.png", width=640, height=480)
PlotSetup <- ggplot(Sum_Year_Type, aes(year, Emissions, color = type))

PlotSetup <- PlotSetup + geom_line() +
  xlab("Years") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(PlotSetup)
dev.off()
