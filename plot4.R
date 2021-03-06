data <- read.table("/Users/x/Downloads/household_power_consumption.txt"
                   , header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c('character','character','numeric','numeric',
                                  'numeric','numeric','numeric',
                                  'numeric','numeric'))


data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date == as.Date("2007-2-2") | Date == as.Date("2007-2-1"))

dateTime <- paste(date$Date, date$Time)

dateTime <- as.POSIXct(dateTime)

data <- data[,!(names(data)) %in% c("Date", "Time")]

dateTime <- setNames(dateTime, "DateTime")

data <- cbind(dateTime, data)

par(mfcol = c(2,2))

plot(data$dateTime, data$Global_active_power
     ,ylab = "Global Active Power",
     xlab ="" 
     ,lty = 1, type = "l", lwd= 1)


plot(data$dateTime, data$Sub_metering_1
     ,ylab = "Energy Sub Metering"
     ,xlab = ""
     ,col = "black"
     ,type = "l", lty = 1, lwd = 1)

points(data$dateTime, data$Sub_metering_2
       ,col = "red"
       ,type = "l"
       ,lwd = 1
       ,lty= 1)

points(data$dateTime, data$Sub_metering_3
       ,col = "blue"
       ,type = "l"
       ,lwd = 1
       ,lty= 1)

legend("topright", lwd = 1, lty = 1
       ,col = c("black", "red", "blue")
       ,legend = c("Sub_metering_1","Sub_metering_2"
                   ,"Sub_metering_3")
       ,bty = "n")

plot(data$dateTime, data$Voltage
     ,ylab = "Voltage"
     ,xlab = "datetime"
     ,col = "black"
     ,type = "l", lty = 1, lwd = 1)

plot(data$dateTime, data$Global_reactive_power
     ,ylab = "Global_reactive_power"
     ,xlab = "datetime"
     ,col = "black"
     ,type = "l", lty = 1, lwd = 1)

