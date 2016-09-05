# Plot 1 of homework

# Don't redownload file if it already exists
if(!file.exists("household_power_consumption.zip"))
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip", mode="wb")
}


#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip", mode="wb")
#data <- read.table(unz("temp", "temp.dat"), sep=",")


#data <- read.table(unz("household_power_consumption.zip", "household_power_consumption.dat"), sep=",")

#download.file("...",temp, mode="wb")
#unzip(temp, "gbr_Country_en_csv_v2.csv")
#dd <- read.table("gbr_Country_en_csv_v2.csv", sep=",",skip=2, header=T)