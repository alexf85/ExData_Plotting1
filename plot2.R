# D/M/Y format
source_file <- "household_power_consumption.txt"
out_file <- "plot2.png"
days_to_extract <- c("1/2/2007", "2/2/2007")

data <- read.table(source_file, header = T, sep = ";", na.string = "?", stringsAsFactors = F)
data <- data[data$Date %in% days_to_extract,]
# create new column with Date-Time class
data$dt <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# form output image
png(file = out_file, width = 480, height = 480)
plot(x = data$dt,
     y = data$Global_active_power, 
     type="l",
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)") 
dev.off()