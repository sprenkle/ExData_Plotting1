# Plot 4 of homework


# Don't redownload file if it already exists
if(!file.exists("household_power_consumption.zip"))
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip", mode="wb")
}

# Don't recreate data object
if(!exists("data"))
{
  data <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), sep=";", header=TRUE)
  #Combine Date and Time columns
  data <- within(data, { datetime= strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") })
  power <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" )
  power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
  power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
  power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
  power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))
  power$Voltage <- as.numeric(as.character(power$Voltage))
}

par(mfrow=c(2,2))

# Plot 1

plot(power$datetime, power$Global_active_power/1000, type="n", ylab="Global Active Power(kilowatts)", xlab="")

lines(power$datetime, power$Global_active_power/1000)

# Plot 2

plot(power$datetime, power$Voltage, type="n", ylab="Voltage", xlab="datetime")

lines(power$datetime, power$Voltage)


# Plot 3


plot(power$datetime, power$Sub_metering_1, type="n",ylim=range(c(0,35)), ylab="Energy sub metering", xlab="")

lines(power$datetime, power$Sub_metering_1, col="black",ylim=range(c(0,35)))
lines(power$datetime, power$Sub_metering_2, col="red"  ,ylim=range(c(0,35)))
lines(power$datetime, power$Sub_metering_3, col="blue" ,ylim=range(c(0,35)))

legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)



# Plot 4

plot(power$datetime, power$Global_reactive_power, type="n", xlab="datetime")

lines(power$datetime, power$Global_reactive_power)




dev.copy(png, "plot4.png", width=480, height=480)
dev.off()