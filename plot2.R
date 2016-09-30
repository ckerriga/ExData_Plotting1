# Chris Kerrigan
# Course 4, Week 1 Assignment
# Plot 2

# Read in the data and make a copy to prevent needing to read in again
setwd("C:/Users/ckerriga/Documents/Coursera")
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- data

# Change the class of the Date variable, subset the data, then create a new DateTime variable
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df2 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
df2$DateTime <- strptime(paste(df2$Date, df2$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

# Create a PNG file
png(file = "plot2.png", height = 480, width = 480)

# Create Plot 2
with(df2, plot(DateTime, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))

# Turn off the graphic device
dev.off()
