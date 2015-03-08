#Reading data
data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
#Subsetting period
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
#Plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(device = png, file = "plot1.png", width = 480, height = 480)
dev.off()