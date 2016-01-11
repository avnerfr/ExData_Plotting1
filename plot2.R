data <-read.csv("c:\\temp\\household_power_consumption.txt",sep = ";")
head(data)
d1<- data
d1$Date <- as.Date(d1$Date, format="%d/%m/%Y")
d2 = subset(d1, Date >="2007-02-01" & Date <"2007-02-03")

d2$DateTime <-  as.POSIXct(paste(as.Date(d2$Date), d2$Time))
    
d2$Global_active_power = as.numeric(d2$Global_active_power)

png("plot2.png", width=480, height=480)
plot(d2$Global_active_power~d2$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()