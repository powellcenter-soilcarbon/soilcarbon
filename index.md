# About the working group
[https://powellcenter.usgs.gov/view-project/55d4bffce4b0518e354695aa](https://powellcenter.usgs.gov/view-project/55d4bffce4b0518e354695aa)

Soils are a vast reservoir of organic carbon (C), rendering the fate of soil C an important control on the global climate system. Widespread changes in soil C storage capacity present a potentially strong feedback to global change. Yet, a comprehensive understanding of how soil C will respond to climate and/or land use disturbance remains illusive, resulting in major uncertainties in global climate models. Our working group will synthesize information on the processes controlling soil C storage across different spatial scales and develop new procedures to translate local measurements to the regional and global scale datasets used by models. 

# Database
This database will compile soil carbon data at a global scale, to the resolution of fractionation data. 

# soilcarbon R package
# getting started
## Install R (and RStudio)

If you don't already have them, download and install R [https://www.r-project.org/](https://www.r-project.org/) and RStudio (optional) [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/).

## Install soilcarbon package

### For development version
### Windows install
1. Use button above to download package as .zip file
1. Unzip folder
1. Run this code in R (but replace "path/to/directory" with the correct path on your computer):
```{r]
install.packages("devtools")
devtools::install("path/to/directory/soilcarbon-master", dependencies=T)
```

### Mac/Linux
Just run this in R:
```{r}
install.packages("devtools")
devtools::install_github("powellcenter-soilcarbon/soilcarbon")
```

## Run soilcarbon shiny workbench
### Screenshot:
![](site_files/assets/images/plots.png?raw=true "Screenshot")
The fastest and easiest way to interact with the soilcarbon database is through an R shiny app that comes with the soilcarbon pacakge. After you have installed the package, just run this code in R:
```{r}
shiny::runApp(system.file('shiny', package='soilcarbon'))
```
In this shiny app, you can plot or download data in the database, and run a quality control check on a datafile you want to submit to the database.

# Adding data
### Screenshot:
![](site_files/assets/images/add.png?raw=true "Screenshot")

## Download Template file
The template file for adding new data to the database can be accessed through the soilcarbon shiny app, or can be downloaded at this link.
 [download template](https://github.com/powellcenter-soilcarbon/soilcarbon/raw/master/inst/extdata/Master_template.xlsx)

## Run quality control check
After you have downloaded the template file and filled it in with data, you must check whether the data file passes the quality control requirements to be added to the databse. Follow these steps:

1. Fire up the soil carbon workbench and go to the 'add data to database' tab.
1. Click 'Browse' and chose the file you want to upload
1. If the file is the right format (.xlsx and correct tabs) a button that says 'download quality control report' will appear. Click this.
1. Look at the file that is generated. If there are problems with the formating of the dataset, you will see warning messages. Read the text in the warning messages to figure out what the problem is.

If you are having trouble understanding the formatting requirements for passing the quality control check, see this list of tips for filling out the template correctly:

* The 'metadata', 'site', 'profile', 'layer', and 'fraction' tabs are required in order to successfully upload the file to the database.
* Variables with red column names are required and cannot have missing values.
* Values in the variables called 'dataset_name', 'site_name', 'profile_name', and 'layer_name' must match across tabs in which they are found.
* Check the 'controlled vocabulary' tab for acceptable values for certain variables.
* Remove the first two description rows before submitting dataset.

If you are still having trouble passing the quality control test, send an email to Grey Monroe (greymonroe @ gmail.com) with a description of your problem, along with the data file and quality control report.


