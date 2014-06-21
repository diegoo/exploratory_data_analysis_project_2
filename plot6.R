library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_emissions <- aggregate(Emissions ~ year, data = NEI[(NEI$fips == '24510') & (NEI$type == 'ON-ROAD'),], sum)
baltimore_emissions$Location <- "Baltimore City"

losangeles_emissions <- aggregate(Emissions ~ year, data = NEI[(NEI$fips == '06037') & (NEI$type == 'ON-ROAD'),], sum)
losangeles_emissions$Location <- "Los Angeles County"

total <- rbind(baltimore_emissions, losangeles_emissions)

ggplot(total, aes(x = factor(year), y = Emissions, fill = Location)) +
    xlab('years') +
    ylab('total PM2.5 emission (tons)') + 
    geom_bar(stat = 'identity') +
    facet_grid(. ~ Location, scales = 'free') +
    ggtitle('Which city has seen more change\nin motor vehicle emissions\nfrom 1999 to 2008:\nBaltimore or LA?')

ggsave('plot6.png')

