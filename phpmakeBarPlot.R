
# test
# npick <- 6 ; nrun <- 20

source("fnmakeBarPlot.R")

png(filename = "temp.png", width = 600, height = 400)
  
fn.makeBarPlot(npick, nrun)
  
dev.off()



library(svglite)

svglite(file = "tempsvglite.svg", width = 6, height = 4, 
        pointsize = 9,
        bg = "lightblue1")

fn.makeBarPlot(npick, nrun)

dev.off()
