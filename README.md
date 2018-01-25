Calculations for a wind turbine
=========

Instalation
----------

``` r
devtools::install_github("mariusz11363/WindTurbine")
```

Usage
--------

``` r
library('WindTurbine')
```

### Power of a wind turbine

``` r
turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = "kw")
#> [1] "0.0695 kW"
turbPOW(areoeff = 0.4, mecheff = 0.9, wind=c(1:10), actisurf = 314)
#> [1] 69.5  556.2  1877.0  4449.3  8690.0 15016.2 23845.2 35594.0 50679.8 69519.6
```

### Wind speed at altitude

``` r
windspeedLVL(Vo = 12, H = 100, acc=1)
#> [1] "19.1 m/s"
windspeedLVL(Vo = 12, H = seq(50,100,10), acc=1, unit=T)
#> [1] "16.9 m/s" "17.5 m/s" "18 m/s"   "18.4 m/s" "18.7 m/s" "19.1 m/s"
```

### Diameter of the wind turbine propeller

``` r
diameterRotor(E = 3000, Vmean = 4.5, totalEff = 0.3)
#> [1] "5.1 [m]"
```

### Wind energy calculations

``` r
windEnergy(den = 1.23,Vm = 5,timeV = 3600)
#> [1] "276750 J"
```

### Generation of a Wind Rose graph

``` r
generate(coor = c("N","NE","E","SE","S","SW","W","NW"),data = c(2,7,7.5,2.75,12.75,18,1.25,3.25))
#> #generates a graph
```

### Type of terrain (n)

| Energy %| n      | Type of terrain                                        |
|:--------|:-------|:-------------------------------------------------------|
| 100     | 0.0002 | Water surface                                          |
| 73      | 0.0024 | Open space, e.g. an airport area                       |
| 52      | 0.03   | Open farmland with single buildings                    |
| 45      | 0.055  | Farmland with few buldings                             |
| 39      | 0.1    | Farmland with few buldings and high technical barriers |
| 31      | 0.2    | Agricultural area with a large number of buildings     |
| 24      | 0.4    | Villages or small towns, forest, or undulating terrain |
| 18      | 0.8    | Big city with tall buildings                           |
| 13      | 1.6    | Large cities with tall buildings and skyscrapers       |
