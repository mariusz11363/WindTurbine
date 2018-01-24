context("Generate")
test_that("Generate Test", {

  expect_error(generate(coor = c("N","NE"),data = c(2,7,7.5,2.75,12.75,18,1.25,3.25)))
  expect_error(generate(coor = c("N","NE","E","SE","S","SW","W","NW"),data = c(2,7,7.5,2.75,12.75)))
  expect_error(generate(coor = c("N","NE","E","SE","S","SW","W","NW"),data = c("2","7","7.5","2.75","12.75","18","1.25","3.25")))
  expect_message(generate(coor = c("N","NE","E","SE","S","SW","W","NW"),data = c(2,7,7.5,2.75,12.75,18,1.25,3.25)), "Graph generated")
})
