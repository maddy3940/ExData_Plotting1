library(data.table)
library(lubridate)
data<-fread("household_power_consumption.txt",na.strings="?")

data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data$Date<-dmy(data$Date)
sub_data<-subset(data,(Date >= "2007-02-01") & (Date <= "2007-02-02"))


png("plot3.png", width=480, height=480)

plot(sub_data[, dateTime], sub_data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(sub_data[, dateTime], sub_data[, Sub_metering_2],col="red")
lines(sub_data[, dateTime], sub_data[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

