#' read.soilcarbon
#'
#' This function imports data from xlsx format matching the standard soil carbon data template
#'
#' @param file directory to data file
#' @param template set to TRUE if reading in a template file
#' @import openxlsx
#' @import utils
#' @export

read.soilcarbon<-function(file, template=F){

  requireNamespace("openxlsx")


  # comprae sheets found in datafile to the necessary sheets in the standard data template
  sheets_found<-getSheetNames(file)
  sheets_needed<-c("metadata","site","profile","layer", "fraction")
  if (F %in% (sheets_needed %in% sheets_found)){
    sheets_missing<-setdiff(sheets_needed, sheets_found)
    stop(paste("Sheet(s) '",sheets_missing,"' missing from data file", sep="")) # if sheets are missing, return error message with the missing sheets
  }

  metadata<-read.xlsx(file , sheet="metadata")
  site<-read.xlsx(file , sheet="site")
  profile<-read.xlsx(file , sheet="profile")
  layer<-read.xlsx(file , sheet="layer")
  fraction<-read.xlsx(file , sheet="fraction")

  data_workbook=list(metadata=metadata, site=site, profile=profile, layer=layer, fraction=fraction)

  #remove empty rows
  if (template==F){
  for (i in 1:length(data_workbook)){
    data<-data_workbook[[i]]
    data[data == c(" ")]<-NA
    data[data == c("")]<-NA
    data_workbook[[i]]<-data
    data_workbook[[i]]<-data_workbook[[i]][rowSums(is.na(data_workbook[[i]])) != ncol(data_workbook[[i]]),]

  }
  }

  attributes(data_workbook)$file_name<-file

  return(data_workbook)
}

