#' tabReport
#'
#' Compiles all entries (xlsx files) and creates report from a specific tab and a specific set of columns
#'
#' @param dataset_directory directory where compeleted and QC passed soilcarbon datasets are stored
#' @param tab tab selected to generate a report
#' @param cols set of columns to be selected from the specified tab
#' 
#' @return a data.frame
#' 
#' @author Carlos A. Sierra
#' 
#' @examples 
#' # tabReport(dataset_directory = "data_files/", tab="metadata",cols=c("dataset_name","curator_name", "curator_email"))
#' 
#' @export

tabReport = function(dataset_directory, tab, cols){
  scdb=compileAsList(dataset_directory)
  
  out=NULL
  for(i in 1:length(scdb)){  
    out=rbind(out,scdb[[i]]$metadata[,cols])
  }
  return(out)
}
