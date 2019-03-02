power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
housepower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#PLOT 1
#calling the basic plot function
png(file="Plot1.png")
hist(as.numeric(housepower$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")
dev.off()