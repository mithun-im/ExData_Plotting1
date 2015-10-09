dat                 <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datd                <- dat[dat$Date=="2/2/2007" | dat$Date=="1/2/2007",]
datd1               <- datd[!(datd$Sub_metering_1 == "?"),]
datd2               <- datd[!(datd$Sub_metering_2 == "?"),]
datd3               <- datd[!(datd$Sub_metering_3 == "?"),]
Sub_Metering1       <- as.numeric(as.character(datd$Sub_metering_1))
Sub_Metering2       <- as.numeric(as.character(datd$Sub_metering_2))
Sub_Metering3       <- as.numeric(as.character(datd$Sub_metering_3))
Date                <- as.Date(as.character(datd$Date),format = "%d/%m/%Y")
Week                <- substr(as.character(weekdays(Date)),1,3)
Week[2881]          <- substr(weekdays(as.Date("3/2/2007",format="%d/%m/%Y")),1,3)
png("plot3.png")
plot(Sub_Metering1,ylab = "Energy sub metering",type = "l",xaxt="n",xlab="")
lines(Sub_Metering2,ylab = "Energy sub metering",type = "l",xaxt="n",xlab="",col = "Red")
lines(Sub_Metering3,ylab = "Energy sub metering",type = "l",xaxt="n",xlab="",col = "Blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col = c("Black","Red","Blue"))
label_posn          <- c(1,1441,2881)
axis(1, at=label_posn,labels=Week[label_posn],lty=1)
dev.off()
