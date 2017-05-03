#' matchvocab
#'
#' Match values in variable to controlled vocab
#'
#' @param var_data actual data values for a specific variable
#' @param var_vocab controlled vocab for a specific variable
#' @param var_name  name of the variable being matched
#' @param tab name of the tab that the variable is found in
#' @param error error counter
#' @export
#' @examples
#' matchvocab(var_data = c("A", "B"), var_vocab=c("A", "B", "C"), tab="site", error=0)

matchvocab<-function(var_data, var_vocab, var_name, tab, error){
  if(!is.null(var_data)){
  if (!any(var_data %in% var_vocab)){
    wrong_values<-setdiff(var_data,var_vocab)
    message("\nWARNING...inappropriate value detected in '" ,var_name,"' column of the '" ,tab,"' tab:")
    error<-error+1
    for (j in 1:length(wrong_values)) cat("\t\t", wrong_values[j] ,"\n")
  }}
return(error)
}
