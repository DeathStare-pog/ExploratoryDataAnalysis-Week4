

emissionsdata <- readRDS("summarySCC_PM25.rds")
classificationdata <- readRDS("Source_Classification_Code.rds")


balt_data <- subset(emissionsdata, emissionsdata$fips=="24510" |
                            emissionsdata$fips=="06037" &
                            emissionsdata$type=="ON-ROAD")
balt_cyear <- aggregate(balt_data$Emissions, 
                             by=list(balt_data$fips, balt_data$year),
                             FUN=sum)
colnames(balt_cyear) <- c("City", "Year", "Emissions")


library(ggplot2)
png(filename = "plot6.png")
qplot(Year, Emissions, data = balt_cyear, color = City, geom = "line") +
  ggtitle("Emissions of PM2.5 in Baltimore (24510) and LA (06037)") + 
  ylab("Total Emissions from motor vehicles (tons)") + 
  xlab("Year") 
dev.off()