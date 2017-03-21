#' read.soilcarbon
#'
#' This function imports data from xlsx format matching the standard soil carbon data template
#'
#' @param file directory to data file
#' @param template set to TRUE if reading in a template file
#' @import XLConnect
#' @import utils
#' @export

read.soilcarbon<-function(file, template=F){

  requireNamespace("XLConnect")

  XLSX_workbook<-loadWorkbook(file)

  # comprae sheets found in datafile to the necessary sheets in the standard data template
  sheets_found<-getSheets(XLSX_workbook)
  sheets_needed<-c("metadata","site","profile","layer", "fraction")
  if (F %in% (sheets_needed %in% sheets_found)){
    sheets_missing<-setdiff(sheets_needed, sheets_found)
    stop(paste("Sheet(s) '",sheets_missing,"' missing from data file", sep="")) # if sheets are missing, return error message with the missing sheets
  }

  metadata<-readWorksheet(object=XLSX_workbook , sheet="metadata", header = T)
  site<-readWorksheet(object=XLSX_workbook , sheet="site", header = TRUE)
  profile<-readWorksheet(object=XLSX_workbook , sheet="profile", header = TRUE)
  layer<-readWorksheet(object=XLSX_workbook , sheet="layer", header = T)
  fraction<-readWorksheet(object=XLSX_workbook , sheet="fraction", header = TRUE)

  data_workbook=list(metadata=metadata, site=site, profile=profile, layer=layer, fraction=fraction)

  data_workbook$metadata <- data_workbook$metadata[-1:-2,]
  data_workbook$site <- data_workbook$site[-1:-2,]
  data_workbook$profile <- data_workbook$profile[-1:-2,]
  data_workbook$layer <- data_workbook$layer[-1:-2,]
  data_workbook$fraction <- data_workbook$fraction[-1:-2,]

  data_workbook<-lapply(data_workbook, function(x) { as.data.frame(lapply(x, type.convert))})

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

