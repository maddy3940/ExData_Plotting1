library(data.table)
library(lubridate)
data<-fread("household_power_consumption.txt",na.strings="?")

data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data$Date<-dmy(data$Date)
sub_data<-subset(data,(Date >= "2007-02-01") & (Date <= "2007-02-02"))



png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(sub_data,plot(dateTime,Global_active_power,xlab="",ylab="Global Active Power",type="l"))

with(sub_data,plot(dateTime,Voltage,xlab="datetime",ylab="Voltage",type="l"))

plot(sub_data[, dateTime], sub_data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(sub_data[, dateTime], sub_data[, Sub_metering_2],col="red")
lines(sub_data[, dateTime], sub_data[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

with(sub_data,plot(dateTime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l"))


dev.off()
