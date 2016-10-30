setwd("C://Project2")
getwd()

SCC_PM25 <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

subsetSCC_PM25  <- SCC_PM25[SCC_PM25$fips=="24510", ]

Sum_by_Year <- aggregate(Emissions ~ year, subsetSCC_PM25, sum)

png('plot2.png')
barplot(height=Sum_by_Year$Emissions, 
        names.arg=Sum_by_Year$year, xlab="Years", 
        ylab=expression('Total of PM'[2.5]*' Emission'),
        main=expression('Total of PM'[2.5]*' in Baltimore City'))
dev.off()