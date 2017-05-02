#' compileDatabase
#'
#' adds dataset to soilcarbon database
#'
#' @param dataset_directory directory where compeleted and QC passed soilcarbon datasets are stored
#' @export
#' @import devtools
#'

compileDatabase <- function(dataset_directory ){

  data_files<-list.files( dataset_directory, full.names = T	)

  #special dataset (Yujie)
  Yujie_database <- NULL; rm(Yujie_database)
  working_database<-Yujie_database
  working_database[] <- lapply(working_database, as.character)

  for(i in 1:length(data_files)){
    soilcarbon_data<-read.soilcarbon(data_files[i])
    flat_data <- flatten(soilcarbon_data)
    flat_data[] <- lapply(flat_data, as.character)
    working_database<-rbind(working_database, flat_data)

  }

  working_database[]<-lapply(working_database, type.convert)
  soilcarbon_database<-working_database

  use_data(soilcarbon_database, overwrite = T)

}
