
df<-read.table("household_power_consumption.txt", header = T,
               sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dim(df)
dataplott<- subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
datetime <- strptime(paste(dataplott$Date, dataplott$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



plot3 <- function() {
   plot(datetime,dataplott$Sub_metering_1,type="n",xlab = "",ylab="Energy sub metering")
   lines(datetime,dataplott$Sub_metering_1,col="black")
   lines(datetime,dataplott$Sub_metering_2,col="red")
   lines(datetime,dataplott$Sub_metering_3,col="blue")
   legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_meeting_1","Sub_meeting_2"
                                                                       ,"Sub_meeting_3"))
   dev.copy(png, file="plot3.png", width=480, height=480)
   dev.off()
}
plot3()