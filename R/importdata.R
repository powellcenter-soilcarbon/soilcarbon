#'importdata
#'
#' This function imports data from xlsx format matching the standard soil carbon data template
#'
#' @param file directory to data file
#' @import XLConnect
#' @export
#' @examples
#'
#' importdata(file="~/path/to/file/file.xlsx")

importdata<-function(file){
  require(XLConnect)
  data_workbook<-loadWorkbook(file)
  return(data_workbook)
}
