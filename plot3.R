# D/M/Y format
source_file <- "household_power_consumption.txt"
out_file <- "plot3.png"
days_to_extract <- c("1/2/2007", "2/2/2007")

data <- read.table(source_file, header = T, sep = ";", na.string = "?", stringsAsFactors = F)
data <- data[data$Date %in% days_to_extract,]
# create new column with Date-Time class
data$dt <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# form output image
png(file = out_file, width = 480, height = 480)
plot(type="l",
     x = data$dt,
     y = data$Sub_metering_1,
     col = "black",
     main="",
     xlab="",
     ylab="Energy sub metering")
lines(x = data$dt, y = data$Sub_metering_2, col = "red")
lines(x = data$dt, y = data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       col=c("black","red", "blue"))

dev.off()