#read and tabulate data from local
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors = FALSE,dec = ".")
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot3Code
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(datasubset$Global_active_power)
submeter1 <- as.numeric(datasubset$Sub_metering_1)
submeter2 <- as.numeric(datasubset$Sub_metering_2)
submeter3 <- as.numeric(datasubset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, submeter1, type="l", ylab="Energy submeter", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()