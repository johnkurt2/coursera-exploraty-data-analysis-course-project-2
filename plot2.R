plot2 <- function () {
  ## This first line will likely take a few seconds. Be patient!
  setwd("C:/Users/jnie0441/Desktop/air data/exdata_data_NEI_data")
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  bal<-subset(NEI,fips=="24510")
  year<-unique(bal$year)
  emission<-tapply(bal$Emissions,bal$year,FUN=sum)
  png(filename="plot2.png")
  plot(year,emission,main="Baltimore City Emission 1999-2008")
  dev.off()
  return(NEI)
}