# soilcarbon
R package to analyze soil carbon database created by Powell Center working group

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

---


### Notes
1. "mineral" and "silicate_class" found in controlled vocab but not fraction tab
1. changed "lat.long.datum" to "datum" in controlled vocab sheet

### addtional dataQC checks
1. make sure values that are supposed to be numeric are 
1. limit ranges of numeric values (see fraction controlled vocab tab)
1. make sure that each site has only one lat lon (more than 1 would indicate multiple sites)
