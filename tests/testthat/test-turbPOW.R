context("turbPOW")

test_that("turbPOW test", {

  expect_that(turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = F), is_a("numeric"))
  expect_error(turbPOW(areoeff = 0.4, actisurf = 314, mecheff = 0.9,unit = "Wat"))
  expect_error(turbPOW(areoeff = 0.4, mecheff = 0.9,unit = "abc"))
  expect_match(turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = T), "W")
  expect_match(turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = "GW"), "GW")
  expect_true(turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = F)<turbPOW(areoeff = 0.6, mecheff = 1, actisurf = 314,unit = F))
  expect_true(turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = T)==turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = "W"))
  expect_false(turbPOW(areoeff = 0.3, mecheff = 1, actisurf = 314,unit = "W")==turbPOW(areoeff = 0.4, mecheff = 0.9, actisurf = 314,unit = "W"))
})

