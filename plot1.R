# Chris Kerrigan
# Course 4, Week 1 Assignment
# Plot 1

# Read in the data and make a copy to prevent needing to read in again
setwd("C:/Users/ckerriga/Documents/Coursera")
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df <- data

# Change the class of the Date and Time variables, then subset the data
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S")
df2 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

# Create a PNG file
png(file = "plot1.png", height = 480, width = 480)

# Create Plot 1
hist(df2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Turn off the graphic device
dev.off()
