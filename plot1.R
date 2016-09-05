# Plot 1 of homework

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
}

par(mfrow=c(1,1))

hist(power$Global_active_power/1000, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()