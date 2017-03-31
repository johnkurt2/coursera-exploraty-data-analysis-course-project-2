plot1 <- function () {
  ## This first line will likely take a few seconds. Be patient!
  setwd("C:/Users/jnie0441/Desktop/air data/exdata_data_NEI_data")
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  year<-unique(NEI$year)
  emission<-tapply(NEI$Emissions,NEI$year,FUN=sum)
  png(filename="plot1.png")
  plot(year,emission,main="Total Emission 1999-2008")
  dev.off()
  return(y)
}