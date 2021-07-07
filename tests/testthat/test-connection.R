test_that("connection to server works", {

  # Input checks
  expect_error(set_connection("e55", NULL))

  # Connection with invalid login and pass
  expect_error(set_connection("test", "test"))
})
