setwd('C:/CP2/')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- apply(SCC, 2, function(x){
  grep(' coal |^coal | coal$', tolower(as.character(x)))
})

coalSCC <- SCC[unique(unlist(coal)), ]
data <- NEI[NEI$SCC %in% coalSCC$SCC, ]

linearModel <- lm(Emissions ~ year, data =  data)

plot(data$year, data$Emissions, ylab = 'Emissions (PM2.5 in tons)', xlab = 'Year', col = 'blue')
abline(linearModel, col = 'red')

text(paste('Intercept:', round(linearModel$coefficients[1], 1)), x = 2006, y = 14000)
text(paste('Change each year:', round(linearModel$coefficients[2], 1), 'tons'), x = 2006, y = 13000)
legend(x = 2000, y = 14000, legend = c('data', 'model'), col = c('blue', 'red'), 
       pch=c('o', '-'))

dev.copy(png, file = "plot4.png", height = 900, width = 900)
dev.off()