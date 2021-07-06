#' Store credentials as ENV VARS
#'
#' `store_credentials()` stores login and password information needed to connect
#' to Cebrap's Brazilian Legislative Database as ENV VARS. Users are encourage to
#' use it as way to both prevent unintentional password leakages in R scripts and
#' to save time spent doing manual server authentication.
#'
#' This function need to be run just once. After that, authentication information
#' will be saved across R sessions and all `cebrapdata` functions will use these
#' to establish connection to Cebrap's Database.
#'
#' @param login Database login
#' @param password Database password
#'
#' @export

store_credentials <- function(login, password){

  Sys.setenv(CEBRAP_LOGIN = login)
  Sys.setenv(CEBRAP_LOGIN = password)
  cli::cli_alert_success("Credentials succesfully stored.")
}


# Function to check and recover login credentials from env vars
recover_env_credentials <- function(){

  login <- Sys.getenv("CEBRAP_LOGIN")
  pwd <- Sys.getenv("CEBRAP_PWD")
  if(login != "" & pwd != ""){

    return(c(login, pwd))
  }

  return(NULL)
}


# Function to get credentials
get_cebrap_credentials <- function(login, password){

  # Try getting credentials from env vars
  auth <- recover_env_credentials()
  if(is.null(auth)){

    # Check login and pwd arguments
    if(is.null(login) | is.null(password)){

      # Stop if login or password are NULL
      stop(cli::cli_alert_danger("Both 'login' and 'password' are required. Use 'set_credentials()' to store this information safely.",
                                 id = "Authentication failure."))

    } else {

      # Otherwise, return these as a vector
      return(c(login, password))
    }
  }

    # Return auth credentials
    return(auth)
}





