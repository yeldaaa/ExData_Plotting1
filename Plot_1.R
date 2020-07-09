power_con <- read.table("household_power_consumption.txt", skip = 1, sep =";")
names(power_con)<- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
Subset_power_con <- subset(power_con, power_con$Date =="1/2/2007" | power_con$Date =="2/2/2007")

# Basic Plot Function 
hist(as.numeric(as.character(Subset_power_con$Global_Active_Power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
