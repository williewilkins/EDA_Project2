setwd("C://Project2")
getwd()

SCC_PM25 <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

Sum_by_year <- aggregate(Emissions ~ year, SCC_PM25, sum)

png('plot1.png')
barplot(height=Sum_by_year$Emissions, 
        names.arg=Sum_by_year$year, xlab="Years", 
        ylab=expression('Total of PM'[2.5]*' Emission'),
        main=expression('Total of PM'[2.5]*' Emissions at specified years'))
dev.off()
