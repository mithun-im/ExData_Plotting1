dat <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datd <- dat[dat$Date=="2/2/2007" | dat$Date=="1/2/2007",]
datd_ <- datd[!(datd$Global_active_power == "?"),]
Global_Active_Power <- as.numeric(as.character(datd_$Global_active_power))
hist(Global_Active_Power,col = "Red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png,file = "plot1.png")
dev.off()