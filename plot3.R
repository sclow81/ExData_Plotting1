##Plot 3

data_master <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

names(data_master) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                        "Sub_metering_1","Sub_metering_2","Sub_metering_3")

data_part <- subset(data_master,data_master$Date=="1/2/2007" | data_master$Date =="2/2/2007")

data_part$Date <- as.Date(data_part$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_part$Date), data_part$Time)
data_part$Datetime <- as.POSIXct(datetime)

with(data_part, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))