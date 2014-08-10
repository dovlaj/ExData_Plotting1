
if (!file.exists("Course_Project_1_graphics"))
{
    dir.create("Course_Project_1_graphics")
}

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ';', header = TRUE, )
unlink(temp)

closeAllConnections()

relevantData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

time <- strptime(paste(relevantData$Date, relevantData$Time), format = "%d/%m/%Y %H:%M:%S")
relevantData$Sub_metering_1 <- sapply(relevantData$Sub_metering_1, as.character)
relevantData$Sub_metering_1 <- sapply(relevantData$Sub_metering_1, as.numeric)
relevantData$Sub_metering_2 <- sapply(relevantData$Sub_metering_2, as.character)
relevantData$Sub_metering_2 <- sapply(relevantData$Sub_metering_2, as.numeric)
relevantData$Sub_metering_3 <- sapply(relevantData$Sub_metering_3, as.character)
relevantData$Sub_metering_3 <- sapply(relevantData$Sub_metering_3, as.numeric)

png(file = "./Course_Project_1_graphics/plot3.png", width = 480, height = 480)

plot(time, relevantData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(time, relevantData$Sub_metering_2, col = "red")
lines(time, relevantData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
