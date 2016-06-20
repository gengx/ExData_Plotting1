df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")

df <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)))

plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()