#' checkdata
#'
#' Check the imported soil carbon dataset for formatting and entry errors
#'
#' @param data directory to data file
#' @export
#'
#'

checkdata <- function(data){
  message("Checking...")

  message("Data structure")
  if (class(data) != "list") {
    message("WARNING...Data is not of class 'list': check data structure")} else message("OK")

}
