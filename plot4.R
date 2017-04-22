# Coursera
# Peer Graded Assignment: Course Project 1
# Plot 4
# mhess2 2017-04

# Requirements:
# 1. Download the Individual Household Electric Power Consumption dataset and
#    subset the data to only 2007-02-01 and 2007-02-02 data.
# 2. Construct four plots - create a separate R code file and PNG file for each
#    plot (PNG files should be 480px X 480px).
# 3. Upload to Github.

# Step i: Prerequisite script
# Set working directory
setwd(dir = paste0(getwd(), "/4_Coursera/Course 4/Week 1"))

# Step 1: Download the necessary data
# For more information on the data used in this script please check out the
# following URL from the UCI Machine Learning Repository:
# http://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
uci <- paste0(getwd(), "/uci.zip")
download.file(dataUrl, uci)

# Unzip the file
unzip(uci)

# Read in all the data
dat <- read.table(paste0(getwd(), "/household_power_consumption.txt"),
                  header = TRUE, sep = ";", na.strings = "?")

# Convert Date into a date type
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset the data
dat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")

# Step 2: Create Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
# Quadrant 1
plot(as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S"),
     dat$Global_active_power, type = "l", xlab = NA,
     ylab = "Global Active Power")

# Quadrant 2
plot(as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S"),
     dat$Voltage, type = "l", xlab = NA,
     ylab = "Voltage")

# Quadrant 3
plot(as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S"),
     dat$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy Sub Metering")
lines(as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S"),
      dat$Sub_metering_1, col = "black")
lines(as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S"),
      dat$Sub_metering_2, col = "red")
lines(as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S"),
      dat$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
       col = c("black", "red", "blue"), lwd = 1, bty ="o")

# Quadrant 4
plot(as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S"),
     dat$Global_reactive_power, type = "l", xlab = NA,
     ylab = "Global Reactive Power")
dev.off()