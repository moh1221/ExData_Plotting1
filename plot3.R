file <- "household_power_consumption.txt"

## read all data table to Doc
doc <- read.table(file, sep = ";", header = T, na.strings = "?")

##Filter data match date ==  "1/2/2007" | "2/2/2007"
subDoc <- doc[doc$Date == "1/2/2007" | doc$Date == "2/2/2007",]

## set Date column
subDoc$Date <- as.Date(subDoc$Date, format="%d/%m/%Y")
## combined Date and time in new column
subDoc$Date_Time <- paste(subDoc$Date, subDoc$Time)
## format Date_Time
subDoc$Date_Time <- strptime(subDoc$Date_Time, format="%Y-%m-%d %H:%M:%S")

## create and load plot3.png
png(filename = "plot3.png", width = 480, height = 480)
plot(subDoc$Date_Time, subDoc$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(subDoc$Date_Time, subDoc$Sub_metering_1, col = "black", type = "S")
lines(subDoc$Date_Time, subDoc$Sub_metering_2, col = "red", type = "S")
lines(subDoc$Date_Time, subDoc$Sub_metering_3, col = "blue", type = "S")
legend("topright", lty = c(1, 1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

