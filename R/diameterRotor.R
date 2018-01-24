#' Diameter of the wind turbine propeller
#' @description Calculation of the propeller diameter according to the electricity demand
#' @param den Air density |kg/m^3|
#' @param  E Electricity demand |kWh/year|
#' @param Vmean Average wind speed |m/s|
#' @param t Time |s|
#' @param totalEff Overall efficiency of the wind turbine (gear, rotor, generator) |0-1|
#' @param unit Unit of propeller diameter |m|, accepts values TRUE or FALSE
#' @param acc Decimal scale
#' @examples diameterRotor(E = 3000, Vmean = 4.5, totalEff = 0.3)
#' @return Default values: 't' = 8760, 'den' = 1.23, 'acc' = 1, 'unit' = TRUE, 'acc' = 1
#' @references http://www.uwm.edu.pl/kolektory/silownie/obliczenia.html
#' @export
diameterRotor <- function(den, E, Vmean, t,totalEff,unit,acc){

#stop
  if(missing(totalEff)==T) stop("Enter the numeric value of the parameter 'totalEff'")
  if(missing(E)==T) stop("Enter the numeric value of the parameter 'E'")
  if(missing(Vmean)==T) stop("Enter the numeric value of the parameter 'Vmean'")
  if(missing(totalEff)==T) stop("Enter the numeric value of the parameter 'totalEff'")


  #Default settings
  if(missing(t)==T){
    t <- 8760
  }

  if(missing(den)==T){
    den <- 1.23
  }

  if(missing(acc)==T){
    acc <- 1
  }

  if(missing(unit)==T){
    unit <- T
  }else if(unit==F){
    unit <- "f"
  }

#stop
  if(isTRUE(unit)==F && unit!="f") stop("Unit accepts TRUE/FALSE values")
  if(!is.numeric(den)==T) stop("The 'den' value must be given as numeric")
  if(!is.numeric(E)==T) stop("The 'E' value must be given as numeric")
  if(!is.numeric(Vmean)==T) stop("The 'Vmean' value must be given as numeric")
  if(!is.numeric(t)==T) stop("The 't' value must be given as numeric")
  if(!is.numeric(totalEff)==T) stop("The 'totalEff' value must be given as numeric")
  if(!is.numeric(acc)==T) stop("The 'acc' value must be given as numeric")


  diameter <- round(sqrt((2000*E)/(den*Vmean^3*t*totalEff*pi))*2,acc)

  if(unit==T){
    paste(diameter,"[m]")
  }else if(unit=="f"){
    print(diameter)
  }
}
