#'importdata
#'
#' This function imports data from xlsx format matching the standard soil carbon data template
#'
#' @param file directory to data file
#' @import XLConnect
#' @export
#' @examples
#'
#' genemodel.plot(AT5G62640, 25149433, 25152541, "reverse", xaxis=TRUE)


importdata<-function(file){
  require(XLConnect)
  data_workbook<-loadWorkbook(file)
  return(data_workbook)
}
