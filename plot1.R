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

## create and load plot1.png
png(filename = "plot1.png", width = 480, height = 480)
hist(subDoc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()

