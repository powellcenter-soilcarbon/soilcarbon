#' compileDatabase.MPI
#'
#' adds dataset to soilcarbon database
#'
#' @param dataset_directory directory where compeleted and QC passed soilcarbon datasets are stored
#' @export
#' @import devtools
#' @import stringi
#'

compileDatabase.MPI <- function(dataset_directory){


requireNamespace("stringi")

data_files<-list.files(dataset_directory, full.names = T)
data_files<-data_files[grep("xlsx", data_files)]


template_file<-system.file("extdata", "Master_template_v9_MPI_entry_name_test_all.xlsx", package = "soilcarbon")
template<-read.soilcarbon(file=template_file, format = "MPI",template=T)
template_flat<-Reduce(function(...) merge(..., all=T), template)

flat_template_columns<-colnames(template_flat)


working_database<-template_flat




for(i in 1:length(data_files)){
  print(i)
  soilcarbon_data<-read.soilcarbon(data_files[i], format="MPI")
  flat_data<-Reduce(function(...) merge(..., all=T), soilcarbon_data)
  flat_data[] <- lapply(flat_data, as.character)
  flat_data[, setdiff(flat_template_columns, colnames(flat_data))]<-NA
  setdiff(colnames(working_database), colnames(flat_data))
  setdiff(colnames(flat_data), colnames(working_database))

  working_database<-rbind(working_database, flat_data)
}

  working_database[]<-lapply(working_database, function(x) stri_trans_general(x, "latin-ascii"))
  working_database[]<-lapply(working_database, type.convert)
  soilcarbon_database<-working_database
  return(soilcarbon_database)
}
