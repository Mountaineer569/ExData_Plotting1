# Exploratory Data Analysis - Project 1
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


# Plot 1 is a histogram
png("plot1.png", width=480, height=480)
hist(epcFeb$Global_active_power
     ,col="red"
     ,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)"
)
dev.off()