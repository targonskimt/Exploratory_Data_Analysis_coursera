#reading the data
#change the dir accordingly first
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)
#subset the data for only 2007-02-01 and 2007-02-02
myData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007") ,]

#desired variable global active power 
myGlobalActivePower <- as.numeric(myData$Global_active_power)

#plot the graph --> global activite power vs frequency
hist(myGlobalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#create the PNG file 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()