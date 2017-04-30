# getting started
## Install R (and RStudio)

If you don't already have R and RStudio, download them here [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/).

## Installing soilcarbon
To install the soilcarbon package, just run this code in R. 

(You only need to run `install.packages("devtools")` once, but as the soilcarbon is developed you can run `devtools::install_github("powellcenter-soilcarbon/soilcarbon")` to get the latest version.)

```{r}
install.packages("devtools")
devtools::install_github("powellcenter-soilcarbon/soilcarbon")
```
## soilcarbon shiny workbench
The fastest and easiest way to interact with the soilcarbon database is through an R shiny app that comes with the soilcarbon pacakge. After you have installed the package, just run this code in R:
```{r}
shiny::runApp(system.file('shiny', package='soilcarbon'))
```
In this shiny app, you can plot or download data in the database, and run a quality control check on a datafile you want to submit to the database.

# Template file
The template file for adding new data to the database can be accessed through the soilcarbon shiny app, or can be downloaded at this link.
 [download template](https://github.com/powellcenter-soilcarbon/soilcarbon/raw/master/inst/extdata/Master_template.xlsx)


