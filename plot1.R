## R-Programming Coursera
## Assignment 1
## Plot1
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
plot1Data <- inputData[inputData$Date>="2007-02-01" & inputData$Date<="2007-02-02",]

##Generate plot1.png
png("plot1.png", width=480, height=480, units="px") ## Save to file 480x480 pixels

## This is histogram on Global_active_power using red and with the 
## assigned main title and axis labels specified below
hist(plot1Data$Global_active_power, col="red"
                                  , main = "Global Active Power"
                                  , ylab = "Frequency"
                                  , xlab = "Global Active Power (kilowatts)"
             )
dev.off()  ##IMPORTANT always when sending to file


## END