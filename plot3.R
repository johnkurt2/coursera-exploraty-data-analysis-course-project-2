plot3 <- function () {
  library(ggplot2)
  ## This first line will likely take a few seconds. Be patient!
  setwd("C:/Users/jnie0441/Desktop/air data/exdata_data_NEI_data")
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  bal<-subset(NEI,fips=="24510")
  aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, bal, sum)
  png("plot3.png", width=640, height=480)
  g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
  g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
  print(g)
  dev.off()
}