data <-read.csv("c:\\temp\\household_power_consumption.txt",sep = ";")
d1<- data
d1$Date = as.Date(strptime(d1$Date,format = "%d/%m/%Y"))
d2 = subset(d1, Date >="2007-02-01" & Date <"2007-02-03")
d2$Global_active_power = as.numeric(d2$Global_active_power)

png("plot1.png", width=480, height=480)
with(d2, hist(x = Global_active_power/1000.0,col ="red",main = "Global Active Power", xlab = "Global Active Power (kilowats)"))
dev.off()

