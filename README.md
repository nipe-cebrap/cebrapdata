
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cebrapdata

<!-- badges: start -->

[![R-CMD-check](https://github.com/nipe-cebrap/cebrapdata/workflows/R-CMD-check/badge.svg)](https://github.com/nipe-cebrap/cebrapdata/actions)
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

Under the hood, `cebrapdata` uses
[RJDBC](https://cran.r-project.org/web/packages/RJDBC/index.html) to
manage connections, abstract queries and fetch data from Cebrap’s
Database, making it easy to ingest Brazilian legislative data from R.

``` r
library(cebrapdata)
```

## Requirements

To use the package, users need to select the appropriate MS-SQL Server
JBDC driver from
[Microsoft](https://docs.microsoft.com/pt-br/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver15).
To speed up this proccess, `cebrapdata` already provides three different
driver option:

-   `mssql-jdbc-9.2.1.jre8.jar`;
-   `mssql-jdbc-9.2.1.jre11.jar`; and
-   `mssql-jdbc-9.2.1.jre15.jar`

By default, `get_cebrap_table` and similar functions use `jre15` version
to manage the connection to Cebrap’s database, but this can be changed
with the `driver` argument:

``` r
# exemplae
```

…

# Credits

[NIPE-Cebrap](https://cebrap.org.br/nucleos/nucleo-instituicoes-politicas-e-eleicoes/)
and [Fapesp](https://fapesp.br/) (proccess number \#).
