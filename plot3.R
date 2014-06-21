library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')

baltimore_emissions <- aggregate(Emissions ~ year + type, NEI[NEI$fips == '24510',], sum)
    
baltimore_emissions_graph <- ggplot(baltimore_emissions, aes(x = factor(year), y = Emissions, fill = type)) +
    xlab('years') +
    ylab('total PM2.5 emission (tons)') + 
    facet_grid(. ~ type) +
    geom_bar(stat = 'identity') +
    ggtitle('Have total PM2.5 emissions decreased\nin Baltimore from 1999 to 2008?')

ggsave('plot3.png', baltimore_emissions_graph, height = 8.5, width = 8.5)

