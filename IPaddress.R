setwd("~/Documents/Workspace/R-project/IPaddress")

library(readxl)
# library(iptools)
# library(maps)
# library(ggplot2)
# library(XML)
# library(httr)
# library(xml2)
library(RDSTK) # IP to location
library(rworldmap)

## load data
BPTS030AoR <- read_excel("Sheet_1.xls")
View(BPTS030AoR)



##################

# ip to location

loc <- ip2coordinates(ip = paste(BPTS030AoR$IP_Address, collapse=", "))


# plot WORLD
par(mar = rep(0, 4)) 
plot(getMap())
with(loc, points(x = longitude, y = latitude, col = "red", pch = 19))

# plot EUROPE
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)
points(loc$longitude, loc$latitude, col = "red", pch = 19)

