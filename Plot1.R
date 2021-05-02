## Plot 1: 

## read data
emissionsdata <- readRDS("summarySCC_PM25.rds")
classificationcode <- readRDS("Source_Classification_Code.rds")


sum_yearwise <- aggregate(emissionsdata$Emissions, by=list(year=emissionsdata$year), FUN=sum)

## creating the plot
png(filename = "plot1.png")
plot(sum_yearwise$year, sum_yearwise$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()