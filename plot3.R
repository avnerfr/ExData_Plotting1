data <-read.csv("c:\\temp\\household_power_consumption.txt",sep = ";")
head(d2)
d1<- data
d1$Date <- as.Date(d1$Date, format="%d/%m/%Y")
d2 = subset(d1, Date >="2007-02-01" & Date <"2007-02-03")

d2$DateTime <-  as.POSIXct(paste(as.Date(d2$Date), d2$Time))
d2$Sub_metering_1 = as.numeric(d2$Sub_metering_1)
d2$Sub_metering_2 = as.numeric(d2$Sub_metering_2)
d2$Sub_metering_3 = as.numeric(d2$Sub_metering_3)


png("plot3.png", width=480, height=480)

with(d2, {
      plot(Sub_metering_1~DateTime,type = "l",ylab="Global Active Power (kilowatts)", xlab="")
      lines(Sub_metering_2~DateTime,type = "l",col='Red')
      lines(Sub_metering_3~DateTime,type = "l",col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()