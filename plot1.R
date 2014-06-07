elec_cons <- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

elec_cons <- elec_cons[(elec_cons$Date == "1/2/2007") | (elec_cons$Date == "2/2/2007"),]
elec_cons$DateTime <- strptime(paste(elec_cons$Date, elec_cons$Time), "%d/%m/%Y %H:%M:%S")

plot1 <- function() {
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  hist(elec_cons$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}

plot1()
