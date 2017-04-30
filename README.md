# getting started
To install the soilcarbon package, just run this code in R (you can ignore `install.packages("devtools")` if you already have it).
```{r}
install.packages("devtools")
require(devtools)
devtools::install_github("powellcenter-soilcarbon/soilcarbon")
```
The fastest and easiest way to interact with the soilcarbon database is through an R shiny app that comes with the soilcarbon pacakge. Just and run this code in R:
```{r}
shiny::runApp(system.file('shiny', package='soilcarbon'))
```
In this shiny app, you can plot or download data in the database, and run a quality control check on a datafile you want to submit to the database.

# Template file
The template file for adding new data to the database can be accessed through the soilcarbon shiny app, or can be downloaded at this link.
 [download template](https://github.com/powellcenter-soilcarbon/soilcarbon/raw/master/inst/extdata/Master_template.xlsx)


