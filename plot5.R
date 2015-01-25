setwd('C:/CP2/')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mobile <- SCC[grep('Mobile - ', SCC$EI.Sector), ]

data <- NEI[NEI$SCC %in% mobile$SCC & NEI$fips == "24510", ]

linearModel <- lm(Emissions ~ year, data =  data)

plot(data$year, data$Emissions, ylab = 'Emissions (PM2.5 in tons)', xlab = 'Year', col = 'blue')
abline(linearModel, col = 'red')

text(paste('Intercept:', round(linearModel$coefficients[1], 1)), x = 2006, y = 350)
text(paste('Change each year:', round(linearModel$coefficients[2], 1), 'tons'), x = 2006, y = 320)

legend(x = 2000, y = 300, legend = c('data', 'model'), col = c('blue', 'red'), 
       pch=c('o', '-'))

dev.copy(png, file = "plot5.png", height = 900, width = 900)
dev.off()