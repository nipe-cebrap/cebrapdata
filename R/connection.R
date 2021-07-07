#' Establish a connection to Cebrap's database
#'
#' `set_connection()` function is used to establish a connection with authentication
#' to Cebrap's Brazilian Legislative Database using JDBC. It does so by starting
#' the appropriate driver and sending login information to Cebrap's MS-SQL Server.
#' Users can choose which version o Microsoft's JDBC to utilize and also have the
#' option to save authentication info in the system path for improved security.
#'
#' @param login User login
#' @param password User password
#' @param driver A `string` containing the version of JDBC driver to use or a path
#' for a valid JDBC driver (with `.jar` extension). Pre-built valid options for JDBC
#' drivers are:
#' * `jre8`
#' * `jre11`
#' * `jre15`
#'
#' @param verbose Should the function display messages? Defaults to `TRUE`
#'
#' @note To use this and other functions from `cebrapdata`, users must have `rJava`
#' and Java JDK installed.
#'
#'
#' @export

set_connection <- function(login = NULL, password = NULL, driver = NULL, verbose = TRUE){

  # Check JDBC driver
  dvr <- check_driver(driver)

  # Check credentials
  auth <- get_cebrap_credentials(login, password)

  # Establish connection
  jdbc_ob <- RJDBC::JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver", dvr)
  conn <- RJDBC::dbConnect(jdbc_ob, "jdbc:sqlserver://200.144.255.200",
                           auth[1], auth[2])

  # Return
  if(verbose) cli::cli_alert_success("Connection established.")
  return(conn)
}


# Function for disconection
remove_connection <- function(conn) NULL

