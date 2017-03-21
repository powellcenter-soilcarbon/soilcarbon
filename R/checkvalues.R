#' checkvalues
#'
#' Check certain column values to match what is expected, used in dataQC
#'
#' @param data soilcarbon data
#' @param tab specific tab of dataset , ie. dataset_name
#' @param vocab  soilcarbon controlled vocabulary file to compare with
#' @export
#'

checkvalues<-function(data, tab, vocab){

  cat("\t",tab,"tab...")
  data_tab<-data[[tab]]
  vocab_tab<-vocab[[tab]]

  error<-0
  for (i in 1:ncol(vocab_tab)){
    var_name<-colnames(vocab_tab)[i]
    var_vocab<-c(vocab_tab[,i], NA)
    var_data<-data_tab[,var_name]
    if (!any(var_data %in% var_vocab)){
      wrong_values<-setdiff(var_data,var_vocab)
      message("\nWARNING...innappropriate value detected in '" ,var_name,"' column of the'" ,tab,"' tab:")
      error<-error+1
      for (j in 1:length(wrong_values)) cat("\t\t", j, ". ", wrong_values[j] ,"\n")
    }

  }
  if (error==0) cat("OK\n")

}
