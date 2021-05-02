
emissionsdata <- readRDS("summarySCC_PM25.rds")
classificationdata <- readRDS("Source_Classification_Code.rds")


baltimoredata <- subset(emissionsdata, emissionsdata$fips=="24510")
baltimoredata_year <- aggregate(baltimoredata$Emissions, by=list(baltimoredata$year), 
                                 FUN=sum)
## creating plot
png(filename = "plot2.png")
plot(baltimoredata_year$Group.1, baltimoredata_year$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", 
     ylab = "Total Emissions (tons)")
dev.off()