##Plot3.R
##creates a lineplot of the Energy submetering over time 
##To save time the raw data was reduced to the needed time (2007/02/01 to 2007/02/02)
##by Sebastian Deutsch, 2014/05/09

## get data
power <- read.table("household_power_consumption_cut.txt", sep=";", header=T, na.strings="?")
## create a date time stamp
power$datetime <- as.POSIXct(strptime(paste(power$Date,power$Time), "%d/%m/%Y %H:%M:%S"))

##open PNG Device 
##size not necessary, because these are R standarts, but I included them for sincerity
png("Plot3.png", width = 480, height = 480, units = "px") 
##code for blank plot
with(power, plot(datetime,Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
##color vector
colour <- c("black", "red", "blue")
## for loop to insert the diferent lines
for (i in 1:3) {
  lines(power$datetime, power[,6+i], col=colour[i])
}
##create legend
legends <- names(power[7:9])
legend("topright", legends, col=colour, lty=1)
##close device
dev.off()
