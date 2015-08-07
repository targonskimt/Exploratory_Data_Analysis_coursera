#reading the data
#change the dir accordingly first
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)
#subset the data for only 2007-02-01 and 2007-02-02
myData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the date to desired format 
myDateTime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#desired variable global active power 
myGlobalActivePower <- as.numeric(myData$Global_active_power)

#plot global active power vs date/time
plot(myDateTime, myGlobalActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#create the PNG file 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()