Hot Dogs and Pizza in Baltimore
================

-   [Downloading Data](#downloading-data)
-   [Importing CSV Table](#importing-csv-table)
-   [Eliminating unusable variables](#eliminating-unusable-variables)
-   [Changing variable names](#changing-variable-names)
-   [Extracting Latitude and Longitude from laction](#extracting-latitude-and-longitude-from-laction)
-   [Hot Dogs!](#hot-dogs)
-   [If you preffer pizza, then...](#if-you-preffer-pizza-then...)
-   [Getting city names](#getting-city-names)

### Downloading Data

First of all, download the file to your pc

``` r
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
```

    ## [1] "File downloaded,  15816  bytes"

### Importing CSV Table

Now import the csv file to R environment (DataFrame Format).

``` r
bVendors <- read.csv(file="./TempData/BFood.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
str(bVendors)
```

    ## 'data.frame':    77 obs. of  8 variables:
    ##  $ Id        : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ LicenseNum: chr  "DF000166" "DF000075" "DF000133" "DF000136" ...
    ##  $ VendorName: chr  "Abdul-Ghani, Christina, \"The Bullpen Bar\"" "Ali, Fathi" "Ali, Fathi" "Ali, Fathi" ...
    ##  $ VendorAddr: chr  "508 Washington Blvd, confined within 10 x 10 space" "SEC Calvert & Madison on Calvert" "NEC Baltimore & Pine Sts" "NEC Light & Redwood Sts" ...
    ##  $ ItemsSold : chr  "Grilled food, pizza slices, gyro sandwiches" "Hot Dogs, Sausage, Snacks, Gum, Candies, Drinks" "Hot dogs, Sausage, drinks, snacks, gum, & candy" "Hot dogs, sausages, chips, snacks, drinks, gum" ...
    ##  $ Cart_Descr: chr  "Two add'l tables to be added to current 6' table in U shape, with grill & warming pans, Tent" "Pushcart" "Pushcart" "Pushcart" ...
    ##  $ St        : chr  "MD" "MD" "MD" "MD" ...
    ##  $ Location.1: chr  "Towson 21204\n(39.28540000000, -76.62260000000)" "Owings Mill 21117\n(39.29860000000, -76.61280000000)" "Owings Mill 21117\n(39.28920000000, -76.62670000000)" "Owings Mill 21117\n(39.28870000000, -76.61360000000)" ...

### Eliminating unusable variables

If you check bVendors DataFrame, there will be some unmeaningful variables like bVendors$Id. So you can remove it.

``` r
#Turning LicenseNum to Factor
bVendors$LicenseNum <- as.factor(bVendors$LicenseNum)

bVendors$Id
```

    ##  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ## [36] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ## [71] 0 0 0 0 0 0 0

``` r
bVendors$Id <- NULL
bVendors$St <- NULL
```

### Changing variable names

Location.1 is not a good name for a variable, let's change it to just "location".

``` r
names(bVendors)[names(bVendors) == "Location.1"] <- "location"
str(bVendors)
```

    ## 'data.frame':    77 obs. of  6 variables:
    ##  $ LicenseNum: Factor w/ 76 levels "DF000001","DF000002",..: 50 35 46 48 1 38 33 2 3 4 ...
    ##  $ VendorName: chr  "Abdul-Ghani, Christina, \"The Bullpen Bar\"" "Ali, Fathi" "Ali, Fathi" "Ali, Fathi" ...
    ##  $ VendorAddr: chr  "508 Washington Blvd, confined within 10 x 10 space" "SEC Calvert & Madison on Calvert" "NEC Baltimore & Pine Sts" "NEC Light & Redwood Sts" ...
    ##  $ ItemsSold : chr  "Grilled food, pizza slices, gyro sandwiches" "Hot Dogs, Sausage, Snacks, Gum, Candies, Drinks" "Hot dogs, Sausage, drinks, snacks, gum, & candy" "Hot dogs, sausages, chips, snacks, drinks, gum" ...
    ##  $ Cart_Descr: chr  "Two add'l tables to be added to current 6' table in U shape, with grill & warming pans, Tent" "Pushcart" "Pushcart" "Pushcart" ...
    ##  $ location  : chr  "Towson 21204\n(39.28540000000, -76.62260000000)" "Owings Mill 21117\n(39.29860000000, -76.61280000000)" "Owings Mill 21117\n(39.28920000000, -76.62670000000)" "Owings Mill 21117\n(39.28870000000, -76.61360000000)" ...

### Extracting Latitude and Longitude from Location

Latitude and Longitude is a very important data, it should be in it's own variable.

Let's extract it from location using Regular Expression.

``` r
#regex match for coordinates
tempS <- regmatches(bVendors$location,gregexpr("[0-9.]+",bVendors$location))
lats <- vector(length = nrow(bVendors),mode = "numeric")
longs <- vector(length = nrow(bVendors),mode = "numeric")

#for each row, extract the lat and long
for(i in 1:nrow(bVendors)) 
{
  lats[i] <- as.numeric(tempS[[i]][2])
  longs[i] <- as.numeric(tempS[[i]][3])
}

#adding to bVendors Data Set
bVendors$lat <- lats
bVendors$long <- longs
str(bVendors)
```

    ## 'data.frame':    77 obs. of  8 variables:
    ##  $ LicenseNum: Factor w/ 76 levels "DF000001","DF000002",..: 50 35 46 48 1 38 33 2 3 4 ...
    ##  $ VendorName: chr  "Abdul-Ghani, Christina, \"The Bullpen Bar\"" "Ali, Fathi" "Ali, Fathi" "Ali, Fathi" ...
    ##  $ VendorAddr: chr  "508 Washington Blvd, confined within 10 x 10 space" "SEC Calvert & Madison on Calvert" "NEC Baltimore & Pine Sts" "NEC Light & Redwood Sts" ...
    ##  $ ItemsSold : chr  "Grilled food, pizza slices, gyro sandwiches" "Hot Dogs, Sausage, Snacks, Gum, Candies, Drinks" "Hot dogs, Sausage, drinks, snacks, gum, & candy" "Hot dogs, sausages, chips, snacks, drinks, gum" ...
    ##  $ Cart_Descr: chr  "Two add'l tables to be added to current 6' table in U shape, with grill & warming pans, Tent" "Pushcart" "Pushcart" "Pushcart" ...
    ##  $ location  : chr  "Towson 21204\n(39.28540000000, -76.62260000000)" "Owings Mill 21117\n(39.29860000000, -76.61280000000)" "Owings Mill 21117\n(39.28920000000, -76.62670000000)" "Owings Mill 21117\n(39.28870000000, -76.61360000000)" ...
    ##  $ lat       : num  39.3 39.3 39.3 39.3 39.3 ...
    ##  $ long      : num  76.6 76.6 76.6 76.6 76.6 ...

``` r
head(subset(bVendors, select = c(location,lat,long)))
```

    ##                                               location     lat    long
    ## 1      Towson 21204\n(39.28540000000, -76.62260000000) 39.2854 76.6226
    ## 2 Owings Mill 21117\n(39.29860000000, -76.61280000000) 39.2986 76.6128
    ## 3 Owings Mill 21117\n(39.28920000000, -76.62670000000) 39.2892 76.6267
    ## 4 Owings Mill 21117\n(39.28870000000, -76.61360000000) 39.2887 76.6136
    ## 5   Baltimore 21239\n(39.27920000000, -76.62200000000) 39.2792 76.6220
    ## 6   Baltimore 21244\n(39.30250000000, -76.61610000000) 39.3025 76.6161

### Hot Dogs!

What can i do to check which vendors sells hot dogs in baltimore?

You can check in the variable ItemsSold if the vendor have Hot dog, using grepl

``` r
bVendors$hotdog <- grepl("Hot dog",bVendors$ItemsSold)
head(subset(bVendors, select = c(ItemsSold,hotdog)))
```

    ##                                                                  ItemsSold
    ## 1                              Grilled food, pizza slices, gyro sandwiches
    ## 2                          Hot Dogs, Sausage, Snacks, Gum, Candies, Drinks
    ## 3                          Hot dogs, Sausage, drinks, snacks, gum, & candy
    ## 4                           Hot dogs, sausages, chips, snacks, drinks, gum
    ## 5 Large & Small beef franks, soft drinks, water, all types of nuts & chips
    ## 6                                                   Hot dogs, Sodas, Chips
    ##   hotdog
    ## 1  FALSE
    ## 2  FALSE
    ## 3   TRUE
    ## 4   TRUE
    ## 5  FALSE
    ## 6   TRUE

Ok... The vendor sells "Hot Dogs". How can we ensure that all variations of "hot dogs" are represented?

Turning ItemsSold to lower case and looking for "hot dog"!

``` r
bVendors$ItemsSold = tolower(bVendors$ItemsSold)


bVendors$hotdog <- grepl("hot dog",bVendors$ItemsSold)
head(subset(bVendors, select = c(ItemsSold,hotdog)))
```

    ##                                                                  ItemsSold
    ## 1                              grilled food, pizza slices, gyro sandwiches
    ## 2                          hot dogs, sausage, snacks, gum, candies, drinks
    ## 3                          hot dogs, sausage, drinks, snacks, gum, & candy
    ## 4                           hot dogs, sausages, chips, snacks, drinks, gum
    ## 5 large & small beef franks, soft drinks, water, all types of nuts & chips
    ## 6                                                   hot dogs, sodas, chips
    ##   hotdog
    ## 1  FALSE
    ## 2   TRUE
    ## 3   TRUE
    ## 4   TRUE
    ## 5  FALSE
    ## 6   TRUE

### If you preffer pizza, then...

Just create the pizza variable

``` r
bVendors$pizza <- grepl("pizza",bVendors$ItemsSold)
head(subset(bVendors, select = c(ItemsSold,pizza)))
```

    ##                                                                  ItemsSold
    ## 1                              grilled food, pizza slices, gyro sandwiches
    ## 2                          hot dogs, sausage, snacks, gum, candies, drinks
    ## 3                          hot dogs, sausage, drinks, snacks, gum, & candy
    ## 4                           hot dogs, sausages, chips, snacks, drinks, gum
    ## 5 large & small beef franks, soft drinks, water, all types of nuts & chips
    ## 6                                                   hot dogs, sodas, chips
    ##   pizza
    ## 1  TRUE
    ## 2 FALSE
    ## 3 FALSE
    ## 4 FALSE
    ## 5 FALSE
    ## 6 FALSE

### Getting city names

using string split with regex, you can get the city names

``` r
city = c()

for(i in 1:nrow(bVendors)) 
{
  city[i] <- strsplit(bVendors$location[i], split = "(?<=[a-zA-Z])\\s*(?=[0-9])", perl = TRUE)[[1]][1]
}
  city = unlist(city)
  
  bVendors$city = city
  
  bVendors$city
```

    ##  [1] "Towson"       "Owings Mill"  "Owings Mill"  "Owings Mill" 
    ##  [5] "Baltimore"    "Baltimore"    "Baltimore"    "Baltimore"   
    ##  [9] "Baltimore"    "Baltimore"    "Baltimore"    "Laurel"      
    ## [13] "Randallstown" "Baltimore"    "Baltimore"    "Baltimore"   
    ## [17] "Baltimore"    "Baltimore"    "Baltimore"    "Baltimore"   
    ## [21] "Baltimore"    "Baltimore"    "Baltimore"    "Baltimore"   
    ## [25] "Baltimore"    "Laurel"       "Owings Mill"  "Baltimore"   
    ## [29] "Baltimore"    "Glen Burnie"  "Baltimore"    "Middle River"
    ## [33] "Baltimore"    "Baltimore"    "Baltimore"    "Baltimore"   
    ## [37] "Reisterstown" "Reisterstown" "Baltimore"    "Baltimore"   
    ## [41] "Baltimore"    "Baltimore"    "Baltimore"    "Baltimore"   
    ## [45] "Windsor Mill" "Baltimore"    "Baltimore"    "Windsor Mill"
    ## [49] "Baltimore"    "Baltimore"    "Baltimore"    "Pikesville"  
    ## [53] "Baltimore"    "Baltimore"    "Baltimore"    "Edgewood"    
    ## [57] "Baltimore"    "Baltimore"    "Baltimore"    "Baltimore"   
    ## [61] "Baltimore"    "Baltimore"    "Baltimore"    "Baltimore"   
    ## [65] "Baltimore"    "Pasadena"     "Towson"       "Baltimore"   
    ## [69] "Baltimore"    "Laurel"       "Rosedale"     "Baltimore"   
    ## [73] "Baltimore"    "Windsor Mill" "Baltimore"    "Baltimore"   
    ## [77] "Pikesville"
