library(dplyr) #load dplyr library
library(lubridate) #load lubridate library


plotdata<- read.table("./household_power_consumption.txt", sep=";", header=TRUE) #reading in data
plotdata$Global_active_power<-as.numeric(as.character(plotdata$Global_active_power)) #converting power to a number
plotdata$Sub_metering_1<-as.numeric(as.character(plotdata$Sub_metering_1)) #convert meter 1 to number
plotdata$Sub_metering_2<-as.numeric(as.character(plotdata$Sub_metering_2)) #convert meter 2 to number
plotdata$Global_reactive_power<-as.numeric(as.character(plotdata$Global_reactive_power)) #convert reactive to number
plotdata$Voltage<-as.numeric(as.character(plotdata$Voltage)) #convert voltage to number
plotdata$Global_intensity<-as.numeric(as.character(plotdata$Global_intensity)) #convert intensity to number

plotdata$Date<-as.Date(plotdata$Date, "%d/%m/%Y") #convert date to date (15-02-2014)
plotdata$Time<-as.character(plotdata$Time) #converting time to character (17:24:00)
plotdata$Date_Time <-strptime(paste(plotdata$Date,plotdata$Time), format="%F %H:%M:%S") #combining date and time to POSIXlt (15-02-2014 17:24:00)
plotdata4<-subset(plotdata, (month(Date) == 2 & year(Date) == 2007 & (day(Date)==1 |day(Date)==2))) #filtering to dates

png(file = "plot4.png") #opening png function
par(mfrow = c(2,2)) #set graphs to 2x2 in screen (row first)
par=(mar=c(1,1,1,1))

plot(plotdata4$Date_Time, plotdata4$Global_active_power, type="l", ylab="Global Active Power", xlab="") #plotting the first chart

plot(plotdata4$Date_Time, plotdata4$Voltage, type="l", ylab="Voltage", xlab="datetime") #plotting the second chart

plot(plotdata4$Date_Time, plotdata4$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black") #plotting the third chart
lines(plotdata4$Date_Time, plotdata4$Sub_metering_2, col="red") #adding the second data set
lines(plotdata4$Date_Time, plotdata4$Sub_metering_3, col="blue") #adding the third data set
legend(x="topright", col=c("black","red","blue"),pch="_",bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #adding a legend

plot(plotdata4$Date_Time, plotdata4$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime") #plotting the second chart

dev.off() #closing png function

#par(mfrow = c(1,1)) to restore display
#par(mar= c(5,4,4,1)) to restore margins