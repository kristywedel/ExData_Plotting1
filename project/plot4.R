
ExData <- read.csv("~/R/household_power_consumption.txt", sep=";")
ExData <- data.table(ExData)
ExDataFeb <- ExData[as.character(ExData$Date) %in% c("1/2/2007", "2/2/2007"),]
ExDataFeb$Date <- as.Date(ExDataFeb$Date, "%d/%m/%Y")
##ExDataFeb$datetime <- strptime(paste(ExDataFeb$Date, ExDataFeb$Time), "%d/%m/%Y %H:%M:%S")
ExDataFeb$datetime <- paste(ExDataFeb$Date, ExDataFeb$Time)
ExDataFeb$datetime <- as.POSIXct(ExDataFeb$datetime, format="%d/%Y/%m %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
with(ExDataFeb, plot(datetime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power"))
with(ExDataFeb, plot(datetime, as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage"))

with(ExDataFeb, plot(datetime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,38)))
with(ExDataFeb, lines(datetime, as.numeric(as.character(Sub_metering_2)), col="red"))
with(ExDataFeb, lines(datetime, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

with(ExDataFeb, plot(datetime, as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()