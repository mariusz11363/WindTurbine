#' Wind energy
#' @description Wind energy calculations
#' @param den Air density |kg/m^3|
#' @param Vm Momentary speed of the air stream |m/s|
#' @param timeV Time of momentary wind speed |s|
#' @param unit Wind energy unit, accepts values TRUE or FALSE
#' @examples windEnergy(den = 1.23,Vm = 5,timeV = 3600)
#' @return Default values: 'den' = 1.23
#' @references http://www.wmae.pl/userfiles/file/Aktualnosci/poradnik_a5.pdf
#' @export
windEnergy <- function(den, Vm, timeV, unit){
  #stop
  if(missing(Vm)==T) stop("Enter the numeric value of the parameter 'Vm'")
  if(missing(timeV)==T) stop("Enter the numeric value of the parameter 'timeV'")

  #Default settings
  if(missing(den)==T){
    den <- 1.23
  }

  if(missing(unit)==T){
    unit <- T
  }else if(unit==F){
    unit <- "f"
  }

  #stop
  if(!is.numeric(den)==T) stop("The 'den' value must be given as numeric")
  if(!is.numeric(Vm)==T) stop("The 'Vm' value must be given as numeric")
  if(!is.numeric(timeV)==T) stop("The 'timeV' value must be given as numeric")
  if(unit!="f" && unit!=T) stop("unit as TRUE or FALSE")
  if(timeV>3600 | timeV<3600) message("The year is 3600 seconds")

  if(unit=="f"){
    E <- den*(Vm^3/2)*timeV
    E
  }else{
    E <- den*(Vm^3/2)*timeV
    paste(E,"J")
  }


}
