NEI <- readRDS('summarySCC_PM25.rds')

emissions <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')

barplot(height = emissions$Emissions,
	names.arg = emissions$year,
	col = c(2),
        xlab = 'years',
	ylab = expression('total PM2.5 emission (tons)'),
        main = expression('Have total PM2.5 emissions decreased\nin the USA from 1999 to 2008?'))

dev.off()
