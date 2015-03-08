#Reading data
data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
#Subsetting period
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dates <- paste(data$Date, data$Time)
dates <- strptime(dates, "%d/%m/%Y %H:%M:%S")

par(mfrow = c (2,2))
plot(dates, data$Global_active_power, ylab="Global Active Power", xlab="", type="l")
plot(dates, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l")
plot(dates, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")
points(dates, data$Sub_metering_2, col="red", type = "l")
points(dates, data$Sub_metering_3, col="blue", type = "l")
legend("topright",bty = "n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

plot(dates, data$Global_reactive_power, xlab = "datetime", type="l")

dev.copy(device = png, file = "plot4.png", width = 480, height = 480)
dev.off()


