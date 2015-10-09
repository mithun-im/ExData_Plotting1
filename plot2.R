dat                 <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datd                <- dat[dat$Date=="2/2/2007" | dat$Date=="1/2/2007",]
atd_                <- datd[!(datd$Global_active_power == "?"),]
Global_Active_Power <- as.numeric(as.character(datd_$Global_active_power))
Date                <- as.Date(as.character(datd$Date),format = "%d/%m/%Y")
Week                <- substr(as.character(weekdays(Date)),1,3)
plot(Global_Active_Power,ylab = "Global Active Power (kilowatts)",type = "l",xaxt="n",xlab="")
axis(1, at=c(1,1441,2881),labels=c(Week[1],Week[1441],"Sat"))
#dev.copy(png,file = "plot2.png")
#dev.off()