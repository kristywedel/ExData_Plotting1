
ExData <- read.csv("~/R/household_power_consumption.txt", sep=";")
ExData <- data.table(ExData)
##ExData$Date <- as.Date(ExData$Date, "%d/%m/%Y") 
##ExDataFeb <- subset(ExData, ExData$Date > as.Date('2007-01-31', "%Y-%m-%d") 
##                    && ExData$Date < as.Date('2007-02-02', "%Y-%m-%d"))

ExDataFeb <- ExData[as.character(ExData$Date) %in% c("1/2/2007", "2/2/2007"),]

##subsetGAP <- na.omit(ExDataFeb$Global_active_power)
##charlist <- c("?")
##subsetGAP <- subset(subsetGAP, !(subsetGAP %in% charlist))
subsetGAP<-as.numeric(subsetGAP)
png(filename = "plot1.png")
hist(subsetGAP, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



