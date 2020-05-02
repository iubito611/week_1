dat<-read.table("household_power_consumption.txt",nrow=200000,sep=";",header=TRUE)
png(file="plot4.png",width = 480,height = 480,units="px")
##subSetData<-dat[dat$Date %in% c("1/2/2007","2/2/2007"), ]
par(mfrow=c(2,2))
subSetData<-with (dat,subset(dat,Date=="1/2/2007"|Date=="2/2/2007"))
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
voltage <- as.numeric(subSetData$Voltage)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

globalActivePower1 <- as.numeric(subSetData$Sub_metering_1)
globalActivePower2 <- as.numeric(subSetData$Sub_metering_2)
globalActivePower3 <- as.numeric(subSetData$Sub_metering_3)
##d<-density(dat$Global_active_power)
plot(datetime,globalActivePower1, type="l", xlab="", ylab="Energy Submetering",col="black")
lines(datetime,globalActivePower2, type="l",col="red")
lines(datetime,globalActivePower3, type="l",col="blue")
legend("topright",legend=c("sub_meeting_1","sub_meeting_2","sub_meeting_3"),col=c("black","red","blue"),lty=1)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()