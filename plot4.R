data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   dec = ".",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(data$Datetime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(data$Datetime, data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

plot(data$Datetime, data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n")

plot(data$Datetime, data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()