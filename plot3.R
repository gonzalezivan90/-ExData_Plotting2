library(ggplot2)
setwd('C:/CP2/')

NEI <- readRDS("summarySCC_PM25.rds")

data <- NEI[NEI$fips == "24510", ] 
data$type <- as.factor(data$type)

g <- ggplot(data, aes(year, Emissions))
g + geom_point() + facet_grid(. ~ type) + geom_smooth(method = 'lm') + ylim(c(0,  quantile(data$Emissions, 0.95)))

dev.copy(png, file = "plot3.png", height = 900, width = 900)
dev.off()

