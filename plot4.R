##Plot 4

data_master <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

names(data_master) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                        "Sub_metering_1","Sub_metering_2","Sub_metering_3")

data_part <- subset(data_master,data_master$Date=="1/2/2007" | data_master$Date =="2/2/2007")

data_part$Date <- as.Date(data_part$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_part$Date), data_part$Time)
data_part$Datetime <- as.POSIXct(datetime)

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))

with(data_part, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", lty=1, col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.7)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()