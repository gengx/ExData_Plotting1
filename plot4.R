df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")

df <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)))

par(mfrow=c(2,2))

#1
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#2
plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

#3
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#4
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
