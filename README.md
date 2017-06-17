# getting started
## Install R (and RStudio)

If you don't already have them, download and install R [https://www.r-project.org/](https://www.r-project.org/) and RStudio (optional) [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/).

## Install soilcarbon package
To install the soilcarbon package, just run this code in R. 

 If you are on Windows OS, you need this line:
```{r]
install.packages(c("htmltools", "httpuv", "xtable"))
```
All systems run:
```{r}
install.packages("devtools")
devtools::install_github("powellcenter-soilcarbon/soilcarbon")
```
(You only need to run `install.package(c("htmltools", "httpuv", "xtable")` and `install.packages("devtools")` once, but as the soilcarbon is developed you can run `devtools::install_github("powellcenter-soilcarbon/soilcarbon")` to get the latest version.)

## Run soilcarbon shiny workbench
The fastest and easiest way to interact with the soilcarbon database is through an R shiny app that comes with the soilcarbon pacakge. After you have installed the package, just run this code in R:
```{r}
shiny::runApp(system.file('shiny', package='soilcarbon'))
```
In this shiny app, you can plot or download data in the database, and run a quality control check on a datafile you want to submit to the database.

# Adding data

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

# Features available in development version 
* Soilcarbon will not require most recent version of R
* change requirement that users remove description rows from data templates to submit

### Template
* adedd f_agent column
* Drop down options (controlled vocab and level names in excel template)
* “% carbonate” in layer tab is now ”% inorganic C”
Selective dissolution columns need to be added to the fraction template. 
     1 .  f_fe_ox 
		 2 .  f_al_ox 
		 3 .  f_si_ox 
		 4 .  f_c_ox 
		 5 .  f_ox_notes 
		 6 .  f_fe_hy 
		 7 .  f_al_hy 
		 8 .  f_si_hy 
		 9 .  f_c_hy 
		 10 .  f_hy_notes 
		 11 .  f_fe_dith 
		 12 .  f_al_dith 
		 13 .  f_si_dith 
* For “soil pH other” column, there is now an accompanying column to specific what the “other” pH method was (e.g. KCl, HF, etc)
* It occurred to me that “Beyond Clay” identified exchangeable Ca as one of the variables we’re recommending people use to model soil C content, but our own database doesn’t include that as a reported variable. I think we should create columns for the individual exchangeable cations....added to Layer tab: ph_other_method, Ca_exch, Na_exch, Mg_exch, K_exch, calcite_dolomite, zeolite
* Fraction tab: f_zeolite
* add metadata_note column
* add tc, oc and ic columns to layer and fraction ("f_")


### read.soilcarbon()
* double check remove empty rows function (gsub("[ ]+")
* remove top two rows (description rows)

### dataQC()
* New required columns in metadata tab
* allow for level_names to not exist in fraction tab (they didnt do fractionation) but give note
* flag f_property
* When it passes it say "Yay! It passed!" or "Congratulations!" 


# Features to add for next update
### Template
* controlled vocab for ph_other_method
* remove columns in site tab that should be extracted from lat lon

### Template instructions
* Markdown file of description of each variable (check resources folder in Powell Center)
* The upper limit of the last density fraction is "Inf"
* If the data should be there but not reported in the paper, put "missing"
* if it is wrong, put 'wrong'
* Tem
### Package
* Soilcarbon will not require most recent version of R
* add updateSoilcarbonDatabase()
* add regular test (daily)
* add new data to dataset
* add soilcarbonWorkbench() to launch shiny app  (If shiny launches in R studio downloads dont have correct names (force launch in browser))

### Shiny App
* fix reupload bug

### dataQC()
* check that top two 'description rows' are present in the datafile


* ingest NRCS, translation
* add database.build()
* add unique profile ID (paste site profile)
