##Plot1.R
##creates a histogram of the global active power column of the household power dataset
##To save time the raw data was reduced to the needed time (2007/02/01 to 2007/02/02)
##by Sebastian Deutsch, 2014/05/09

## get data
power <- read.table("household_power_consumption_cut.txt", sep=";", header=T, na.strings="?")

##open PNG Device 
##size not necessary, because these are R standarts, but I included them for sincerity
png("Plot1.png", width = 480, height = 480, units = "px") 
##code for histogram
hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
##close device
dev.off()