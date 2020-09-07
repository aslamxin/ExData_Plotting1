# read table
file <- "household_power_consumption.txt"
tabl <- read.table(file, sep = ";", header = TRUE, na.strings = "?",
                   nrows = -1)

# reformat date with Type Date
tabl$Date <- as.Date(tabl$Date, "%d/%m/%Y")

# subset data set from Feb. 1, 2007 to Feb. 2, 2007
tabl <<- tabl[tabl$Date == as.Date('2007-02-01')
              | tabl$Date == as.Date('2007-02-02'),]

x <- strptime(paste(tabl$Date,tabl$Time), format="%Y-%m-%d  %H:%M:%S")

# plot the table into PNG
png("plot4.png",width = 480, height = 480)

# setting the margins
par(mfrow = c(2, 2), mar = c(4,4,1,1), oma = c(1,0,0,0))

# 1st Graph
plot(x, as.numeric(tabl$Global_active_power), type = "l",
     xlab="", ylab="Global Active Power (kilowatts)")

# 2nd Graph
plot(x, as.numeric(tabl$Voltage), type = "l",
     xlab="datetime", ylab="Voltage")

# 3rd Graph
plot(x, as.numeric(tabl$Sub_metering_1), type = "l",
     xlab="", ylab="Energy sub metering")
lines(x,as.numeric(tabl$Sub_metering_2), col="red")
lines(x,as.numeric(tabl$Sub_metering_3), col="blue")

legend("topright", lwd=c(1,1,1), col=c("black","red","blue"), bty = "n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 4th Graph
plot(x, as.numeric(tabl$Global_reactive_power), type = "l",
     xlab="datetime", ylab="Global_rective_power")

# close the PNG device
dev.off()