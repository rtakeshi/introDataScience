setwd("C:/Users/taake/Desktop/Mestrado/CAP-386 Introduction To Data Science/Listas/L3")
##Downloading Data
vendors <- "https://data.baltimorecity.gov/api/views/bqw3-z52q/rows.csv?accessType=DOWNLOAD"
dir.create("./TempData")
download.file(vendors,destfile = "./TempData/BFood.csv")
if (file.exists("./TempData/BFood.csv"))
{
  tam <- file.info("./TempData/BFood.csv")$size
  paste("File downloaded, ",tam," bytes")
} else
{
  "Error downloading file!"
}
##Importing CSV Table
bVendors <- read.csv(file="./TempData/BFood.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
str(bVendors)

##Taking off ID
bVendors$Id <- NULL

bVendors$LicenseNum <- as.factor(bVendors$LicenseNum)


bVendors$St <- as.factor(bVendors$St)
str(bVendors$St)
bVendors$St <- NULL


names(bVendors)[names(bVendors) == "Location.1"] <- "location"
str(bVendors)


##PARSING THE LOCATION

tempS <- regmatches(bVendors$location,gregexpr("[0-9.]+",bVendors$location))
lats <- vector(length = nrow(bVendors),mode = "numeric")
longs <- vector(length = nrow(bVendors),mode = "numeric")
for(i in 1:nrow(bVendors)) 
{
  lats[i] <- as.numeric(tempS[[i]][2])
  longs[i] <- as.numeric(tempS[[i]][3])
}
bVendors$lat <- lats
bVendors$long <- longs
str(bVendors)

head(subset(bVendors, select = c(location,lat,long)))

##EXERCISE!

bVendors$hotdog <- grepl("Hot dog",bVendors$ItemsSold)
head(subset(bVendors, select = c(ItemsSold,hotdog)))

##Turning Items Sold to Lowercase!
bVendors$ItemsSold = tolower(bVendors$ItemsSold)

bVendors$pizza <- grepl("pizza",bVendors$ItemsSold)
head(subset(bVendors, select = c(ItemsSold,pizza)))

city = c()

for(i in 1:nrow(bVendors)) 
{
  city[i] <- strsplit(bVendors$location[i], split = "(?<=[a-zA-Z])\\s*(?=[0-9])", perl = TRUE)[[1]][1]
}
  city = unlist(city)
  
  bVendors$city = city

