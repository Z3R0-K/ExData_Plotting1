data <- read.table("/Users/x/Downloads/household_power_consumption.txt"
                   , header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c('character','character','numeric','numeric',
                                  'numeric','numeric','numeric',
                                  'numeric','numeric'))


data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(t, Date == as.Date("2007-2-2") | Date == as.Date("2007-2-1"))

hist(data$Global_active_power, col = "red"
     ,xlab = "Global Active Power (kilowatts)"
     ,main = "Global Active Power")

