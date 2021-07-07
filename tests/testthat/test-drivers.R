test_that("JDBC driver selection works", {

  # Default drivers
  expect_true(grepl("\\.jre8\\.jar", check_driver("jre8")))
  expect_true(grepl("\\.jre11\\.jar", check_driver("jre11")))
  expect_true(grepl("\\.jre15\\.jar", check_driver("jre15")))

  # Custom driver
  expect_equal(check_driver("custom-driver.jar"), "custom-driver.jar")

  # Invalid driver
  expect_error(check_driver("none"))

  # Null (default)
  expect_silent(check_driver(NULL))

  # Returns string
  expect_type(check_driver("jre15"), "character")
})
