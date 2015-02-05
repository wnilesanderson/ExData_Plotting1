# Exploratory Data Analysis -- Project 1
# plot3


datadir <- "."  #assume that the data set is in the working directory -- change if elsewhere
# the NA was represented by ? in the data set, so define that in the call
powerConsumption <- read.table(paste(datadir, "/household_power_consumption.txt", sep = ""), sep = ";", 
                               header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
# subset to the dates wanted for the assignment                  
powerConsumption <- subset(powerConsumption, powerConsumption$Date %in% c("1/2/2007", "2/2/2007"))
powerConsumption$DateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png") # the pixel default is as specified in the assignment
with(powerConsumption, plot(DateTime, Sub_metering_1,  type = "l", main = "", xlab = "", ylab = "Energy sub metering", col = "Black"))
with(powerConsumption, points(DateTime, Sub_metering_2,  type = "l", col = "red"))
with(powerConsumption, points(DateTime, Sub_metering_3,  type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
