context("diameterRotor")
test_that("diameterRotor test", {

  expect_that(diameterRotor(E = 3000, Vmean = 4.5, totalEff = 0.3), is_a("character"))
  expect_that(diameterRotor(E = 3000, Vmean = 4.5, totalEff = 0.3, unit = F), is_a("numeric"))
  expect_that(diameterRotor(E = c(3000,3500,4000), Vmean = 4.5, totalEff = 0.3, unit = F), is_a("numeric"))
  expect_error(diameterRotor(E = c(3000,3500,4000), Vmean = 4.5, totalEff = 0.3, unit = "a"))

  diameter <- function(x,y){

    diameterRotor(E = x, Vmean = y, totalEff = 0.3, unit = F)
  }

  expect_true(diameter(x=3000,y=4.5)<diameter(x=4000,y=4.5))
  expect_false(diameter(x=3000,y=4.5)<diameter(x=4000,y=6))

})



