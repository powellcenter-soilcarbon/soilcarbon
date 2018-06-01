#' compileAsList
#'
#' Compiles all entries (xlsx files) and creates a version of the database as a list
#'
#' @param dataset_directory directory where compeleted and QC passed soilcarbon datasets are stored
#' @export

compileAsList = function(dataset_directory){
  entryNames=list.files(dataset_directory, full.names=FALSE, recursive=FALSE)
  entryNames=entryNames[grep("xlsx", entryNames)]
  shortNames=(strsplit(entryNames,split=".xlsx"))
  paths=paste(dataset_directory,entryNames, sep="")

  out=lapply(paths,read.soilcarbon)
  names(out)=entryNames
  return(out)
}
