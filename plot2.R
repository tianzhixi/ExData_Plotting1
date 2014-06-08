PowerConsumption <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=150000, stringsAsFactors=F)

PowCon <- subset(PowerConsumption, Date == "1/2/2007" | Date == "2/2/2007" )

PowCon$DateTime <- strptime(paste(PowCon$Date, PowCon$Time), "%d/%m/%Y %H:%M:%S")

PowCon$Global_active_power <- as.numeric(PowCon$Global_active_power)

png("plot2.png")
plot(PowCon$DateTime, PowCon$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
