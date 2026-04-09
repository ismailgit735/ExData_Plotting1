data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   dec = ".",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

png("plot2.png", width=480, height=480)

plot(data$Datetime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()