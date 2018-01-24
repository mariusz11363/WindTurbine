#' Wind rose
#' @description Generating a wind rose plot
#' @param coor Geographical coordinates written as uppercase (N, NE, E, SE, S, SW, W, NW)
#' @param data Vector frequency of the occurrence of a given wind direction
#' @param title Chart title
#' @param subTitle Subtitle plot
#' @examples generate(coor = c("N","NE","E","SE","S","SW","W","NW"),data = c(2,7,7.5,2.75,12.75,18,1.25,3.25))
#' @return The wind rose generates a graph which contains an 8-point scale (N, NE, E, SE, S, SW, W, NW)
#' @export
generate <- function(coor,data,title,subTitle){
  #stop
  if(length(coor)!=8) stop("'coor' must have 8 elements")
  if(length(data)!=8) stop("'data' must have 8 elements")
  if(!is.numeric(data)==T) stop("The 'coor' value must be given as character")

  if(missing(title)==T){
      title <- NULL
  }

  if(missing(subTitle)==T){
    subTitle <- NULL
  }

  coor <- gsub("NE", 45, coor)
  coor <- gsub("SE", -45, coor)
  coor <- gsub("SW", -135, coor)
  coor <- gsub("NW", -225, coor)
  coor <- gsub("N", 90, coor)
  coor <- gsub("E", 0, coor)
  coor <- gsub("S", -90, coor)
  coor <- gsub("W", -180, coor)

  kat <- as.numeric(coor)


  data[data == 0] <- 0.1


  #przeliczanie wartosci
  radian <- kat*2*pi/360
  tangens <- tan(radian)
  cosinus <- cos(radian)
  x <- cosinus*data
  y <- (x*tangens)

  maks <- max(data)

  lim <- max(maks)
  limy <- max(maks)


  #generowanie okregów
  lvl_r <- rep(seq(0,round(maks,0),2),each=31)
  kat_r <- seq(from=0,to=-360, by=-12)
  radian_r <- kat_r*2*pi/360
  tangens_r <- tan(radian_r)
  cosinus_r <- cos(radian_r)
  x_r <- cosinus_r*lvl_r
  y_r <- (x_r*tangens_r)

  #wykres
  plot(x_r,y_r, xlim=c(-lim, lim), ylim=c(-limy, limy), ann=FALSE, xaxt='n', yaxt='n', type="l")+
    polygon(x,y, col="green", border=NULL, lty=1, lwd = 2)+
    lines(x_r,y_r)+
    abline(h=0,v=0)+
    text(seq(0,round(maks,0),2),y=3,labels=(c(NA,seq(2,round(maks,0),2))))
  text(0, max(y_r)-0.5, "N", col = "red",  cex = 2)
  text(0, -max(y_r)+0.5, "S", col = "red",  cex = 2)
  text(max(x_r)-0.5,0, "E", col = "red",  cex = 2)
  text(-max(x_r)+0.5,0, "W", col = "red",  cex = 2)
  title(main=title, sub=subTitle)
  message("Graph generated")
}
