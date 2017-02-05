#' dataQC
#'
#' Check the imported soil carbon dataset for formatting and entry errors
#'
#' @param data directory to data file
#' @export
#'
#'

dataQC <- function(data){
  cat("Checking...\n")

  cat("Column names\n")
  template_file<-system.file("extdata", "UNALTERED_TEMPLATE_v120616.xlsx", package = "soilcarbon")
  template<-importdata(file=template_file)
  cat("    metadata tab\n")
  if (!identical(colnames(data$metadata) , colnames(template$metadata))) {
    message("WARNING...metadata column names do not match template")} else cat("OK\n")
  cat("    site tab\n")
  if (!identical(colnames(data$site), colnames(template$site))) {
    message("WARNING... site column names do not match template")} else cat("OK\n")
  cat("    profile tab\n")
  if (!identical(colnames(data$profile) , colnames(template$profile))) {
    message("WARNING... profile column names do not match template")} else cat("OK\n")
  cat("    layer tab\n")
  if (!identical(colnames(data$layer),colnames(template$layer))) {
    message("WARNING... layer column names do not match template")} else cat("OK\n")
  cat("    fraction tab\n")
  if (!identical(colnames(data$fraction), colnames(template$fraction))) {
    message("WARNING... fraction column names do not match template")} else cat("OK\n")

  cat("Dataset Names\n")
   if (F %in% comparenames(data, "dataset")){
    message("WARNING... Dataset Names do not match")} else cat("OK\n")

   cat("Site Names\n")
  if (F %in% comparenames(data, "site")){
    message("WARNING... Site Names do not match")} else cat("OK\n")

  cat("Profile Names\n")
  if (F %in% comparenames(data, "profile")){
    message("WARNING... Profile Names do not match")} else cat("OK\n")

  cat("Layer Names\n")
  if (F %in% comparenames(data, "layer")){
    message("WARNING... Layer Names do not match")} else cat("OK\n")


}
?warning
