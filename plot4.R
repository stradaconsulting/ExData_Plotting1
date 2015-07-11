## R-Programming Coursera
## Assignment 1
## Plot4
## Prepared by: Santiago Oleas - soleas@gmail.com

## Set working directory to local github folder
setwd("/Users/santiago/git/coursera/Exploratory Data Analysis/Assignment 1/ExData_Plotting1")

##Get File
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "powerConsumption.zip", method = "curl")

##Unzip file
unzip("powerConsumption.zip",overwrite=TRUE)

## Read File
inputData <- read.table(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings =c("?"))

## Fix date and time columns using strptime
inputData$Time <- as.POSIXct(paste(inputData$Date, inputData$Time), format="%d/%m/%Y %H:%M:%S")
inputData$Date <- strptime(inputData$Date, "%d/%m/%Y")

## We only want a subset of days 20070201 to 20070202
plot4Data <- inputData[inputData$Date>="2007-02-01" & inputData$Date<="2007-02-02",]

## We will get the minimum value of each sub-metering variable and put
## into a variable
minRange <- c(min(plot4Data$Sub_metering_1),
              min(plot4Data$Sub_metering_2),
              min(plot4Data$Sub_metering_3))

## We wil get the maximum value of each sub-metering variable and put
## into a variable
maxRange <- c(max(plot4Data$Sub_metering_1),
              max(plot4Data$Sub_metering_2),
              max(plot4Data$Sub_metering_3))




##Generate plot4.png
png("plot4.png", width=480, height=480, units="px") ## Save to file 480x480 pixels
        ## We want a 2x2 plot
        par(mfrow=c(2,2))
        
        ######################################
        # plot position (1,1)
        ######################################
        # Line plot Global_active_power
        plot(plot4Data$Time                  ##Time column is the detailed date/time one
           , plot4Data$Global_active_power
           , xlab = ""
           , ylab = "Global Active Power"
           , type = "l"
        )

        ######################################
        # plot position (1,2)
        ######################################
        # Line plot Voltage
        plot(plot4Data$Time                  ##Time column is the detailed date/time one
           , plot4Data$Voltage
           , xlab = ""
           , ylab = "Voltage"
           , type = "l"
        )

        ######################################
        # plot position (2,1)
        ######################################
        # Energy Sub Metering (same as plot3)
        plot(plot4Data$Time, plot4Data$Sub_metering_1
           , type="n"
           , xlab = ""
           , ylab = "Energy sub metering"
           , ylim=(c(min(minRange),max(maxRange)))
        )

        #draw Sub_metering_1 line.  Leave as default colour black
        lines(plot4Data$Time, plot4Data$Sub_metering_1)

        #draw Sub_metering_2 line. Make red
        lines(plot4Data$Time, plot4Data$Sub_metering_2, col="red")

        #draw Sub_metering_3 line.  Make blue
        lines(plot4Data$Time, plot4Data$Sub_metering_3, col="blue")

        #Legend
        #Place top-right
        #We want 3 lines (lty)
        #Colours of legend
        #Legend labels
        #We want no box        
        legend("topright"
             , bty = "n"
             , lty = c(1,1,1)
             , col = c("black","blue","red")
             , legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
        )


        ######################################
        # plot position (2,2)
        ######################################
        # Line plot Global Reactive Power
        plot(plot4Data$Time                  ##Time column is the detailed date/time one
           , plot4Data$Global_reactive_power
           , xlab = ""
           , ylab = "Global_reactive_power"
           , type = "l"
        )


dev.off()  ##IMPORTANT always when sending to file


## END