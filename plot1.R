# Plotting Assignment 1 for Exploratory Data Analysis
# Plot 1
# Alyssa Weinstein
# --------------------------------------------------

#load required library
library(dplyr)
setwd("/Users/aweinste/8ball/coursera/datasciencecoursera")
epc <- read.table("/Users/aweinste/Downloads/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

#create subset of data for february 1 & 2 of 2007

feb1 <- subset(epc, Date == "1/2/2007")
feb2 <- subset(epc, Date == "2/2/2007")
febObs <- rbind(feb1,feb2)

#create plot1.png of "Global Active Power", x axis = Power in KW y axis = Frequency 
png("plot1.png", width = 480, height = 480)

#whoops, histograms require a numeric input for data -- not character
febObs$Global_active_power <- as.numeric(paste(febObs$Global_active_power))

#now we can make the histogram
hist(febObs$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     main = "Global Active Power",
     col = "red",
     breaks = 24,
     freq = TRUE
     )
dev.off()
