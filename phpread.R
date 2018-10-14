options(echo=TRUE)

args <- commandArgs(trailingOnly = TRUE)

# npick <- args[1]
# nrun <- args[2]
# 
# npick <- as.numeric(npick)
# nrun <- as.numeric(nrun)

library(jsonlite)

jsonvar <- fromJSON(args[3], flatten = TRUE)

npick <- jsonvar[1]
nrun <- jsonvar[2]

source("phpmakeBarPlot.R")

