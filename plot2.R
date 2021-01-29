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

plot(data$dateTime, data$Global_active_power
     ,ylab = "Global Active Power (kilowatts)",
     xlab ="" 
     ,lty = 1, type = "l", lwd= 1)
