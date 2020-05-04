## R script to produce Plot 1
# Author: Khushi Pathak

#Loading and reading the dataset
powerdata <- data.table::fread(input = "household_power_consumption.txt"
                              ,na.strings="?")

#Converting the date variables into date type format
powerdata$Date <- lapply(powerdata$Date,  as.Date, "%d/%m/%Y")

#Subsetting powerdata to get the required dates
powerdata <- subset(powerdata, ((Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02"))))

#Starting the PNG grDevice
png("Plot1.png", width=480, height=480)

#Plotting the histogram
hist(powerdata$Global_active_power,
     col = 'red',
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Closing the device
dev.off()