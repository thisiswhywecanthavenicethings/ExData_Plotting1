# Plotting Assignment 1 for Exploratory Data Analysis
# Plot2
# Alyssa Weinstein
#-------------------------------------------------------
#same as plot 1 = load everything

#load required library
library(dplyr)
setwd("/Users/aweinste/8ball/coursera/datasciencecoursera")
epc <- read.table("/Users/aweinste/Downloads/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

#create subset of data for february 1 & 2 of 2007

feb1 <- subset(epc, Date == "1/2/2007")
feb2 <- subset(epc, Date == "2/2/2007")
febObs <- rbind(feb1,feb2)

#create plot2.png of "Global Active Power", x axis = Power in KW y axis = Frequency 
png("plot2.png", width = 480, height = 480)

#whoops, line plots require a numeric input for data -- not character (for both active power AND time/date)
febObs$Global_active_power <- as.numeric(paste(febObs$Global_active_power))
time <- strptime(paste(febObs$Date, febObs$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(time,
     febObs$Global_active_power,
     type = 'l',
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     lwd = "0.25"
     )
dev.off()

