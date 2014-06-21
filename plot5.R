library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')

# chose ON-ROAD to select motor vehicles (cars, buses, motorcycles, etc.)
baltimore_emissions <- aggregate(Emissions ~ year, data = NEI[(NEI$fips == '24510') & (NEI$type == 'ON-ROAD'),], sum)

ggplot(baltimore_emissions, aes(x = factor(year), y = Emissions)) +
    xlab('years') +
    ylab('total PM2.5 emission (tons)') + 
    geom_bar(stat = 'identity', fill = '#FF9999', colour = 'black') +
    ggtitle('How have PM2.5 emissions from motor vehicles changed\nin Baltimore from 1999 to 2008?')

ggsave('plot5.png', width = 8.5)
