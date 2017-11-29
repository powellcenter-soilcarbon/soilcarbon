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
  if(length(names)>1){
    names_compared<-list()
    names_compared$lower<-apply(combn(seq_along(names), 2), 2, function(n) names[[n[1]]] %in% names[[n[2]]])
    names_compared$higher<-apply(combn(seq_along(names), 2), 2, function(n) names[[n[2]]] %in% names[[n[1]]])
    return(names_compared)
  } else return(c(T))

}
