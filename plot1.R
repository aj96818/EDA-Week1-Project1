
df<-read.table("household_power_consumption.txt", header = T,
               sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dim(df)
dataplott<- subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
datetime <- strptime(paste(dataplott$Date, dataplott$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot1 <- function() {
   hist(dataplott$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",
        main="Global Active Power")
   dev.copy(png, file="plot1.png", width=480, height=480)
   dev.off()
}
plot1()
