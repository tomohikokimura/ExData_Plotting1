library(dplyr)

INPUT_FILE <- "household_power_consumption.txt"

rawdata <- read.csv(INPUT_FILE, sep=";", na.strings = "?")
withDates <- mutate(rawdata, Date = as.Date(Date, format="%d/%m/%Y"))
twoDays <- filter(withDates,
                  Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"))
twoDays$Datetime <- strptime(paste(format(twoDays$Date, "%Y/%m/%d"), twoDays$Time),
                             format="%Y/%m/%d %H:%M:%S")

# Draw plot1.
plot1 <- function(mainLabel, xLabel) {
    hist(twoDays$Global_active_power,
         main = mainLabel, xlab = xLabel, col = "red")
}

# Draw plot2 and the top left plot of plot 4.
plot2 <- function(data, yLabel) {
    with(data,
         plot(Datetime, Global_active_power,
              xlab = "", ylab = yLabel, type="l"))
}

# Draw plot3 and the bottom left plot of plot 4.
plot3 <- function(data, bty = "o") {
    with(data,
         plot(Datetime, Sub_metering_1,
              xlab="", ylab="Energy sub metering", type="l"))
    with(data,
         points(Datetime, Sub_metering_2, type="l", col="red"))
    with(data,
         points(Datetime, Sub_metering_3, type="l", col="blue"))
    legend("topright",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = "solid", bty = bty, y.intersp = 1,
           col = c("black", "red", "blue"))
}

# Draw the top right plot for plot4.
plot4b <- function(data, xLabel, yLabel) {
    with(data,
         plot(Datetime, Voltage,
              xlab="datetime", ylab="Voltage", type="l"))
}

# Draw the bottom right plot for plot4.
plot4d <- function(data, xLabel) {
    with(twoDays,
         plot(Datetime, Global_reactive_power, xlab = xLabel, type = "l"))
}
