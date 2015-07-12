source("plots_base.R")

png("plot2.png", width = 480, height = 480)
par("mfrow" = c(1, 1))  # Make sure to reset the screen.
plot2(twoDays, "Global Active Power (kilowatts)")
dev.off()
