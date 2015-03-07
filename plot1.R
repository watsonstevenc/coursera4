library(dplyr) #load dplyr library
library(lubridate) #load lubridate library
plotdata<- read.table("./household_power_consumption.txt", sep=";", header=TRUE) #reading in data
plotdata$Global_active_power<-as.numeric(as.character(plotdata$Global_active_power)) #converting power to a number
plotdata$Date<-as.Date(plotdata$Date, "%d/%m/%Y") #convert date to date
#test<-strptime(plotdata$Time, "%H:%M:%S")
plotdata1<-filter(plotdata, (month(Date) == 2 & year(Date) == 2007 & (day(Date)==1 |day(Date)==2))) #filtering to dates
png(file = "plot1.png") #opening png function
hist(plotdata1$Global_active_power,col="red",breaks=12, xlab="Global Active Power (kilowatts)", main="Global Active Power" ) #plotting the histogram
dev.off() #closing png function