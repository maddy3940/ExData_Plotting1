url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path<-getwd()
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

library(data.table)
library(lubridate)
data<-fread("household_power_consumption.txt",na.strings="?")
View(data)
data$Date<-dmy(data$Date)
d1<-ymd("2007-02-01")
d2<-ymd("2007-02-02")
sub_data<-subset(data,(Date >= "2007-02-01") & (Date <= "2007-02-02"))


png("plot1.png", width=480, height=480)

hist(sub_data$Global_active_power,col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()







