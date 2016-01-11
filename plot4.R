data <-read.csv("c:\\temp\\household_power_consumption.txt",sep = ";")
head(data)
d1<- data
d1$Date <- as.Date(d1$Date, format="%d/%m/%Y")
d2 = subset(d1, Date >="2007-02-01" & Date <"2007-02-03")

d2$DateTime <-  as.POSIXct(paste(as.Date(d2$Date), d2$Time))
d2$Global_active_power = as.numeric(d2$Global_active_power)
d2$Voltage = as.numeric(d2$Voltage)
d2$Sub_metering_1 = as.numeric(d2$Sub_metering_1)
d2$Sub_metering_2 = as.numeric(d2$Sub_metering_2)
d2$Sub_metering_3 = as.numeric(d2$Sub_metering_3)
d2$Global_reactive_power = as.numeric(d2$Global_reactive_power)


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(d2, {
      plot(Global_active_power~DateTime,  ylab="Global Active Power (kilowatts)", xlab="")
      plot(Voltage~DateTime, type="l",     ylab="Voltage (volt)", xlab="datetime")
      plot(Sub_metering_1~DateTime, type="l",  ylab="Global Active Power (kilowatts)", xlab="")
      par(type = "l")
      lines(Sub_metering_2~DateTime,col='Red')
      lines(Sub_metering_3~DateTime,col='Blue')
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(Global_reactive_power~DateTime, type="l",   ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

dev.off()