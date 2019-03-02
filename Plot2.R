power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
housepower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
#PLOT 2
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")
housepower$Time <- strptime(housepower$Time, format="%H:%M:%S")
housepower[1:1440,"Time"] <- format(housepower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
housepower[1441:2880,"Time"] <- format(housepower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# calling the basic plot function
png(file="Plot2.png")
plot(housepower$Time,as.numeric(housepower$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
dev.off()