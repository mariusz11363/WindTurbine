% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/turbPOW.R
\name{turbPOW}
\alias{turbPOW}
\title{Power of a wind turbine}
\usage{
turbPOW(den, areoeff, mecheff, actisurf, wind, unit, acc)
}
\arguments{
\item{den}{Air density |kg/m^3|}

\item{areoeff}{Aerodynamic efficiency |-| 0.0 - 1.0}

\item{mecheff}{Mechanical efficiency |-| 0.0 - 1.0}

\item{actisurf}{Active surface of propeller |m^2|}

\item{wind}{Wind speed |m/s|}

\item{unit}{Energy unit |W, kW, MW, GW, TW| or FALSE.}

\item{acc}{Decimal scale}
}
\value{
If the unit is FALSE then values are generated as W. The percentage value 'areoeff' or 'mecheff' convert to the 0-1 form. Default values: 'air density' = 1.23, 'areoeff' = 1, 'mecheff' = 1, 'wind' = 1, 'unit' = as a numeric value (Wat), 'acc' = 1
}
\description{
Function calculating the power of a wind turbine
}
\examples{
power <- turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = "kw")
vector <- turbPOW(areoeff = 0.4, mecheff = 0.9, wind=c(1:10), actisurf = 314)
}
\references{
https://www.odnawialne-firmy.pl/wiadomosci/pokaz/82,moc-turbiny-wiatrowej-jak-obliczyc
}
