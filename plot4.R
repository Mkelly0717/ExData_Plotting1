########################################################
# Author: Michael A. Kelly Ph.D
# Class: Exploratory Analysis
# Assignment: 1 part 4
# Creation Date: Jan 8th, 2015
########################################################


#setwd("~/Cousera/DataScienceCourse/Exploratory Analysis/Week I")
#rm(list=ls()) - sometimes use to remove any prexisitng objects

#################################################################
# Because this dataset if very large - 2075259 we will          #
# Load the data file for only the data that we need.This data   #
#    set is in chronilogical order so we can start at row 66637 #
#    and stop at row 69517. This is much faster. Then we will   #
#   read just the first line with column names to assign to the #
#   data subset that we loaded in.                              #
#################################################################
inFile <- "household_power_consumption.txt"
# read data file skipping lines don't need
data <- read.csv(inFile, skip= 66637,nrows=69517
                 ,sep=";"
                 ,colClasses=c(rep("character",2),rep("numeric",6))
                 ,na="?")
# read first line and assign column names to data
getNames <- read.csv(inFile
                     ,sep=";"
                     ,colClasses=c(rep("character",2),rep("numeric",6))
                     ,na="?", nrows=1)
names(data) <- names(getNames)
##################################################################
# End read in dataset and assign column names.                   #
##################################################################

# Get the GlobalActivePower Data
GlobalActivePower <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Global_active_power

# Get the GlobalreactivePower Data
GlobalReactivePower <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Global_reactive_power


# Get the Voltage Data
Voltage <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Voltage

# Get the Sub Metering Data
sub1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Sub_metering_1
sub2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Sub_metering_2
sub3 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Sub_metering_3

# Get the dates
dates <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Date
times <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Time
DT <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")


# Print hist to screen first so can see
par(mfrow=c(2,2)) # divide window into 4

# Plot-1
plot(DT,GlobalActivePower
       ,type="l"
       ,col="black"
       ,ylab="Global Active Power"
      , xlab=""
) 

#Plot -2 
plot(DT,Voltage
       ,type="l"
       ,col="black"
       ,ylab="Voltage"
       , xlab="datetime"
) 

# Plot-3
plot(DT,sub1
      ,type="l"
      ,col="black"
      ,ylab="Energy sub metering"
      ,xlab=""
) 
lines(DT, sub2, col="red")
lines(DT, sub3, col="blue")
legend("topright"
        ,bty="n"
        ,lty = c(1,1,1)
        ,lwd=c(2.5,2.5,2.5)
        ,col = c("black", "red", "blue")
        ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# Plot-4
plot(DT,GlobalReactivePower
      ,type="l"
      ,col="black"
      ,ylab="Global_reactive_power"
      ,xlab="datetime") 

#Open the png file as a device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

par(mfrow=c(2,2)) # divide window into 4

# Plot-1
plot(DT,GlobalActivePower
     ,type="l"
     ,col="black"
     ,ylab="Global Active Power"
     , xlab=""
) 

#Plot -2 
plot(DT,Voltage
     ,type="l"
     ,col="black"
     ,ylab="Voltage"
     , xlab="datetime"
) 

# Plot-3
plot(DT,sub1
     ,type="l"
     ,col="black"
     ,ylab="Energy sub metering"
     ,xlab=""
) 
lines(DT, sub2, col="red")
lines(DT, sub3, col="blue")
legend("topright"
       ,bty="n"
       ,lty = c(1,1,1)
       ,lwd=c(2.5,2.5,2.5)
       ,col = c("black", "red", "blue")
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# Plot-4
plot(DT,GlobalReactivePower
     ,type="l"
     ,col="black"
     ,ylab="Global_reactive_power"
     ,xlab="datetime") 

# close the dev
dev.off()

