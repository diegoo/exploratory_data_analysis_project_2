library(ggplot2)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# perusing the forums, came to prefer this criterion over the alternative: grepl('Comb.* Coal', SCC$EI.Sector),]
coal_sources <- SCC[grep("Comb.*Coal|Coal.*Comb", SCC$Short.Name, ignore.case = FALSE),]  

emissions <- aggregate(Emissions ~ year, data = NEI[(NEI$SCC %in% coal_sources$SCC),], sum)

ggplot(emissions, aes(x = factor(year), y = Emissions)) +
    xlab('years') +
    ylab('total PM2.5 emission (tons)') + 
    geom_bar(stat = 'identity', fill = '#FF9999', colour = 'black') +
    ggtitle('How have PM2.5 emissions from coal sources changed\nin the USA from 1999 to 2008?')

ggsave('plot4.png')
