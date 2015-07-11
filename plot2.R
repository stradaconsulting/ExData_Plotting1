## R-Programming Coursera
## Assignment 1
## Plot2
## Prepared by: Santiago Oleas - soleas@gmail.com

## Set working directory to local github folder
setwd("/Users/santiago/git/coursera/Exploratory Data Analysis/Assignment 1/ExData_Plotting1")

##Get File
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "powerConsumption.zip", method = "curl")

##Unzip file
unzip("powerConsumption.zip",overwrite=TRUE)

##Read File
inputData <- read.table(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings =c("?"))

## Fix date and time columns using strptime
inputData$Time <- as.POSIXct(paste(inputData$Date, inputData$Time), format="%d/%m/%Y %H:%M:%S")
inputData$Date <- strptime(inputData$Date, "%d/%m/%Y")

## We only want a subset of days 20070201 to 20070202
plot2Data <- inputData[inputData$Date>="2007-02-01" & inputData$Date<="2007-02-02",]

##Generate plot2.png
png("plot2.png", width=480, height=480, units="px") ## Save to file 480x480 pixels

## This is line plot on Global_active_power vs Date/Time 
## There is NO main title
## There is NO x-axis label
## We want a line so we use: type = "l"
plot(plot2Data$Time                  ##Time column is the detailed date/time one
     , plot2Data$Global_active_power
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)"
     , type = "l"
)
dev.off()  ##IMPORTANT always when sending to file


## END