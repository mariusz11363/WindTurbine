#' Power of a wind turbine
#' @description Function calculating the power of a wind turbine
#' @param den Air density |kg/m^3|
#' @param areoeff Aerodynamic efficiency |-| 0.0 - 1.0
#' @param mecheff Mechanical efficiency |-| 0.0 - 1.0
#' @param actisurf Active surface of propeller |m^2|
#' @param wind Wind speed |m/s|
#' @param unit Energy unit |W, kW, MW, GW, TW| or FALSE.
#' @param acc Decimal scale
#' @examples power <- turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = "kw")
#' @examples vector <- turbPOW(areoeff = 0.4, mecheff = 0.9, wind=c(1:10), actisurf = 314)
#' @return If the unit is FALSE then values are generated as W. The percentage value 'areoeff' or 'mecheff' convert to the 0-1 form. Default values: 'air density' = 1.23, 'areoeff' = 1, 'mecheff' = 1, 'wind' = 1, 'unit' = as a numeric value (Wat), 'acc' = 1
#' @references https://www.odnawialne-firmy.pl/wiadomosci/pokaz/82,moc-turbiny-wiatrowej-jak-obliczyc
#' @export
turbPOW <- function(den,areoeff,mecheff, actisurf, wind, unit, acc){
#stop
  if(missing(actisurf)==T) stop("Provide the surface of the propeller wheel in variable 'actisurf'")

  #Default settings
  if(missing(den)==T){
    den <- 1.23
  }

  if(missing(areoeff)==T){
    areoeff <- 1
  }

  if(missing(mecheff)==T){
    mecheff <- 1
  }

  if(missing(wind)==T){
    wind <- 1
  }

  if(missing(unit)==T){
    unit <- "W"
  }else if(unit==TRUE){
    unit <- "W"
  }else if(unit==FALSE){
    unit <- "f"
  }
  if(missing(acc)==T){
    acc <- 1
  }

  unit <- tolower(unit)
  #stop
  if(!is.numeric(den)==T) stop("The 'den' value must be given as numeric")
  if(!is.numeric(areoeff)==T) stop("The 'areoeff' value must be given as numeric")
  if(!is.numeric(mecheff)==T) stop("The 'mecheff' value must be given as numeric")
  if(!is.numeric(wind)==T) stop("The 'wind' value must be given as numeric")
  if(!is.numeric(acc)==T) stop("The 'accf' value must be given as character")
if(unit!="w" && unit!="kw" && unit!="mw" && unit!="gw" && unit!="gw" && unit!="tw" && unit!="f" && unit!=T)  stop("Enter the correct unit of energy (W,kW,MW,GW or TW) or TRUE/FALSE")


  power <-  round(0.5*den*areoeff*mecheff*actisurf*wind^3,acc)

  if(unit=="w"){
    paste(power,"W")
  }
  else if(unit=="kw"){
    paste(power/1000,"kW")
  }
  else if(unit=="mw"){
    paste(power/1000000,"MW")
  }
  else if(unit=="gw"){
    paste(power/1000000000,"GW")
  }
  else if(unit=="tw"){
    paste(power/1000000000000,"TW", sep="")
  }
  else{
    print(power)
  }
}
