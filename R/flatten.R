#' flatten
#'
#' converts heierachically strucutred soilcarbon data into flat data.frame
#'
#' @param soilcarbon_data soilcarbon data oject
#' @export
#'
#'

flatten<-function(soilcarbon_data){
  flat_data<-Reduce(function(...) merge(..., all=T), soilcarbon_data)
  return(flat_data)
}
