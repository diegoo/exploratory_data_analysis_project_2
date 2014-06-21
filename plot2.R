NEI <- readRDS('summarySCC_PM25.rds')

baltimore_emissions <- aggregate(Emissions ~ year, NEI[NEI$fips == '24510',], sum)

png('plot2.png')

barplot(height = baltimore_emissions$Emissions,
	names.arg = baltimore_emissions$year,
	col = c(2),
        xlab = 'years',
	ylab = expression('total PM2.5 emission (tons)'),
        main = expression('Have total PM2.5 emissions decreased\nin Baltimore from 1999 to 2008?'))

dev.off()
