## Coursera Data Science Specialization Johns Hopkins
## Exploratory Data Analysis
## Project 1:Plot 2
## David Myers
## start/finish 12/11/15

rm(list=ls())

#setwd("~/DataAnalysis/Coursera04-ExploratoryDataAnalysis/Project 1") local working drive

#if datafile not present download and extract
if(!file.exists("exdata-data-household_power_consumption.zip")) {
    temp <- tempfile()
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    file <- unzip(temp)
    unlink(temp)
}

#housemeterdataraw<-data.frame(read.table(file, header=TRUE, sep=";"))
#str(housemeterdataraw)

#read data file
dataraw<-read.table(file, header=TRUE, sep=";", na.strings="?")
rm(temp)
rm(file)

#Select rows of interest
meter<-dataraw[(dataraw$Date=="1/2/2007") | (dataraw$Date=="2/2/2007"), ]
rm(dataraw)

#Transform Date and time(factor) in to Date-Time
meter<-transform(meter, timestamp=strptime(paste(meter[ ,1], meter[ ,2]), 
                                           "%d/%m/%Y %H:%M:%S"))


#drop original Date and Time vars
meter<-meter[, 3:10]
#str(meter)

#Plot2 
png(filename="plot2.png", width= 480, height= 480, unit= "px")  

plot(meter[ ,8], meter[ ,1], type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
