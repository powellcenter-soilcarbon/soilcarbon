#' checkcolnames
#'
#' Check the column names of different tabs in the dataset to make sure they match, used in dataQC
#'
#' @param data soilcarbon data
#' @param tab specific tab of dataset , ie. dataset_name
#' @param soilcarbon_template template soilcarbon file to compare
#' @export
#'

checkcolnames<-function(data, tab, soilcarbon_template){

  cat("\t",tab,"tab...")
  data_colnames<-colnames(data[[tab]])
  template_colnames<-colnames(soilcarbon_template[[tab]])
  error=0
  notintemplate<-setdiff(data_colnames, template_colnames)
  if (length(notintemplate>0)) {
    message("\nWARNING...column names in the '",tab,"' tab do not match template, see below:")
    cat("\t\t columns found in '", tab, "' tab of dataset but not in template\n" )
    error<-error+1
    for (i in 1:length(notintemplate)){
      cat("\t\t", i, ". ", notintemplate[i] ,"\n")
    }

    } else cat("OK\n")
  return(error)

}
