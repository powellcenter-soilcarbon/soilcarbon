#' compileDatabase.MPI
#'
#' adds dataset to soilcarbon database
#'
#' @param dataset_directory directory where compeleted and QC passed soilcarbon datasets are stored
#' @export
#' @import devtools
#' @import stringi
#'

compileDatabase.MPI <- function(dataset_directory ){


requireNamespace("stringi")

data_files<-list.files(dataset_directory, full.names = T)
data_files<-data_files[grep("xlsx", data_files)]


working_database<-data.frame()

for(i in 1:length(data_files)){
  soilcarbon_data<-read.soilcarbon(data_files[i], format="MPI")
  flat_data<-Reduce(function(...) merge(..., all=T), soilcarbon_data)
  flat_data[] <- lapply(flat_data, as.character)
  working_database<-rbind(working_database, flat_data)
}

  working_database[]<-lapply(working_database, function(x) stri_trans_general(x, "latin-ascii"))
  working_database[]<-lapply(working_database, type.convert)
  soilcarbon_database<-working_database
  return(soilcarbon_database)
}
