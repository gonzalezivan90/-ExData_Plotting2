setwd('C:/CP2/')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
library(lattice)

boxplot(Emissions ~ year, data = NEI, outline = F)

plot(NEI$year, NEI$Emissions, ylim = c(0, quantile(NEI$Emissions, 0.95)), 
     ylab = 'Emissions (PM2.5 in tons)', xlab = 'Year', col = 'blue')
abline(linearModel, col = 'red')

text(paste('Intercept:', round(linearModel$coefficients[1], 1)), x = 2006, y = 13)
text(paste('Change each year:', round(linearModel$coefficients[2], 1), 'tons'), x = 2006, y = 12)

dev.copy(png, file="plot2.png", height = 900, width = 900)
dev.off()

summary(NEI)
