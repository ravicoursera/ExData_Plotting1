elec_cons <- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

elec_cons <- elec_cons[(elec_cons$Date == "1/2/2007") | (elec_cons$Date == "2/2/2007"),]
elec_cons$DateTime <- strptime(paste(elec_cons$Date, elec_cons$Time), "%d/%m/%Y %H:%M:%S")

plot2 <- function() {
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  plot(elec_cons$DateTime,elec_cons$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}

plot2()
