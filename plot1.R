setwd('C:/Users/mtsc7/Desktop/coursera')
if(!file.exists("./data")){dir.create("./data")}
unzip(zipfile="./exdata_data_household_power_consumption.zip",exdir="./data")

##Plot 1
data_master <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

names(data_master) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                        "Sub_metering_1","Sub_metering_2","Sub_metering_3")

data_part <- subset(data_master,data_master$Date=="1/2/2007" | data_master$Date =="2/2/2007")

png(file="plot1.png", width=480, height=480)

hist(data_part$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

