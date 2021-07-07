test_that("Credential functionality works", {

  # Test storing credentials
  or_login <- Sys.getenv("CEBRAP_LOGIN")
  or_pwd <- Sys.getenv("CEBRAP_LOGIN")
  expect_message(store_credentials(or_login, or_pwd), regexp = "success")

  # Test input types
  expect_error(store_credentials(NULL, "pass"))
  expect_error(store_credentials("login", NULL))

  # Test recovering credentials
  store_credentials("test", "test")
  expect_equal(recover_env_credentials(), c("test", "test"))
  store_credentials("", "")
  expect_null(recover_env_credentials())
  expect_equal(get_cebrap_credentials("test", "test"), c("test", "test"))
  store_credentials("test", "test")
  expect_equal(get_cebrap_credentials(NULL, NULL), c("test", "test"))
  store_credentials("", "")
  expect_error(get_cebrap_credentials(NULL, NULL))
  store_credentials(or_login, or_pwd)
})



