# Loading the data into R
power_con <- read.table("household_power_consumption.txt", skip = 1, sep =";")
names(power_con)<- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
Subset_power_con <- subset(power_con, power_con$Date =="1/2/2007" | power_con$Date =="2/2/2007")

# Transform the Date and Time variables 
Subset_power_con$Date <- as.Date(Subset_power_con$Date, format = "%d/%m/%Y")
Subset_power_con$Time <- strptime(Subset_power_con$Time, format = "%H:%M:%S")
Subset_power_con[1:1440, "Time"] <- format(Subset_power_con[1:1440, "Time"], "2007-02-01 %H:%M:%S")
Subset_power_con[1441:2880, "Time"] <- format(Subset_power_con[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# Basic Plot Function 
plot(Subset_power_con$Time, Subset_power_con$Sub_Metering_1, type = "n", xlab ="", ylab = "Energy Sub Metering")
with(Subset_power_con, lines(Time, as.numeric(as.character(Sub_Metering_1))))
with(Subset_power_con, lines(Time, as.numeric(as.character(Sub_Metering_2)), col = "red"))
with(Subset_power_con, lines(Time, as.numeric(as.character(Sub_Metering_3)), col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
title(main = "Energy Sub-Metering")
