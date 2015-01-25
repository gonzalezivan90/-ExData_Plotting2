library(ggplot2)
setwd('C:/CP2/')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mobile <- SCC[grep('Mobile - ', SCC$EI.Sector), ]

data <- NEI[NEI$SCC %in% mobile$SCC & (NEI$fips == "24510" | NEI$fips == "06037"), ]
data$fips <- as.factor(data$fips)
levels(data$fips) <- c('Los Angeles', 'Baltimore')

g <- ggplot(data, aes(year, Emissions))
g + geom_point() + facet_grid(. ~ fips) + geom_smooth(method = 'lm')

dev.copy(png, file = "plot6.png", height = 900, width = 900)
dev.off()