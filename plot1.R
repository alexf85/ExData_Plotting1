# D/M/Y format
source_file <- "household_power_consumption.txt"
days_to_extract <- c("1/2/2007", "2/2/2007")

data <- read.table(source_file, header = T, sep = ";", na.string = "?", stringsAsFactors = F)
data <- data[data$Date %in% days_to_extract,]
# create new column with Date-Time class
data$dt <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# form output image
png(file = "plot1.png", width = 480, height = 480)
hist(x = data$Global_active_power, 
     col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency") 
dev.off()