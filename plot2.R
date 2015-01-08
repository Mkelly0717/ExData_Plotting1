########################################################
# Author: Michael A. Kelly Ph.D
# Class: Exploratory Analysis
# Assignment: 1 part 2
# Creation Date: Jan 8th, 2015
########################################################


# Following two lines for testing only.
#setwd("~/Cousera/DataScienceCourse/Exploratory Analysis/Week I") # for testing
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


# subset the data for the dates 1.2.2007 and 2.2.2007
x <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Global_active_power
dates <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Date
times <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]$Time
z <- paste(dates, times)
DT <- strptime(z, "%d/%m/%Y %H:%M:%S")

# Print hist to screen first so can see
par(mfrow=c(1,1)) # One Plot in Window
plot(DT,x, type="l", col="red",ylab="Global Active Power(kilowatts)", xlab="") 

#Open the png file as a device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

# create the histogram to the file
plot(DT,x, type="l", col="red",ylab="Global Active Power(kilowatts)", xlab="") 

# close the dev
dev.off()

