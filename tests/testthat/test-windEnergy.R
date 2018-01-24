context("windEnergy")
test_that("windEnergy Test", {

  expect_that(windEnergy(den = 1.23,Vm = 10,timeV = 3600,unit = F), is_a("numeric"))
  expect_that(windEnergy(den = 1.23,Vm = 10,timeV = 3600,unit = T), is_a("character"))
  expect_that(windEnergy(den = 1.23,Vm = seq(10,30,5),timeV = 3600,unit = F), is_a("numeric"))
  expect_error(windEnergy(den = 1.23,Vm = 10,timeV = 3600,unit = "a"))
  expect_message(windEnergy(den = 1.23,Vm = 10,timeV = 3200))
  expect_match(windEnergy(den = 1.23,Vm = 10,timeV = 3600, unit = T), "J")
})
