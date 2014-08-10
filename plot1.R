
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

relevantData$Global_active_power <- sapply(relevantData$Global_active_power, as.character)
relevantData$Global_active_power <- sapply(relevantData$Global_active_power, as.numeric)

png(file = "./Course_Project_1_graphics/plot1.png", width = 480, height = 480)

hist(relevantData$Global_active_power,xlim=c(0, 6),ylim=c(0,1200), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()
