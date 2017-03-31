plot6 <- function () {
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
  # Get the emissions from motor vehicle sources (type = ON-ROAD) in Baltimore City (fips code: '24510') and Los Angeles (fips code: '06037') 
  city.NEI <- NEI[NEI$type == 'ON-ROAD' & NEI$fips %in% c('24510', '06037'), ] 
  totalpryear <- aggregate(Emissions ~ year+fips, city.NEI, sum)
  totalpryear$city = totalpryear$fips
  totalpryear[which(totalpryear$fips == '24510'), 'city'] = 'Baltimore City'
  totalpryear[which(totalpryear$fips == '06037'), 'city'] = 'Los Angeles'
  png(filename='plot6.png', width=640, height=480, units='px')
  plot6 <- qplot(year, Emissions, data=totalpryear, facets = . ~ fips) + 
    geom_line() +
    xlab("Year") +
    ylab('PM2.5 Emissions (tons)') +
    ggtitle('Total PM2.5 Emissions in Los Angeles (06037) and Baltimore City (24510)')
  print(plot6)
  dev.off()
  
}