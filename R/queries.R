#' Get tables from Cebrap's Database
#'
#' `get_cebrap_table()` fetches tables from the Cebrap's Brazilian Legislative Database.
#' To use it, users must provide the name of an actual table in the database and
#' the function will handle the SQL queries under the hood. Is it also possible
#' to customize the function call to select just a sample of rows or the name
#' of the columns.
#'
#' @param conn A JDBC connection object created by the \code{\link{set_connection}} function
#' @param table A `string` with the name of an existing table in Cebrap's Database
#' @param head Should the function return only the five first rows from the table? To
#' save server resources, this defaults to `TRUE`
#' @param verbose Should the function display messages? Defaults to `TRUE`
#'
#' @note Currently, `get_cebrap_table()` only works with the `Congresso_BE` database.
#'
#' @examples
#' \dontrun{
#' # Request a table
#' conn <- set_connection(login = "login", password = "pass")
#' senadores <- get_cebrap_table(conn, "tbl_Sen")
#' }
#'
#' @export

get_cebrap_table <- function(conn, table, head = TRUE, verbose = TRUE){

  # Create query
  if(verbose) cli::cli_alert_info("Fetching data from {cli::col_green('Cebrap')}'s Database...")

  if(head) query <- glue::glue("SELECT TOP 5 * FROM Congresso_BE.LEGISLATIVO.{table}")
  else query <- glue::glue("SELECT * FROM Congresso_BE.LEGISLATIVO.{table}")

  # Fetch data and return
  out <- RJDBC::dbGetQuery(conn, query)
  return(out)
}


#' List tables from Cebrap's Database
#'
#' `list_cebrap_tables()` queries and shows all tables available for fetching in the
#' Cebrap's Brazilian Legislative Database.
#'
#' @param conn A JDBC connection object created by the \code{\link{set_connection}} function
#'
#' @examples
#' \dontrun{
#'
#' # List alll tables
#' conn <- set_connection(login = "login", password = "pass")
#' list_cebrap_tables(conn)
#' }
#'
#' @export

list_cebrap_tables <- function(conn){

  RJDBC::dbGetQuery(conn, "SELECT * FROM Congresso_BE.INFORMATION_SCHEMA.TABLES")
}
