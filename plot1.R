# Load data
NEI <- readRDS("summarySCC_PM25.rds")

# Aggregate emissions by year
total_emissions <- aggregate(Emissions ~ year, data = NEI, sum)

# Create PNG
png("plot1.png", width = 480, height = 480)

# Plot
plot(total_emissions$year, total_emissions$Emissions,
     type = "b",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions",
     main = "Total PM2.5 Emissions in US")

# Close device
dev.off()