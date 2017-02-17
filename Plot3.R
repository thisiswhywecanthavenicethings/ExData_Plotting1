# Plotting Assignment 1 for Exploratory Data Analysis
# Plot3
# Alyssa Weinstein
#-------------------------------------------------------
#same as plot 1 & 2 = load everything

#load required library
library(dplyr)
setwd("/Users/aweinste/8ball/coursera/datasciencecoursera")
epc <- read.table("/Users/aweinste/Downloads/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

#create subset of data for february 1 & 2 of 2007

feb1 <- subset(epc, Date == "1/2/2007")
feb2 <- subset(epc, Date == "2/2/2007")
febObs <- rbind(feb1,feb2)

#create plot3.png of "Global Active Power", x axis = Power in KW y axis = Frequency 
png("plot3.png", width = 480, height = 480)

Sub_metering_1 <- as.numeric(paste(febObs$Sub_metering_1))
Sub_metering_2 <- as.numeric(paste(febObs$Sub_metering_2))
Sub_metering_3 <- as.numeric(paste(febObs$Sub_metering_3))

time <- strptime(paste(febObs$Date, febObs$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(time,
     Sub_metering_1,
     type = 'l',
     xlab = "",
     ylab = "Energy sub metering",
     col = "black"
)
lines(time, Sub_metering_2,col = "red")
lines(time, Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1
       )

dev.off()
