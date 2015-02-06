data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
##dataInUse<-split(data,data$Date)
dataInUse<-subset(data,Date=="1/2/2007")
dat<-subset(data,Date=="2/2/2007")
dataInUse<-rbind(dataInUse,dat)

dataInUse$Date<-as.Date(dataInUse$Date, format="%d/%m/%Y")
datetime<-paste(as.Date(dataInUse$Date),dataInUse$Time)
DT<-as.POSIXct(datetime)
plot(DT,as.numeric(dataInUse$Global_active_power)/500,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png",width=480,height=480)

dev.off()