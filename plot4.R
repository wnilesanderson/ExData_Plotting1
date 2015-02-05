# Exploratory Data Analysis -- Project 1
# plot4


datadir <- "."  #assume that the data set is in the working directory -- change if elsewhere
# the NA was represented by ? in the data set, so define that in the call
powerConsumption <- read.table(paste(datadir, "/household_power_consumption.txt", sep = ""), sep = ";", 
                               header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
# subset to the dates wanted for the assignment                  
powerConsumption <- subset(powerConsumption, powerConsumption$Date %in% c("1/2/2007", "2/2/2007"))
powerConsumption$DateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png") # the pixel default is as specified in the assignment
.pardefault <- par(no.readonly = T) # grab the defaults for resetting -- no harm if we don't want to reset
par(mfrow = c(2, 2))
# position 1, 1
with(powerConsumption, plot(DateTime, Global_active_power, type = "l",  main = "", xlab = "", ylab = "Global Active Power"))
# position 1, 2
with(powerConsumption, plot(DateTime, Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage"))
# position 2, 1
with(powerConsumption, plot(DateTime, Sub_metering_1,  type = "l", main = "", xlab = "", ylab = "Energy sub metering", col = "Black"))
with(powerConsumption, points(DateTime, Sub_metering_2,  type = "l", col = "red"))
with(powerConsumption, points(DateTime, Sub_metering_3,  type = "l", col = "blue"))
# the legend was a tad too big, so resize it
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.95, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
# position 2, 2
with(powerConsumption, plot(DateTime, Global_reactive_power, type = "l",  main = "", xlab = "datetime"))
dev.off()
par(.pardefault) # reset graphics parameters
