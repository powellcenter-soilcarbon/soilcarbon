# About the database
This database includes soil carbon data at a global scale, to the resolution of fractionation data. 

# Add data
## Template
**Links:**  
[Template file](https://github.com/powellcenter-soilcarbon/soilcarbon/raw/master/inst/extdata/Master_template.xlsx) (Variables with red column names are required)  
[Template instructions](https://github.com/powellcenter-soilcarbon/soilcarbon/raw/master/inst/extdata/Template_info.html)  

## Check data compatability

1. Install latest version of R [https://www.r-project.org/](https://www.r-project.org/)
2. Install soilcarbon package (run this in R):
```{r}
install.packages("soilcarbon")
```
3. Run soilcarbon shiny workbench in R
```{r}
shiny::runApp(system.file('shiny', package='soilcarbon'))
```
4. Go to the 'add data to database' tab.
5. Click 'Browse' and chose the data file (Template file that you have filled with data) 
6. Click 'download quality control report' 
7. Look at the text file that is downloaded. Warning messages will describe any problems in the data file.
8. If your data passes the check, email it to greymonroe@gmail.com.

