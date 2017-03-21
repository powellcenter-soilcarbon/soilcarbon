#' dataQC
#'
#' Check the imported soil carbon dataset for formatting and entry errors
#'
#' @param data directory to data file
#' @param writeQCreport if TRUE, a text report of the QC output will be written to the outfile. Default is FALSE
#' @param outfile filename of the output file if writeQCreport=TRUE. Default is NULL, and the outfile will be written to the directory where the dataset is stored, and named by the dataset being checked.
#' @export
#'
#'

dataQC <- function(data, writeQCreport=F, outfile=NULL){

  if (writeQCreport==T){
    if (is.null(outfile)){
      outfile<-gsub("\\.xlsx", "_QCreport.txt", attributes(data)$file_name)
    }
    reportfile<-file(outfile)
    sink(reportfile)
    sink(reportfile, type = c("message"))
  }

  template_file<-system.file("extdata", "Master_template.xlsx", package = "soilcarbon")
  template<-read.soilcarbon(file=template_file, template=T)

  cat("CHECKING", attributes(data)$file_name, "\n")
  cat("timestamp:", as.character(Sys.time()),"\n")
  cat(rep("-", 20),"\n")
  cat("COLUMN NAMES\n")

# Compare column names in dataset to template file
  checkcolnames(data, "metadata", template)
  checkcolnames(data, "site", template)
  checkcolnames(data, "profile", template)
  checkcolnames(data, "layer", template)
  checkcolnames(data, "fraction", template)

  cat(rep("-", 20),"\n")
  cat("REQUIRED COLUMNS\n")
# Check required columns
  checkreqcols(data, "site", template)
  checkreqcols(data, "profile", template)
  checkreqcols(data, "layer", template)
  checkreqcols(data, "fraction", template)


# Compare names at different hierarchies
cat(rep("-", 20),"\n")
cat("LEVEL NAMES\n")
  checknames(data, "dataset")
  checknames(data, "site")
  checknames(data, "profile")
  checknames(data, "layer")

  if (writeQCreport==T){
    sink()
    cat("QC report saved to", outfile)
    closeAllConnections()
  }


}
sink.number()

