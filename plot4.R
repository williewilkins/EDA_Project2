setwd("C://Project2")
getwd()
library(ggplot2)

SCC_PM25 <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
Merge_data <- merge(SCC_PM25, SCC, by="SCC")

Match_Coal  <- grepl("coal", Merge_data$Short.Name, ignore.case=TRUE)
subsetMerge_data <- Merge_data[Match_Coal, ]

Sum_by_Year <- aggregate(Emissions ~ year, subsetMerge_data, sum)

png("plot4.png", width=640, height=480)
PlotSetup <- ggplot(Sum_by_Year, aes(factor(year), Emissions))
PlotSetup <- PlotSetup + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total of PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Coal between 1999 to 2008')
print(PlotSetup)
dev.off()
