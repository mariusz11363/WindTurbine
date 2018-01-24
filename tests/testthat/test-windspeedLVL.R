context("windspeedLVL")
test_that("windspeedLVL test", {

  expect_that(windspeedLVL(Vo = 12, H = seq(50,100,10), acc=1, unit=FALSE), is_a("numeric"))
  expect_that(windspeedLVL(Vo = 12, H = seq(50,100,10), acc=1, unit=T), is_a("character"))
  expect_error(windspeedLVL(Vo = 12, H = seq(50,100,10), acc=1, unit="ab"))
  expect_error(windspeedLVL(Vo = 12, H = seq(50,100,10), acc="1", unit="ab"))
})
