#' matchnumeric
#'
#' Check that values are numeric which are supposed to be
#'
#' @param var_data actual data values for a specific variable
#' @param var_name  name of the variable being matched
#' @param tab name of the tab that the variable is found in
#' @param error error counter
#' @export

matchnumeric<-function(var_data, var_name, tab, error){
  if (!is.numeric(var_data) & sum(is.na(var_data))!=length(var_data)){
    message("\nWARNING...non-numeric value detected in '" ,var_name,"' column of the '" ,tab,"' tab:")
    error<-error+1
    natural_nas<-which(is.na(var_data))
    nonnumeric_values<-which(is.na(suppressWarnings(as.numeric(as.character(var_data)))))
    nonnumeric_values<-setdiff(nonnumeric_values, natural_nas)
    nonnumeric_values<-unique(var_data[nonnumeric_values])
    for (i in 1:length(nonnumeric_values)){
      cat("\t","\t", nonnumeric_values[i], "\n")
    }
  }
  return(error)
}
