
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cebrapdata

<!-- badges: start -->

[![R-CMD-check](https://github.com/nipe-cebrap/cebrapdata/workflows/R-CMD-check/badge.svg)](https://github.com/nipe-cebrap/cebrapdata/actions)
[![Codecov test
coverage](https://codecov.io/gh/nipe-cebrap/cebrapdata/branch/main/graph/badge.svg)](https://codecov.io/gh/nipe-cebrap/cebrapdata?branch=main)
[![Travis build
status](https://travis-ci.com/nipe-cebrap/cebrapdata.svg?branch=main)](https://travis-ci.com/nipe-cebrap/cebrapdata)
<!-- badges: end -->

`cebrapdata` is a simple R client for the
[Cebrap](https://cebrap.org.br/)’s Brazilian Legislative Database, the
main and oldest specialized source of legislative data in Brazil. With
the package, querying, fetching, and storing data locally could be done
fast with a few lines of code from R.

## Installation

For the time being, `cebrapdata` dev version can be installed from
[GitHub](https://github.com/) using the
[remotes](https://cran.r-project.org/web/packages/remotes/index.html)
package:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("nipe-cebrap/cebrapdata")
```

## How does it work?

Under the hood, `cebrapdata` manages connections, abstracts queries and
fetches data from Cebrap’s Database, making it easy to ingest Brazilian
legislative data from R.

To start using the package, it is recommended that users create and
store their credentials using the `store_credentials()` function:

``` r
# Load the package
library(cebrapdata)

# Set credentials
store_credentials(login = "mylogin", password = "mypass")
```

R will store your credentials as environment variables so there will be
no need to re-enter these information again in the future (besides, this
avoids accidental sharings of scripts with credentials).

After that, make a connection to Cebrap’s Database with
`set_connection()` and start fetching data with `get_cebrap_table()`:

``` r
# Set connection
conn <- set_connection()

# Request a table
senadores <- get_cebrap_table(conn, "tbl_Sen")
```

The above code should return a `data.frame` with only 5 rows to save
server resources. To download a full table, set the argument `head` to
`FALSE`:

``` r
# Same request, full table
senadores <- get_cebrap_table(conn, "tbl_Sen", head = FALSE)
```

### Other utilities

To consult the available tables in the Cebrap’s Database, use:

``` r
# List all tables in Cebrap's database
list_cebrap_tables(conn)
```

In case you did not stored your credentials using `store_credentials`,
these could also be passed directly to the function call (note that this
method does not store your credentials for future uses):

``` r
# Pass credentials
conn <- set_connection(login = "mylogin", password = "mypass")
```

### JDBC driver

To use `cebrapdata`, users must select an appropriate MS-SQL Server JBDC
driver for your operational system from
[Microsoft](https://docs.microsoft.com/pt-br/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver15).
`cebrapdata` already provides three different option:

-   `mssql-jdbc-9.2.1.jre8.jar`;
-   `mssql-jdbc-9.2.1.jre11.jar` (default); and
-   `mssql-jdbc-9.2.1.jre15.jar`.

By default, `get_cebrap_table` and similar functions use `jre11` version
to manage the connection to Cebrap’s database, but this can be changed
with the `driver` argument:

``` r
# Change driver
conn <- set_connection(driver = "jre15")
```

As a rule of thumb, you should stick with a driver that matches your
Java Runtime Environment (see [below](#requirements)): if you have JDK
11, use the driver `jre11`.

If none of these default drivers work for you, there is the option to
download a different one from [Microsoft’s
website](https://docs.microsoft.com/pt-br/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver15),
save it on your working directory and use its filepath instead:

``` r
# Change driver
conn <- set_connection(driver = "another-jdbc-driver.jar")
```

## Requirements

To install and use `cebrapdata`, [Java Runtime Environment
(JRE)](https://www.java.com/pt-BR/download/manual.jsp) and [Java
JDK](https://www.oracle.com/br/java/technologies/javase/javase-jdk8-downloads.html)
must be previously installed on your computer or server (click on these
links to install the apropriate version to your system).

If you use Windows, check your Java’s version by following this
[guide](https://docs.microsoft.com/pt-br/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver15).
On unix systems, execute the following from the terminal:

``` bash
java -version
```

If you face a problem installing `cebrapdata` or one of its
dependencies, please [submit an
issue](https://github.com/nipe-cebrap/cebrapdata/issues) with more
details.

## Note

In this current implementation, `cebrapdata` is only able to query and
fetch data from the `Congresso_NE` database.

## Credits

[NIPE-Cebrap](https://cebrap.org.br/nucleos/nucleo-instituicoes-politicas-e-eleicoes/)
and [Fapesp](https://fapesp.br/) (proccess number 2021/01393-2).
