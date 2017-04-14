# soilcarbon
R package to analyze soil carbon created by Powell Center working group


# ongoing issues  

1. Rows with descriptions affecting data import. Will the datasets always comtain these first two rows of blank/descritpive data?
1. What will be the standard lat lon system used?  
1. "mineral" and "silicate_class" found in controlled vocab but not fraction tab

# Notes
1. changed "lat.long.datum" to "datum" in controlled vocab sheet

# addtional dataQC checks
1. make sure values that are supposed to be numeric are 
1. limit ranges of numeric values (see fraction controlled vocab tab)
1. make sure that each site has only one lat lon (more than 1 would indicate multiple sites)
