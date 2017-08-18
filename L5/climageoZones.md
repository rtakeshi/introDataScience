Climatic and Geological Zones
================

-   [Libraries](#libraries)
-   [Importing covtype.csv and soiltype.csv](#importing-covtype.csv-and-soiltype.csv)
-   [Selecting and manipulating data](#selecting-and-manipulating-data)

### Libraries

sqldf is a library to use R data.frames as SQL table.

``` r
library(sqldf)
```

    ## Loading required package: gsubfn

    ## Loading required package: proto

    ## Loading required package: RSQLite

### Importing covtype.csv and soiltype.csv

Suposing that covtype.csv is in current directory

``` r
    covtype <- read.csv("covTypev1.csv", sep=",", stringsAsFactors=FALSE)
```

Using a temporary variable to hold SoilType codes

``` r
code <- covtype$SoilType
code <- gsub("ST0", "", code)
code <- gsub("ST", "", code)

soiltype <- data.frame(code)
```

SoilType informations can be found in the information file of covtype data

<https://archive.ics.uci.edu/ml/machine-learning-databases/covtype/covtype.info>

Suposing that information data was already extracted from information file, import SoilType file

``` r
  soilindex <- read.csv("soiltype.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
```

### Selecting and manipulating data

Extracting data from SoilType to the main Data Frame (covtype)

``` r
  #Joining ELU code to covtype data.frame using sqldf
  elu <- sqldf('select soilindex.V2 from soiltype left outer join soilindex on soiltype.code = soilindex.V1')
  
  covtype$elu <- unlist(lapply(elu$V2, as.character))
  str(covtype)
```

    ## 'data.frame':    581012 obs. of  15 variables:
    ##  $ X              : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ Elevation      : int  2596 2590 2804 2785 2595 2579 2606 2605 2617 2612 ...
    ##  $ Aspect         : int  51 56 139 155 45 132 45 49 45 59 ...
    ##  $ Slope          : int  3 2 9 18 2 6 7 4 9 10 ...
    ##  $ HorDistToHydro : int  258 212 268 242 153 300 270 234 240 247 ...
    ##  $ VertDistToHydro: int  0 -6 65 118 -1 -15 5 7 56 11 ...
    ##  $ HorDistRoad    : int  510 390 3180 3090 391 67 633 573 666 636 ...
    ##  $ Hillshade09    : int  221 220 234 238 220 230 222 222 223 228 ...
    ##  $ Hillshade12    : int  232 235 238 238 234 237 225 230 221 219 ...
    ##  $ Hillshade15    : int  148 151 135 122 150 140 138 144 133 124 ...
    ##  $ HorDistFire    : int  6279 6225 6121 6211 6172 6031 6256 6228 6244 6230 ...
    ##  $ Class          : chr  "Aspen" "Aspen" "Lodgepole Pine" "Lodgepole Pine" ...
    ##  $ WildArea       : chr  "WA_RWA" "WA_RWA" "WA_RWA" "WA_RWA" ...
    ##  $ SoilType       : chr  "ST29" "ST29" "ST12" "ST30" ...
    ##  $ elu            : chr  "7745" "7745" "4744" "7746" ...

Extracting codes to Climatic Zones and Geological Zones and Importing Data From information file

``` r
climazone <- substring(covtype$elu, first =1, last = 1)
geozone <- substring(covtype$elu, first =2, last = 2)

#adding to covtype data.frame
covtype$clicode <- unlist(climazone)
covtype$geocode <- unlist(geozone)


climazone <- read.csv("climazone.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
geozone <- read.csv("geozone.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
```

Selecting Data to the main Data Frame

``` r
climazone <- sqldf('select climazone.V2 from covtype left outer join climazone on covtype.clicode = climazone.V1')
geozone <- sqldf('select geozone.V2 from covtype left outer join geozone on covtype.geocode = geozone.V1')

covtype$clizone <- unlist(climazone)
covtype$geozone <- unlist(geozone)

head(covtype)
```

    ##   X Elevation Aspect Slope HorDistToHydro VertDistToHydro HorDistRoad
    ## 1 1      2596     51     3            258               0         510
    ## 2 2      2590     56     2            212              -6         390
    ## 3 3      2804    139     9            268              65        3180
    ## 4 4      2785    155    18            242             118        3090
    ## 5 5      2595     45     2            153              -1         391
    ## 6 6      2579    132     6            300             -15          67
    ##   Hillshade09 Hillshade12 Hillshade15 HorDistFire          Class WildArea
    ## 1         221         232         148        6279          Aspen   WA_RWA
    ## 2         220         235         151        6225          Aspen   WA_RWA
    ## 3         234         238         135        6121 Lodgepole Pine   WA_RWA
    ## 4         238         238         122        6211 Lodgepole Pine   WA_RWA
    ## 5         220         234         150        6172          Aspen   WA_RWA
    ## 6         230         237         140        6031 Lodgepole Pine   WA_RWA
    ##   SoilType  elu clicode geocode                  clizone
    ## 1     ST29 7745       7       7  subalpine              
    ## 2     ST29 7745       7       7  subalpine              
    ## 3     ST12 4744       4       7  montane                
    ## 4     ST30 7746       7       7  subalpine              
    ## 5     ST29 7745       7       7  subalpine              
    ## 6     ST29 7745       7       7  subalpine              
    ##                    geozone
    ## 1  igneous and metamorphic
    ## 2  igneous and metamorphic
    ## 3  igneous and metamorphic
    ## 4  igneous and metamorphic
    ## 5  igneous and metamorphic
    ## 6  igneous and metamorphic

Done!
