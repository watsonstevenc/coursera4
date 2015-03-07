library(dplyr) #load dplyr library
library(lubridate) #load lubridate library
plotdata<- read.table("./household_power_consumption.txt", sep=";", header=TRUE) #reading in data
plotdata$Global_active_power<-as.numeric(as.character(plotdata$Global_active_power)) #converting power to a number
plotdata$Date<-as.Date(plotdata$Date, "%d/%m/%Y") #convert date to date (15-02-2014)
plotdata$Time<-as.character(plotdata$Time) #converting time to character (17:24:00)
plotdata$Date_Time <-strptime(paste(plotdata$Date,plotdata$Time), format="%F %H:%M:%S") #combining date and time to POSIXlt (15-02-2014 17:24:00)
plotdata2<-subset(plotdata, (month(Date) == 2 & year(Date) == 2007 & (day(Date)==1 |day(Date)==2))) #filtering to dates
png(file = "plot2.png") #opening png function
plot(plotdata2$Date_Time, plotdata2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") #plotting the chart
dev.off() #closing png function