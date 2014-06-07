elec_cons <- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

elec_cons <- elec_cons[(elec_cons$Date == "1/2/2007") | (elec_cons$Date == "2/2/2007"),]
elec_cons$DateTime <- strptime(paste(elec_cons$Date, elec_cons$Time), "%d/%m/%Y %H:%M:%S")

plot3 <- function() {
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  mtrs = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  plot(elec_cons$DateTime, elec_cons$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(elec_cons$DateTime, elec_cons$Sub_metering_2, type="l", col="red")
  lines(elec_cons$DateTime, elec_cons$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=mtrs)
  dev.off()
}

plot3()
