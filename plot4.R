# Chris Kerrigan
# Course 4, Week 1 Assignment
# Plot 4

# Read in the data and make a copy to prevent needing to read in again
setwd("C:/Users/ckerriga/Documents/Coursera")
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- data

# Change the class of the Date variable, subset the data, then create a new DateTime variable
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df2 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
df2$DateTime <- strptime(paste(df2$Date, df2$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

# Create a PNG file
png(file = "plot4.png", height = 480, width = 480)

# Set parameters
par(mfrow = c(2,2))

# Create Top Left Plot. Same as plot 2 from before
with(df2, plot(DateTime, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power"))

# Create Top Right Plot
with(df2, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Create Bottom Left Plot. Same as plot 3 before
with(df2, plot(DateTime, Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering"))
with(df2, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(df2, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(df2, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Create Bottom Right Plot
with(df2, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

# Turn off the graphic device
dev.off()
