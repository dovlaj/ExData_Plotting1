
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

relevantData$Global_active_power <- sapply(relevantData$Global_active_power, as.character)
relevantData$Global_active_power <- sapply(relevantData$Global_active_power, as.numeric)

png(file = "./Course_Project_1_graphics/plot2.png", width = 480, height = 480)

plot(time, relevantData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
