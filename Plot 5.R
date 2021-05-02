

emissionsdata <- readRDS("summarySCC_PM25.rds")
classificationdata <- readRDS("Source_Classification_Code.rds")


baltimore_cdata <- subset(emissionsdata, emissionsdata$fips=="24510" 
                             & emissionsdata$type=="ON-ROAD")
baltimore_cyear <- aggregate(baltimore_cdata$Emissions, 
                                by=list(baltimore_cdata$year), FUN=sum)
colnames(baltimore_cyear) <- c("Year", "Emissions")


png(filename = "plot5.png")
plot(baltimore_cyear$Year, baltimore_cyear$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
dev.off()

