source("plots_base.R")

png("plot4.png", width = 480, height = 480)
par("mfrow" = c(2, 2))
plot2(twoDays, "Global Active Power")
plot4b(twoDays, "datetime", "Voltage")
plot3(twoDays, bty = "n")
plot4d(twoDays, "datetime")
dev.off()
