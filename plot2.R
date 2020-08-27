library(data.table)
library(lubridate)
data<-fread("household_power_consumption.txt",na.strings="?")
View(data)

data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data$Date<-dmy(data$Date)
sub_data<-subset(data,(Date >= "2007-02-01") & (Date <= "2007-02-02"))


png("plot2.png", width=480, height=480)

plot(x = sub_data[, dateTime]
     , y = sub_data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
