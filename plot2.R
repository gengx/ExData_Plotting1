df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")

df2 <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

df3 <- transform(df2, timestamp=as.POSIXct(paste(Date, Time)))

plot(df3$timestamp,df3$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png, file="plot2.png", width=480, height=480)

dev.off()