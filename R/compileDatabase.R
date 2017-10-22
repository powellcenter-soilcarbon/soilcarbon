#' compileDatabase
#'
#' adds dataset to soilcarbon database
#'
#' @param dataset_directory directory where compeleted and QC passed soilcarbon datasets are stored
#' @export
#' @import devtools
#'

compileDatabase <- function(dataset_directory ){

  requireNamespace("raster")

  data_files<-list.files(dataset_directory, full.names = T	)
  data_files<-data_files[grep("xlsx", data_files)]

  # special dataset (Yujie)
   Yujie_database <- NULL; rm(Yujie_database)
   working_database<-Yujie_database
   working_database[] <- lapply(working_database, as.character)

  for(i in 1:length(data_files)){
    soilcarbon_data<-read.soilcarbon(data_files[i])

    qc_file<-basename(gsub("\\.xlsx", "_QCreport.txt", attributes(soilcarbon_data)$file_name))
    qc_file<-paste0(dataset_directory, "dataQC_log/", qc_file)
    qc_out<-dataQC(soilcarbon_data, writeQCreport = T, outfile = qc_file)

    if (qc_out>0){
      print(paste(basename(data_files[i]),"...", qc_out,"errors"))
    } else{
      print(paste(basename(data_files[i]),"...", "passed and added to database"))
      flat_data <- flatten(soilcarbon_data)
      flat_data[] <- lapply(flat_data, as.character)
      working_database<-rbind(working_database, flat_data)

  }
}
  working_database[]<-lapply(working_database, type.convert)
  bio<-getData("worldclim", var='bio', res=2.5, path="~/Dropbox/bioclim/")
  working_database$map<-extract(bio$bio12, cbind(working_database$long, working_database$lat))
  working_database$mat<-extract(bio$bio1, cbind(working_database$long, working_database$lat))


  return(working_database)

}
