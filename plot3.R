library(dplyr) #load dplyr library
library(lubridate) #load lubridate library
plotdata<- read.table("./household_power_consumption.txt", sep=";", header=TRUE) #reading in data
plotdata$Global_active_power<-as.numeric(as.character(plotdata$Global_active_power)) #converting power to a number
plotdata$Sub_metering_1<-as.numeric(as.character(plotdata$Sub_metering_1)) #convert meter 1 to number
plotdata$Sub_metering_2<-as.numeric(as.character(plotdata$Sub_metering_2)) #convert meter 2 to number
plotdata$Date<-as.Date(plotdata$Date, "%d/%m/%Y") #convert date to date (15-02-2014)
plotdata$Time<-as.character(plotdata$Time) #converting time to character (17:24:00)
plotdata$Date_Time <-strptime(paste(plotdata$Date,plotdata$Time), format="%F %H:%M:%S") #combining date and time to POSIXlt (15-02-2014 17:24:00)
plotdata3<-subset(plotdata, (month(Date) == 2 & year(Date) == 2007 & (day(Date)==1 |day(Date)==2))) #filtering to dates
png(file = "plot3.png") #opening png function
plot(plotdata3$Date_Time, plotdata3$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black") #plotting the chart
lines(plotdata3$Date_Time, plotdata3$Sub_metering_2, col="red") #adding the second data set
lines(plotdata3$Date_Time, plotdata3$Sub_metering_3, col="blue") #adding the third data set
legend(x="topright", col=c("black","red","blue"),pch="_", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #adding a legend
dev.off() #closing png function