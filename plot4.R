dat                 <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datd                <- dat[dat$Date=="2/2/2007" | dat$Date=="1/2/2007",]
datd_Global         <- datd[!(datd$Global_active_power == "?"),]
Global_Active_Power <- as.numeric(as.character(datd_Global$Global_active_power))
datd_Global_Reac    <- datd[!(datd$Global_reactive_power == "?"),]
Global_Reac_Power   <- as.numeric(as.character(datd_Global$Global_reactive_power))
datd_Voltage        <- datd[!(datd$Voltage == "?"),]
Voltage             <- as.numeric(as.character(datd_Voltage$Voltage))
datd1               <- datd[!(datd$Sub_metering_1 == "?"),]
datd2               <- datd[!(datd$Sub_metering_2 == "?"),]
datd3               <- datd[!(datd$Sub_metering_3 == "?"),]
Sub_Metering1       <- as.numeric(as.character(datd$Sub_metering_1))
Sub_Metering2       <- as.numeric(as.character(datd$Sub_metering_2))
Sub_Metering3       <- as.numeric(as.character(datd$Sub_metering_3))
Date                <- as.Date(as.character(datd$Date),format = "%d/%m/%Y")
Week                <- as.character(weekdays(Date))
png("plot4.png")
par(mfrow=c(2,2))
plot(Global_Active_Power,ylab = "Global Active Power",type = "l",xaxt="n",xlab="")
axis(1, at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
plot(Voltage,ylab = "Voltage",type = "l",xaxt="n",xlab="datetime")
axis(1, at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
plot(Sub_Metering1,ylab = "Energy sub metering",type = "l",xaxt="n",xlab="")
lines(Sub_Metering2,ylab = "Energy sub metering",type = "l",xaxt="n",xlab="",col = "Red")
lines(Sub_Metering3,ylab = "Energy sub metering",type = "l",xaxt="n",xlab="",col = "Blue")
legend("topright",bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col = c("Black","Red","Blue"))
axis(1, at=c(1,1441,2881),labels=c("Thu","Fri","Sat"),lty=1)
plot(Global_Reac_Power,ylab = "Global_reactive_power",type = "l",xaxt="n",xlab="datetime")
axis(1, at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
dev.off()
