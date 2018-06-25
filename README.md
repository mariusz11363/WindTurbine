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


```{r}
load("dane.RData")
enableJIT(3)
plotly_chartmaps <- function(type, colory, polcolor="white", start=-40,stop=40, by=1){
  #a <- as.data.frame(dane[[type]][c(1,3,4,5)])
  a <- dane[[type]][c(1,3,4,5)]
a$hh <-  substr(a$Date, start = 12,stop = 13) %>%as.numeric()
a <- a %>%
  filter(hh == 0 | hh == 2 | hh == 4 | hh == 6 | hh == 8 | hh == 10 | hh == 12 | hh == 14 | hh == 16 | hh == 18 | hh == 20 | hh == 22 )%>%
#a <- a %>%  
#  filter(x == 14 | x == 15 | x == 16 | x == 17 | x == 18 | x == 19 | x == 20 | x == 21 | x == 22 | x == 23 | x == 24 | x == 25)

#a <- a %>%
#filter(y == 49 | y == 50 | y == 51 | y == 52 | y == 53 | y == 54 | y == 55)%>%

  plot_ly()%>%
  plotly::add_contour(
    name=type,
    x = ~x, 
    y = ~y,
    z = ~as.matrix(z),
    frame = ~Date,
    contours = list(
      
      start = start,
      end = stop,
      size = by,
      showlabels = T,
      title="Nazwa"
#type = 'azimuthal equal area'
      ),
          colors=colorRamp(colory),
    reversescale =F,
   line = list(smoothing = 0)
  )%>%
  highlight("plotly_click")%>%
 add_trace(x=polska$x,y=polska$y,type = 'scatter', mode = 'lines', 
            line = list(color = polcolor,
                        width = 2),  hoverinfo = 'text')%>%
 
  layout(xaxis = list(title = "longitude",range=c(14,25)),
         yaxis = list(#side = 'left',
 range=c(49,55), title = 'latitude', showgrid = T#, zeroline = T
))


a
}
```
