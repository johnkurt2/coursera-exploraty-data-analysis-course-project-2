plot5 <- function () {
  library(ggplot2)
  ## This first line will likely take a few seconds. Be patient!
  setwd("C:/Users/jnie0441/Desktop/air data/exdata_data_NEI_data")
  if (!exists("NEI")) {
    NEI <- readRDS("summarySCC_PM25.rds")
  }
  if (!exists("SCC")) {
    SCC <- readRDS("Source_Classification_Code.rds")
  }
  if(!exists("NEISCC")) { 
    NEISCC <- merge(NEI, SCC, by="SCC") 
  } 
  subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
  aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
  png("plot5.png", width=840, height=480)
  g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
  g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
  print(g)
  dev.off()
}