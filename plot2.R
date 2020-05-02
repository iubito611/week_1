dat<-read.table("household_power_consumption.txt",nrow=200000,sep=";",header=TRUE)
png(file="plot2.png",width = 480,height = 480,units="px")

subSetData<-dat[dat$Date %in% c("1/2/2007","2/2/2007"), ]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
##d<-density(dat$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()