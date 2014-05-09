##Plot2.R
##creates a lineplot of the global active power column over time 
##To save time the raw data was reduced to the needed time (2007/02/01 to 2007/02/02)
##by Sebastian Deutsch, 2014/05/09

## get data
power <- read.table("household_power_consumption_cut.txt", sep=";", header=T, na.strings="?")
power$datetime <- as.POSIXct(strptime(paste(power$Date,power$Time), "%d/%m/%Y %H:%M:%S"))

##open PNG Device 
##size not necessary, because these are R standarts, but I included them for sincerity
png("Plot2.png", width = 480, height = 480, units = "px") 
##code for plot
with(power, plot(datetime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
##close device
dev.off()