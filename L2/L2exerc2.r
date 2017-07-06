avgRainFall <- c(3.47,	3.02,	3.93,	3.00,	3.89,	3.43,	3.85,	3.74,	3.98,	3.16,	3.12,	3.35)
month <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
names(avgRainFall) <- month

##Millimeter Average RainFal##
milliAvgRainFall = avgRainFall*25.4
names(milliAvgRainFall) = month

##Mean, Min, Max##
meanRF = mean(milliAvgRainFall)
minRF = min(milliAvgRainFall)
maxRF = max(milliAvgRainFall)


print(milliAvgRainFall)
print (paste("mean: ", meanRF))
print (paste("min: ", minRF))
print (paste("max: ", maxRF))

