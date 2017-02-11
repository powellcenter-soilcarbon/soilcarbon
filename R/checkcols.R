#' checkcols
#'
#' Check the column names of different tabs in the dataset to make sure they match, used in dataQC
#'
#' @param data soilcarbon data
#' @param tab specific tab of dataset , ie. dataset_name
#' @param soilcarbon_template template soilcarbon file to compare
#' @export
#'

checkcols<-function(data, tab, soilcarbon_template){

  cat("\t",tab,"tab...")
  data_colnames<-colnames(data[[tab]])
  template_colnames<-colnames(soilcarbon_template[[tab]])


  if (!identical(data_colnames , template_colnames)) {
    notintemplate<-setdiff(data_colnames, template_colnames)
    notindata<-setdiff(template_colnames, data_colnames)


    message("\nWARNING...column names in the '",tab,"' tab do not match template, see below:")
    if (length(notintemplate>0)){
    cat("\t\t columns found in '", tab, "' tab of dataset but not in template\n" )
    for (i in 1:length(notintemplate)){
      cat("\t\t", i, ". ", notintemplate[i] ,"\n")
    }
    }

    if (length(notindata>0)){
    cat("\t\t columns found in '", tab, "' tab of template but not in dataset\n" )
    for (i in 1:length(notindata)){
      cat("\t\t", i, ". ", notindata[i],"\n" )
    }
    }

    } else cat("OK\n")

}
