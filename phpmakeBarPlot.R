
# test
# npick <- 6 ; nrun <- 20

source("fnmakeBarPlot.R")

png(filename = "temp.png", width = 600, height = 400)
  
fn.makeBarPlot(npick, nrun)
  
dev.off()
