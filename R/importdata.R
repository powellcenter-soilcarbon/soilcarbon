#' importdata
#'
#' This function imports data from xlsx format matching the standard soil carbon data template
#'
#' @param file directory to data file
#' @import XLConnect
#' @export
#' @examples
#' datafile<-system.file("extdata", "UNALTERED_TEMPLATE_v120616.xlsx", package = "soilcarbon")
#' importdata(file=datafile)

importdata<-function(file){
  data_workbook<-loadWorkbook(testdata_directory)
  sheets_found<-getSheets(data_workbook)
  sheets_needed<-c("metadata","site","profile","layer", "fraction")
  if (F %in% (sheets_needed %in% sheets_found)){
    sheets_missing<-setdiff(sheets_needed, sheets_found)
    stop(paste("Sheet(s) '",sheets_missing,"' missing from data file", sep=""))
  }

  metadata<-readWorksheet(object=data_workbook , sheet="metadata", header = TRUE )
  site<-readWorksheet(object=data_workbook , sheet="site", header = TRUE )
  profile<-readWorksheet(object=data_workbook , sheet="profile", header = TRUE )
  layer<-readWorksheet(object=data_workbook , sheet="layer", header = TRUE )
  fraction<-readWorksheet(object=data_workbook , sheet="fraction", header = TRUE )

  data_workbook=list(metadata=metadata, site=site, profile=profile, layer=layer, fraction=fraction)
  return(data_workbook)
}

