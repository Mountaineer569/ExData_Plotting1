# Exploratory Data Analysis - Project 1 Plot 3
# Individual household electric power consumption Data Set
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

library('data.table')

epc <- read.csv("./household_power_consumption.txt",
                header=TRUE, sep=";", 
                stringsAsFactor=FALSE,
                na.strings="?"
)

# Combine Date and Time into one field
epc$DateTime <- paste(epc$Date, epc$Time)
epc[, "DateTime"] <- epc$DateTime

# Format Date and Time fields
epc$DateTime <- strptime(epc$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Subset data for selected dates
epcFeb <- subset(epc, epc$Date == "1/2/2007" | epc$Date == "2/2/2007")


# Plot 3
png("plot3.png", width=480, height=480)
plot(epcFeb$DateTime, epcFeb$Sub_metering_1, type = "l", col = "black", ylab="Energy Submetering", xlab="")
lines(epcFeb$DateTime, epcFeb$Sub_metering_2, type = "l", col = "red")
lines(epcFeb$DateTime, epcFeb$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()