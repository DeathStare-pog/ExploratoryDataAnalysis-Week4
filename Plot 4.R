

emissionsdata <- readRDS("summarySCC_PM25.rds")
classificationcode <- readRDS("Source_Classification_Code.rds")


coal_classificationcode <- classificationcode[grepl("Coal", classificationcode$Short.Name), ]
coaldata <- emissionsdata[emissionsdata$SCC %in% coal_classificationcode$SCC, ]


coal_emissions_year <- aggregate(coaldata$Emissions, 
                                 by=list(coaldata$year), FUN=sum)
colnames(coal_emissions_year) <- c("year", "emissions")


png(filename = "plot4.png")
plot(coal_emissions_year$year, coal_emissions_year$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()
