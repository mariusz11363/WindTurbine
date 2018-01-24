#' Wind speed at different altitude
#' @description Conversion of wind speed at the indicated height
#' @param Vo Wind speed at the measured height |m/s|
#' @param ho Height of wind measurement |m|
#' @param H Conversion of wind speed to given height |m|
#' @param n Roughness of the area |-| 0-1
#' @param unit Wind speed unit |m/s|, accepts values TRUE or FALSE
#' @param acc Decimal scale
#' @examples windspeedLVL(Vo = 12, H = 100, acc=1)
#' @examples  windspeedLVL(Vo = 12, H = seq(50,100,10), acc=1, unit=FALSE)
#' @return Default values: 'ho' = 10, 'n' = 0.2, 'acc' = 0, 'unit' = TRUE
#' @seealso Value for 'n': "https://github.com/mariusz11363/WindTurbine/blob/master/README.md"
#' @export
windspeedLVL <- function(Vo,ho,H,n,unit,acc){

  #Default settings
  if(missing(ho)==T){
    ho <- 10
  }

  if(missing(n)==T){
    n <- 0.2
  }

  if(missing(acc)==T){
    acc <- 0
  }

  if(missing(unit)==T){
    unit <- T
  }else if(unit==F){
    unit <- "f"
  }

  #stop
  if(!is.numeric(Vo)==T) stop("The 'Vo' value must be given as numeric")
  if(!is.numeric(ho)==T) stop("The 'ho' value must be given as numeric")
  if(!is.numeric(H)==T) stop("The 'H' value must be given as numeric")
  if(!is.numeric(n)==T) stop("The 'n' value must be given as numeric")
  if(!is.numeric(acc)==T) stop("The 'acc' value must be given as numeric")
  if(isTRUE(unit)==F && unit!="f") stop("Unit accepts TRUE/FALSE values")

  if(unit=="f"){
    HmeanV <- round(Vo*((log(H/n)/log(ho/n))),acc)
    print(HmeanV)
  }else{
    HmeanV <- round(Vo*((log(H/n)/log(ho/n))),acc)
    paste(HmeanV, "m/s")
  }

}
