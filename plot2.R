## Plot2.R
## Coursera - Exploratory Data Analysis
## Course Project 1 - Renato Deggau - rdeggau - July 2015

## to display the weekdays in English
Sys.setlocale("LC_TIME", "English")

## Read the files in txt format
power  = read.table("../../dados/household_power_consumption.txt", sep=";",
                    header=TRUE, na.strings="?", stringsAsFactors = FALSE)

# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

## Subsetting the data for date between 2007-02-01 and 2007-02-02.
powerdata = power[power$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## Create the graphic
png("plot2.png", width=480, height=480)
plot(datetime, powerdata$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()

