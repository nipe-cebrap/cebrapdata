% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connection.R
\name{set_connection}
\alias{set_connection}
\title{Establish a connection to Cebrap's database}
\usage{
set_connection(login = NULL, password = NULL, driver = NULL, verbose = TRUE)
}
\arguments{
\item{login}{User login}

\item{password}{User password}

\item{driver}{A \code{string} containing the version of JDBC driver to use or a path
for a valid JDBC driver (with \code{.jar} extension). Pre-built valid options for JDBC
drivers are:
\itemize{
\item \code{jre8}
\item \code{jre11}
\item \code{jre15}
}}

\item{verbose}{Should the function display messages? Defaults to \code{TRUE}}
}
\description{
\code{set_connection()} function is used to establish a connection with authentication
to Cebrap's Brazilian Legislative Database using JDBC. It does so by starting
the appropriate driver and sending login information to Cebrap's MS-SQL Server.
Users can choose which version o Microsoft's JDBC to utilize and also have the
option to save authentication info in the system path for improved security.
}
\note{
To use this and other functions from \code{cebrapdata}, users must have \code{rJava}
and Java JDK installed.
}
