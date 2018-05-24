#' check.template
#'
#' Check the imported soil carbon dataset for formatting and entry errors
#'
#' @param data directory to data file
#' @param tabs the tabs that will be checked, default is NULL
#' @param writeQCreport if TRUE, a text report of the QC output will be written to the outfile. Default is FALSE
#' @param outfile filename of the output file if writeQCreport=TRUE. Default is NULL, and the outfile will be written to the directory where the dataset is stored, and named by the dataset being checked.
#' @export
#'


check.template<-function(style="MPI"){

# read in template file
template_file<-system.file("extdata", "Master_template_v9_MPI_entry_name_test_all.xlsx", package = "soilcarbon")
template<-read.soilcarbon(file=template_file, format = "MPI",template=T)

# read in template information file
template_info_file<-system.file("extdata", "Template_info_new GM.xlsx", package = "soilcarbon")
template_info_sheets<-getSheetNames(template_info_file)
template_info<-lapply(template_info_sheets, function(s) read.xlsx(template_info_file , sheet=s))
names(template_info)<-template_info_sheets

template_info$metadata$Column_Name == colnames(data$metadata)
template_info$site$Column_Name == colnames(data$site)
template_info$profile$Column_Name == colnames(template$profile)
template_info$layer$Column_Name == colnames(template$layer)
template_info$interstitial$Column_Name == colnames(template$interstitial)
template_info$fraction$Column_Name == colnames(template$fraction)
template_info$incubation$Column_Name == colnames(template$incubation)
}
