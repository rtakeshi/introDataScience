
# Baltimore StreetFood Example

### 1º: Import libraries


```python
import pandas as pd
```

### 2º: Download file turning it to Pandas DataFrame


```python
url = "https://data.baltimorecity.gov/api/views/bqw3-z52q/rows.csv"
dfVendors = pd.read_csv(url)
print(dfVendors)
```

        Id LicenseNum                                         VendorName  \
    0    0   DF000166          Abdul-Ghani, Christina, "The Bullpen Bar"   
    1    0   DF000075                                         Ali, Fathi   
    2    0   DF000133                                         Ali, Fathi   
    3    0   DF000136                                         Ali, Fathi   
    4    0   DF000001                                         Ali, Yusuf   
    5    0   DF000078                                  Amatullah, Maidah   
    6    0   DF000068                                      Amer, Mohamed   
    7    0   DF000002                                     Blimline, Lisa   
    8    0   DF000004                            Paul & Elizabeth Carter   
    9    0   DF000005                            Paul & Elizabeth Carter   
    10   0   DF000007                                 Ellenberger, Penny   
    11   0   DF000006                                     Wheatley, Lisa   
    12   0   DF000010                                      Isreal, David   
    13   0   DF000012                               Kastanakis, Theodore   
    14   0   DF000014                                Kouloumbre, Iaonnis   
    15   0   DF000019                          Marangos, Toula & Filipos   
    16   0   DF000020                                  Markiewicz, Robin   
    17   0   DF000022                              Papastefanou, Stanley   
    18   0   DF000026                                      Rouse, Donald   
    19   0   DF000027                                      Rouse, Donald   
    20   0   DF000032                                    Shiflett, Roger   
    21   0   DF000034                                     Solomon, Damon   
    22   0   DF000035                                     Solomon, Damon   
    23   0   DF000036                                  Stansbury, Joseph   
    24   0   DF000037                                       Reid, Gloria   
    25   0   DF000039                                   Wheatley, Vinnie   
    26   0   DF000041                                    Lerman, Abraham   
    27   0   DF000043                                    Bamba, Youssouf   
    28   0   DF000046               Mazouz, Abdelkarim & Argoum, Mohamed   
    29   0   DF000047                            Hynson, Jr., Raymond C.   
    ..  ..        ...                                                ...   
    47   0   DF000127                                    Azzouni, Jaafer   
    48   0   DF000132                                    Roberts, Melvin   
    49   0   DF000135  Diakgeorgiou, Euthoxia t/a "Georgey Dee's Food...   
    50   0   DF000153                 Winfield, Brian   "Hollywood Dogs"   
    51   0   DF000174                                      Holmes, Robin   
    52   0   DF000190                                      Rouse, Donald   
    53   0   OF000001                                    Strunk, Kum Cha   
    54   0   OF000002                                    Strunk, Kum Cha   
    55   0   OF000008                                   Johnson, Antoine   
    56   0   OF000014                         Saldana, Maria Teresa Luna   
    57   0   OF000015                                      Canty, Albert   
    58   0   OF000016                                       Hummel, Gary   
    59   0   OF000019                             Polychronis, Aristides   
    60   0   OF000020                            Jarava, Edgar & Gustavo   
    61   0   OF000021                            Jarava, Edgar & Gustavo   
    62   0   OF000022                            Jarava, Edgar & Gustava   
    63   0   OF000023                                       Hummel, Gary   
    64   0   OF000025                                     McCoy, Patrice   
    65   0   OF000040                                       Barr, Nomiki   
    66   0   OF000043                                 Gilliam, Gwendolyn   
    67   0   OF000046                                Elmonir, Elsayed M.   
    68   0   OF000049                                     Lewis, Cynthia   
    69   0   OF000050                                     Parrott, Aaron   
    70   0   OF000051         Vasquez, Emenegildo " Vasquez Fresh Fruit"   
    71   0   OF000053                                      Johns, Farley   
    72   0   OF000054               Guzman, Irma  "Irma's Best Hot Dogs"   
    73   0   OF000055                                    Azzouni, Jaafer   
    74   0   OF000056                  Bethea, Anthony "Biggs Food Cart"   
    75   0   OF000060                                       Brown, April   
    76   0   OF000061                                      Arlene Gordon   
    
                                               VendorAddr  \
    0   508 Washington Blvd, confined within 10 x 10 s...   
    1                    SEC Calvert & Madison on Calvert   
    2                            NEC Baltimore & Pine Sts   
    3                             NEC Light & Redwood Sts   
    4   On Hamburg St across from the rear end of the ...   
    5                             NWC Charles & Chase Sts   
    6                            SEC Lombard & Light Sts.   
    7             SW Ostend St & Sharp (Under the bridge)   
    8                               SWC Washington & Paca   
    9   NEC Ostend & Ridgely on Ostend (along fence on...   
    10                              Ridgely & Ostend Sts.   
    11  Conway & Howard St. behind Convention Ctr, on ...   
    12                     ES of Howard St near Camden St   
    13                                 NEC Redwood/Greene   
    14                           NWC Baltimore & Arch St.   
    15                           NWC of St Paul & Fayette   
    16  SEC Pratt & Howard, next to the Convention Center   
    17  SS of Baltimore St, approx. 75' west of Green ...   
    18  Howard St @ Corner of Convention Center Pratt ...   
    19                 Corner of 1300 Warner & Ostend St.   
    20  NEC Lee St/400-500 block (between the two pole...   
    21       On the island between Paca & Washington Blvd   
    22  200 W Conway & Sharp Sts behind the convention...   
    23                              NWC Lexington & Davis   
    24               Eastside Howard St/South of Pratt St   
    25    Conway & Howard St behind the Convention Center   
    26                             NEC Eutaw & Pratt Sts.   
    27                                  Hamburg & Russell   
    28               SWC Charles & Baltimore on Baltimore   
    29                                NEC Howard & Conway   
    ..                                                ...   
    47  NWC Market Pl & Lombard, to be on Market, mid-...   
    48     NS corner Howard & Camden (in middle of block)   
    49                             NWC Calvert & Saratoga   
    50                      NWC Holliday & lexington Sts.   
    51                      NWC Water St & S Frederick St   
    52  on Hamburg St between the Stadiums, during bas...   
    53                                     SE 700 West St   
    54                     NW W Camden, Washington & Paca   
    55                          800 Blk. Linden & Madison   
    56                              2803 Hawkins Point RD   
    57                         NWC MLK Blvd & W Baltimore   
    58                                33rd & Calvert Sts.   
    59                               NEC Wolfe & Monument   
    60                             NEC Rutland & Monument   
    61                       NEC Broadway & Jefferson St.   
    62                         SEC Wolfe & McElderry Sts.   
    63                              3100 Wyman Park Drive   
    64                          1800 Blk. of Monument St.   
    65  900 Blk. W. Baltimore St, NS of street, middle...   
    66         West Side of the 1600 Block St Paul Street   
    67                              SWC Maryland & Oliver   
    68                             SWC Pratt & Carrollton   
    69                                    NEC Gay & Front   
    70     3900 Block of E Monument, north side of street   
    71                                 Belvedere & Lanier   
    72                             NS Fleet, NEC Broadway   
    73  3500 Blk of N Calvert @ corner of University P...   
    74                             SWC of Joh & Caton Ave   
    75  SWC Greenmount & North Ave, to be on North Ave...   
    76  2300 Garrison Blvd, NWC, at the Garwyn Medical...   
    
                                                ItemsSold  \
    0         Grilled food, pizza slices, gyro sandwiches   
    1     Hot Dogs, Sausage, Snacks, Gum, Candies, Drinks   
    2     Hot dogs, Sausage, drinks, snacks, gum, & candy   
    3      Hot dogs, sausages, chips, snacks, drinks, gum   
    4   Large & Small beef franks, soft drinks, water,...   
    5                              Hot dogs, Sodas, Chips   
    6   Hot dogs, Sausages, Prepackaged snacks, Sodas,...   
    7                   Hot dogs, snacks, coffee and soda   
    8   Hot Dogs, Burgers, Sausage, Chips, Soda, Water...   
    9   Hot Dogs, Burgers, Sausage, Chips, Soda, Water...   
    10                  Hot dogs, hamburgers, soda, water   
    11                  Peanuts, Pistachios, Water & Soda   
    12                   Hot dogs, sodas, peanuts & chips   
    13                             Hot dogs, chips, sodas   
    14                            Hot dogs, chips & sodas   
    15                             Hot dogs, sodas, chips   
    16                     bottled water, soda & gatorade   
    17                     Hot dogs, chips, sodas & candy   
    18                          Hot dogs, sodas & peanuts   
    19                          Hot dogs, sodas & peanuts   
    20  nuts & confections, hot dogs,burgers,& tenders...   
    21                    soda, water, peanuts & hot dogs   
    22                    soda, water, peanuts & hot dogs   
    23                         Produce, fruit, vegetables   
    24                                     Peanuts, sodas   
    25  hot dogs, italian sausages, hamburgers, peanut...   
    26                          hot dogs, peanuts & sodas   
    27             Hot dogs, sodas, peanuts, chips, water   
    28         Beef hot dogs, chicken kabobs, soda, chips   
    29               Soda, water,peanuts, sunflower seeds   
    ..                                                ...   
    47  Chicken or lamb over rice, wraps & sandwiches,...   
    48  Assorted nuts, soda, water, Gatorade, cooked food   
    49  Grilled hot dogs, burgers, chicken sandwiches,...   
    50  Hot dogs, chips, candy, bottled water, canned ...   
    51                     Hot Dogs, Sodas, Waters, Chips   
    52                          water, drinks and peanuts   
    53                           Water, peanuts, hot dogs   
    54                                    Water & peanuts   
    55  Hot dogs, burgers, subs, soda, chips, water, c...   
    56           Mexican Food, Sodas, Water, Coffee,Chips   
    57                                        Water, Soda   
    58                              Hot dogs, Chips, Soda   
    59            Gyro Sandwiches, Hot Dogs, Chips, Sodas   
    60   Hot dogs, Chips, Sodas,Cookies, Snowballs, Juice   
    61  Hot dogs, Chips, Sodas, Cookies, Snowballs, Juice   
    62  Hot dogs, Chips, Sodas, Cookies, Snowballs, Juice   
    63                              Hot Dogs, Soda, Chips   
    64  Hot Dogs, Polish, Potato Chips, Soda, Juice, C...   
    65                  Hot dogs, hamburgers, chips, soda   
    66           Hot & Cold Beverages, Packaged Snacks, &   
    67  Hot dogs, chicken, lamb, rice, gyros, chips, s...   
    68  hot dogs, chili & cheese, popcorn, coffee, tea...   
    69                 Hot Dogs, Drinks, Snacks, Sausages   
    70  Mango, pineapple, strawberry, melon, cane, avo...   
    71  hot dogs, chips, cookies, candy, packaged good...   
    72  Hot dogs, Polish sausage, sodas, chips, juices...   
    73  Mediterranean wraps & sandwiches, chicken or b...   
    74  Hot dogs, chips, cookies, soda, water, juice, ...   
    75              Hot Dogs, Snacks, Soda & Water, Candy   
    76  Hot Dogs, Hamburgers, Chips, Candy, Gum, Soda,...   
    
                                               Cart_Descr  St  \
    0   Two add'l tables to be added to current 6' tab...  MD   
    1                                            Pushcart  MD   
    2                                            Pushcart  MD   
    3                                            Pushcart  MD   
    4                       grey pushcart on three wheels  MD   
    5                pushcart with hot/cold running water  MD   
    6                                        Hot dog cart  MD   
    7               2 Carts on wheels, 4 tables on wheels  MD   
    8                                Hot Dog Cart & Grill  MD   
    9                                Hot Dog Cart & Grill  MD   
    10                                   Pushcart & table  MD   
    11                             3 x 4 table, 2 coolers  MD   
    12                                       Hot dog cart  MD   
    13                       stainless steel hot dog cart  MD   
    14                       Stainless steel hot dog cart  MD   
    15                       Stainless steel hot dog cart  MD   
    16                    pushcart - metal cart & dollies  MD   
    17                       stainless steel hot dog cart  MD   
    18  wagon, standard 3' x 6' table w/extensions not...  MD   
    19  wagon, standard 3' x 6' table w/extensions not...  MD   
    20  orange pushcart w/totes & wheels for drinks ta...  MD   
    21  Plastic cart w/wheels, 3 shelf metal pushcart ...  MD   
    22  Plastic cart w/wheels, 3 shelf metal pushcart ...  MD   
    23                                       pickup truck  MD   
    24                                         1-6' table  MD   
    25                                hot dog cart, table  MD   
    26                                           Handcart  MD   
    27                                       Hot dog cart  MD   
    28                                           Pushcart  MD   
    29                                    3x6 brown table  MD   
    ..                                                ...  ..   
    47                                           pushcart  MD   
    48                                2 coolers, pushcart  MD   
    49                                           pushcart  MD   
    50                                           Pushcart  MD   
    51                                        Hotdog Cart  MD   
    52                                              table  MD   
    53                                      one table 6x3  MD   
    54                                      one table 6x3  MD   
    55                                           pushcart  MD   
    56                                   Mobile Cart Unit  MD   
    57                                  6' table & cooler  MD   
    58                                           Pushcart  MD   
    59                                           Pushcart  MD   
    60                       Stainless steel hot dog cart  MD   
    61                       Stainless steel hot dog cart  MD   
    62                       Stainless steel hot dog cart  MD   
    63                                       Hot dog cart  MD   
    64                                           Pushcart  MD   
    65                                           Pushcart  MD   
    66                                           Handcart  MD   
    67                                           Pushcart  MD   
    68                                       hot dog cart  MD   
    69                   2 1/2" x 3 1/2" Compact pushcart  MD   
    70                                      6' x 3' table  MD   
    71                                           pushcart  MD   
    72                                       hot dog cart  MD   
    73                                           Pushcart  MD   
    74                                           pushcart  MD   
    75                  Hot Dog Cart & 1 cooler on wheels  MD   
    76                         Pushcart, Cooler on wheels  MD   
    
                                               Location 1  
    0     Towson 21204\n(39.28540000000, -76.62260000000)  
    1   Owings Mill 21117\n(39.29860000000, -76.612800...  
    2   Owings Mill 21117\n(39.28920000000, -76.626700...  
    3   Owings Mill 21117\n(39.28870000000, -76.613600...  
    4   Baltimore 21239\n(39.27920000000, -76.62200000...  
    5   Baltimore 21244\n(39.30250000000, -76.61610000...  
    6   Baltimore 21206\n(39.28760000000, -76.61350000...  
    7   Baltimore 21236\n(39.27520000000, -76.62030000...  
    8   Baltimore 21217\n(39.28530000000, -76.62270000...  
    9   Baltimore 21217\n(39.27720000000, -76.62650000...  
    10  Baltimore 21205\n(39.27710000000, -76.62690000...  
    11    Laurel 20723\n(39.28420000000, -76.61890000000)  
    12  Randallstown 21133\n(39.28530000000, -76.61900...  
    13  Baltimore 21224\n(39.28860000000, -76.62360000...  
    14  Baltimore 21224\n(39.28920000000, -76.62530000...  
    15  Baltimore 21224\n(39.29050000000, -76.61400000...  
    16  Baltimore 21212\n(39.28620000000, -76.61910000...  
    17  Baltimore 21237\n(39.28730000000, -76.62500000...  
    18  Baltimore 21218\n(39.28610000000, -76.61900000...  
    19  Baltimore 21218\n(39.27650000000, -76.62400000...  
    20  Baltimore 21230\n(39.28200000000, -76.62090000...  
    21  Baltimore 21202\n(39.28520000000, -76.62280000...  
    22  Baltimore 21202\n(39.28430000000, -76.61780000...  
    23  Baltimore 21201\n(39.29130000000, -76.61200000...  
    24  Baltimore 21244\n(39.28620000000, -76.61890000...  
    25    Laurel 20723\n(39.28420000000, -76.61880000000)  
    26  Owings Mill 21117\n(39.28640000000, -76.620600...  
    27  Baltimore 21217\n(39.28000000000, -76.62410000...  
    28  Baltimore 21224\n(39.28950000000, -76.61530000...  
    29  Glen Burnie 21060\n(39.28430000000, -76.618900...  
    ..                                                ...  
    47  Windsor Mill 21244\n(39.28820000000, -76.60700...  
    48  Baltimore 21212\n(39.28540000000, -76.61900000...  
    49  Baltimore 21221\n(39.29250000000, -76.61260000...  
    50  Baltimore 21239\n(39.29140000000, -76.61040000...  
    51  Pikesville 21208\n(39.28880000000, -76.6081000...  
    52  Baltimore 21218\n(39.27930000000, -76.62250000...  
    53  Baltimore 21224\n(39.27800000000, -76.62620000...  
    54  Baltimore 21224\n(39.28560000000, -76.62230000...  
    55  Edgewood 21040\n(39.29850000000, -76.62110000000)  
    56  Baltimore 21227\n(39.20270000000, -76.55870000...  
    57  Baltimore 21230\n(39.28910000000, -76.62820000...  
    58  Baltimore 21221\n(39.32840000000, -76.61360000...  
    59  Baltimore 21237\n(39.29860000000, -76.59100000...  
    60  Baltimore 21213\n(39.29850000000, -76.59210000...  
    61  Baltimore 21213\n(39.29640000000, -76.59390000...  
    62  Baltimore 21213\n(39.29730000000, -76.59070000...  
    63  Baltimore 21221\n(39.32520000000, -76.62200000...  
    64  Baltimore 21213\n(39.29850000000, -76.59190000...  
    65  Pasadena 21122\n(39.28890000000, -76.63260000000)  
    66    Towson 21204\n(39.30720000000, -76.61480000000)  
    67  Baltimore 21211\n(39.30650000000, -76.61770000...  
    68  Baltimore 21201\n(39.28560000000, -76.63670000...  
    69    Laurel 20707\n(39.29330000000, -76.60780000000)  
    70  Rosedale 21237\n(39.29980000000, -76.56500000000)  
    71  Baltimore 21215\n(39.35320000000, -76.66470000...  
    72  Baltimore 21224\n(39.28470000000, -76.59320000...  
    73  Windsor Mill 21244\n(39.33050000000, -76.61490...  
    74  Baltimore 21229\n(39.25990000000, -76.66540000...  
    75  Baltimore 21229\n(39.31110000000, -76.60970000...  
    76  Pikesville 21208\n(39.31440000000, -76.6770000...  
    
    [77 rows x 8 columns]


### 3º: Eliminating unusable variables

If you check dfVendors DataFrame, there will be some unmeaningful variables like 'Id' and 'St'. So you can remove it.


```python
print(dfVendors[["Id", "St"]].head())
```

       Id  St
    0   0  MD
    1   0  MD
    2   0  MD
    3   0  MD
    4   0  MD



```python
del dfVendors['Id']
del dfVendors['St']
print(dfVendors.columns)
```

    Index(['LicenseNum', 'VendorName', 'VendorAddr', 'ItemsSold', 'Cart_Descr',
           'Location 1'],
          dtype='object')


### 4º: Changing Variable Name

Using Data Frame rename method:


```python
dfVendors = dfVendors.rename(columns={'Location 1': 'Location'})
print(dfVendors.columns)
```

    Index(['LicenseNum', 'VendorName', 'VendorAddr', 'ItemsSold', 'Cart_Descr',
           'Location'],
          dtype='object')


### 5º: Extracting Latitude and Longitude from Location

Spliting and Replacing Strings to Create Lat and Long variables


```python
a = dfVendors['Location'].str.split('\n', expand=True)
a = a[1].str.split(', ', expand=True)
lat = a[0].str.replace('(', '')
long = a[1].str.replace(')', '')
dfVendors['lat'] = lat
dfVendors['long'] = long
```


```python
print(dfVendors[["Location", "lat", "long"]].head())
```

                                                Location             lat  \
    0    Towson 21204\n(39.28540000000, -76.62260000000)  39.28540000000   
    1  Owings Mill 21117\n(39.29860000000, -76.612800...  39.29860000000   
    2  Owings Mill 21117\n(39.28920000000, -76.626700...  39.28920000000   
    3  Owings Mill 21117\n(39.28870000000, -76.613600...  39.28870000000   
    4  Baltimore 21239\n(39.27920000000, -76.62200000...  39.27920000000   
    
                  long  
    0  -76.62260000000  
    1  -76.61280000000  
    2  -76.62670000000  
    3  -76.61360000000  
    4  -76.62200000000  


### 6º: Hot Dogs and Pizza in Baltimore

How to check which vendor sells Hot Dogs in Baltimore?


```python
dfVendors["hotdog"] = dfVendors["ItemsSold"].str.contains("hot dog", case=False)
print(dfVendors[["ItemsSold", "hotdog"]].head())
```

                                               ItemsSold  hotdog
    0        Grilled food, pizza slices, gyro sandwiches   False
    1    Hot Dogs, Sausage, Snacks, Gum, Candies, Drinks    True
    2    Hot dogs, Sausage, drinks, snacks, gum, & candy    True
    3     Hot dogs, sausages, chips, snacks, drinks, gum    True
    4  Large & Small beef franks, soft drinks, water,...   False



```python
dfVendors["pizza"] = dfVendors["ItemsSold"].str.contains("pizza", case=False)
print(dfVendors[["ItemsSold", "pizza"]].head())
```

                                               ItemsSold  pizza
    0        Grilled food, pizza slices, gyro sandwiches   True
    1    Hot Dogs, Sausage, Snacks, Gum, Candies, Drinks  False
    2    Hot dogs, Sausage, drinks, snacks, gum, & candy  False
    3     Hot dogs, sausages, chips, snacks, drinks, gum  False
    4  Large & Small beef franks, soft drinks, water,...  False


### 7º Getting city names

Extract city names by using str.extract method


```python
city = dfVendors['Location'].str.extract('([a-zA-Z ]+)', expand=False).str.strip()
dfVendors["city"] = city
print(dfVendors[["Location", "city"]].head())
```

                                                Location         city
    0    Towson 21204\n(39.28540000000, -76.62260000000)       Towson
    1  Owings Mill 21117\n(39.29860000000, -76.612800...  Owings Mill
    2  Owings Mill 21117\n(39.28920000000, -76.626700...  Owings Mill
    3  Owings Mill 21117\n(39.28870000000, -76.613600...  Owings Mill
    4  Baltimore 21239\n(39.27920000000, -76.62200000...    Baltimore

