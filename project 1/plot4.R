#reading the data
#change the dir accordingly first
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)
#subset the data for only 2007-02-01 and 2007-02-02
myData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the date to desired format 
myDateTime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#global active power 
myGlobalActivePower <- as.numeric(myData$Global_active_power)

#obtain the three sub meterings
sub_metering_1 <- as.numeric(myData$Sub_metering_1)
sub_metering_2 <- as.numeric(myData$Sub_metering_2)
sub_metering_3 <- as.numeric(myData$Sub_metering_3)

#global reactive power 
myGlobalReactivePower <- as.numeric(myData$Global_reactive_power)

#voltage
myVoltage <- as.numeric(myData$Voltage)

#set 2 by 2 plot area
par(mfrow = c(2, 2)) 

#top left, global active power vs datetime
plot(myDateTime, myGlobalActivePower, type="l", xlab="", ylab="Global Active Power")

#top right, voltage vs datetime
plot(myDateTime, myVoltage, type="l", xlab="datetime", ylab="Voltage")

#bottom left, global active power vs sub_metering_1
plot(myDateTime, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
	#add sub_metering_2
	lines(myDateTime, sub_metering_2, type="l", col="red")
	#add sub_metering_3
	lines(myDateTime, sub_metering_3, type="l", col="blue")
	#add the legend 
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

#bottom right, global active power vs datetime
plot(myDateTime, myGlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#create the PNG file 
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()