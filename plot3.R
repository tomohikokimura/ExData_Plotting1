source("plots_base.R")

png("plot3.png", width = 480, height = 480)
par("mfrow" = c(1, 1))  # Make sure to reset the screen.
plot3(twoDays)
dev.off()
