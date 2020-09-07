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
png("plot2.png",width = 480, height = 480)

plot(x, as.numeric(tabl$Global_active_power), type = "l",
     xlab="", ylab="Global Active Power (kilowatts)")

# close the PNG device
dev.off()