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
  flat_data_columns<-colnames(flat_data)

  template_file<-system.file("extdata", "Master_template.xlsx", package = "soilcarbon")
  template<-read.soilcarbon(file=template_file, template=T)
  template_flat<-Reduce(function(...) merge(..., all=T), template)

  flat_template_columns<-colnames(template_flat)

  flat_data[, setdiff(flat_template_columns, flat_data_columns)]<-NA


  return(flat_data)
}
