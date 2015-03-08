#Reading data
data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
#Subsetting period
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dates <- paste(data$Date, data$Time)
dates <- strptime(dates, "%d/%m/%Y %H:%M:%S")
#Plot
plot(dates, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.copy(device = png, file = "plot2.png", width = 480, height = 480)
dev.off()