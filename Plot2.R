## R script to produce Plot 2
# Author: Khushi Pathak

#Loading and reading the dataset
powerdata <- data.table::fread(input = "household_power_consumption.txt"
                               ,na.strings="?")

# Making a POSIXct date capable of being filtered and graphed by time of day
powerdata$DateTime = as.POSIXct(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")

#Subsetting powerdata to get the required dates
powerdata <- subset(powerdata, ((DateTime >= "2007-02-01") & (DateTime <= "2007-02-02 23:59:59")))


#Starting the PNG grDevice
png("Plot2.png", width=480, height=480)

#Plotting the histogram (type "l" for lines)
plot(x = powerdata$DateTime
     , y = powerdata$Global_active_power
     , type="l", ylab="Global Active Power (kilowatts)")

#Closing the device
dev.off()