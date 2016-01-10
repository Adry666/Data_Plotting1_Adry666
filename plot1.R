if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  a <- unzip(temp)
  unlink(temp)
}
a <- read.table(a, header=T, sep=";", na.strings = "?")

x<-a
#function strip to correct format date x$Time<-strptime(x$Time,"%H:%M:%S")
x$Date<- as.Date(x$Date, format="%d/%m/%Y")

y <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]
#y$Time function time to correct format timr<-format(y$Time, format="%H:%M:%S")

#print the graph and put it on repo plot1 
hist(y$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
getwd()
