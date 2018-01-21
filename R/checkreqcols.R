#' checkreqcols
#'
#' Check the required columns of different tabs in the dataset to make sure they exist and have values, used in dataQC
#'
#' @param data soilcarbon data
#' @param tab specific tab of dataset , ie. dataset_name
#' @export
#'

checkreqcols<-function(data, tab){


  required_columns<-list(metadata=c("dataset_name"),
                              site=c("dataset_name",
                                     "site_name",
                                     "lat",
                                     "long"),
                               profile=c("dataset_name"	,
                                         "site_name",
                                         "profile_name"),
                               layer=c("dataset_name",
                                       "site_name",
                                       "profile_name",
                                       "layer_name",
                                       "layer_top",
                                       "layer_bot"),
                               fraction=c("dataset_name",
                                          "site_name",
                                          "profile_name",
                                          "layer_name",
                                          "fraction_name",
                                          "f_scheme",
                                          "f_scheme_units")
                               )

  cat("\t",tab,"tab...")
  data_colnames<-colnames(data[[tab]])
  required_columns_tab<-required_columns[[tab]]

  missing<-required_columns_tab[!((required_columns_tab %in% data_colnames))]
  not_missing<-required_columns_tab[((required_columns_tab %in% data_colnames))]


  error=0

  if (length(missing>0)) {
    cat("\nWARNING...required column(s) missing from the '",tab,"' tab:\n")
    error<-error+1
    for (i in 1:length(missing)){
      cat("\t\t", missing[i] ,"\n")
    }
  }

  for (i in 1:length(not_missing)){
    col<-not_missing[i]
    required_column<-data[[tab]][,col]
    if ( length(required_column)==0 | any(c(NA, "", " ") %in% required_column)){
      cat("\nWARNING... missing values in required column '", col, "' from the '",tab,"' tab\n")
      error<-error+1

    }

  }

  if (error==0) cat("OK\n")
  if (tab=="fraction"){
    if (length(data[[tab]][,"f_property"])==0 | any(c(NA, "", " ") %in% data[[tab]][,"f_property"]))
      cat("\nNote... missing values in f_property tab in the '",tab,"' tab\n")
    if (length(data[[tab]][,"f_lower"])==0 | any(c(NA, "", " ") %in% data[[tab]][,"f_lower"]))
      cat("\nNote... missing values in f_lower tab in the '",tab,"' tab\n")
    if (length(data[[tab]][,"f_upper"])==0 | any(c(NA, "", " ") %in% data[[tab]][,"f_upper"]))
      cat("\nNote... missing values in f_upper tab in the '",tab,"' tab\n")
  }
return(error)
}
