

emissionsdata <- readRDS("summarySCC_PM25.rds")
classificationdata <- readRDS("Source_Classification_Code.rds")

## subset to just data from Baltimore and sum up emissions by variable "type"
baltimored <- subset(emissionsdata, emissionsdata$fips=="24510")
baltimore_type_year <- aggregate(baltimored$Emissions, 
                                 by=list(baltimored$type, baltimored$year), 
                                 FUN=sum)
colnames(baltimore_type_year) <- c("Type", "Year", "Emissions")


library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = baltimore_type_year, color = Type, geom = "line") + ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + ylab("Total Emissions (tons)") + 
                xlab("Year") 
dev.off()
