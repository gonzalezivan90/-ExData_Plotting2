setwd('C:/OneDrive/RCoursera_specialization/04_ExploratoryDataAnalysis/CP2/')

NEI <- readRDS("summarySCC_PM25.rds")

data <- NEI[NEI$fips == "24510", ] 

linearModel <- lm(Emissions ~ year, data =  data)
plot(data$year, data$Emissions, ylim = c(0, quantile(data$Emissions, 0.95)), 
     ylab = 'Emissions (PM2.5 in tons)', xlab = 'Year', col = 'blue')
abline(linearModel, col = 'red')

text(paste('Intercept:', round(linearModel$coefficients[1], 1)), x = 2006, y = 13)
text(paste('Change each year:', round(linearModel$coefficients[2], 1), 'tons'), x = 2006, y = 12)

legend(x = 2000, y = 14, legend = c('data', 'model'), col = c('blue', 'red'), 
       pch=c('o', '-'))

dev.copy(png, file = "plot2.png", height = 900, width = 900)
dev.off()
