source("plots_base.R")

png("plot1.png", width = 480, height = 480)
par("mfrow" = c(1, 1))  # Make sure to reset the screen.
plot1("Global Active Power", "Global Active Power (kilowatts)")
dev.off()
