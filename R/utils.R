# ---
# UTILS
# ---


# Validate JDBC drivers
check_driver <- function(driver){

  # Set JDBC option
  if (is.null(driver)){

    dvr <- system.file("drivers", "mssql-jdbc-9.2.1.jre11.jar", package = "cebrapdata")

  } else {

    # Choose valid driver options
    if (tolower(driver) == "jre8"){

      dvr <- system.file("drivers", "mssql-jdbc-9.2.1.jre8.jar", package = "cebrapdata")

    } else if (tolower(driver) == "jre11") {

      dvr <- system.file("drivers", "mssql-jdbc-9.2.1.jre11.jar",package = "cebrapdata")

    } else if (tolower(driver) == "jre15") {

      dvr <- system.file("drivers", "mssql-jdbc-9.2.1.jre15.jar", package = "cebrapdata")

    } else { # Last chance: a filepath

      if(grepl("\\.jar$", driver)) dvr <- driver
      else stop("'driver' should indicate a valid JDBC driver option or filepath.")
    }
  }

  # Return
  return(dvr)
}

