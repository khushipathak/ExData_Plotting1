## R script to produce Plot 4
# Author: Khushi Pathak

#Loading and reading the dataset
powerdata <- data.table::fread(input = "household_power_consumption.txt"
                               ,na.strings="?")

# Making a POSIXct date capable of being filtered and graphed by time of day
powerdata$DateTime = as.POSIXct(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")

#Subsetting powerdata to get the required dates
powerdata <- subset(powerdata, ((DateTime >= "2007-02-01") & (DateTime <= "2007-02-02 23:59:59")))


#Starting the PNG grDevice
png("Plot4.png", width=480, height=480)

#Arranging the layout for 4 graphs
par(mfrow=c(2,2))

#Plotting the histogram (type "l" for lines)
plot(x = powerdata$DateTime
     , y = powerdata$Global_active_power
     , type="l", xlab="", ylab="Global Active Power")

plot(x = powerdata$DateTime
     , y = powerdata$Voltage
     , type="l", xlab="datetime", ylab="Voltage")


plot(x = powerdata$DateTime
     , y = powerdata$Sub_metering_1
     , type="n", xlab = "",ylab="Energy sub metering")

lines(powerdata[, DateTime], powerdata[, Sub_metering_1])
lines(powerdata[, DateTime], powerdata[, Sub_metering_2],col="red")
lines(powerdata[, DateTime], powerdata[, Sub_metering_3],col="blue")

plot(x = powerdata$DateTime
     , y = powerdata$Global_reactive_power
     , type="l", xlab="datetime", ylab="Global Reactive Power")

#Closing the device
dev.off()