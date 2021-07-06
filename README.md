
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cebrapdata

<!-- badges: start -->
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

To use the package, users need to first download the appropriate MS-SQL
Server JBDC driver from the Microsoft’s website. To speed up this
proccess, use the `cebrapdata`’s `download_driver()` function to
download and save a driver in your local working directory:

``` r
library(cebrapdata)
download_driver()
```

…

# Credits

[NIPE-Cebrap](https://cebrap.org.br/nucleos/nucleo-instituicoes-politicas-e-eleicoes/)
and [Fapesp](https://fapesp.br/) (proccess number \#).
