#' comparenames
#'
#' Compares the names at names between hierarchical levels, used in dataQC
#'
#' @param names names oject, outout from getnames()
#' @import utils
#' @export
#'
#'

comparenames<-function(names){

 return(apply(combn(seq_along(names), 2), 2, function(n) names[[n[1]]] %in% names[[n[2]]]))

}
