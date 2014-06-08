PowerConsumption <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=150000, stringsAsFactors=F)

PowCon <- subset(PowerConsumption, Date == "1/2/2007" | Date == "2/2/2007" )

PowCon$DateTime <- strptime(paste(PowCon$Date, PowCon$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(PowCon$DateTime, PowCon$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
lines(PowCon$DateTime, PowCon$Sub_metering_2, type ="l", col="red")
lines(PowCon$DateTime, PowCon$Sub_metering_3, type ="l", col="blue")
legend("topright", lty=c(1, 1), lwd=c(1, 1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
