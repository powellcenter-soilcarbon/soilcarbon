#' comparenames
#'
#' Compares the names at names between hierarchical levels, used in dataQC
#'
#' @param data directory to data file
#' @param name specific heirarchial name, ie. dataset_name
#'
#' @export
#'
#'

comparenames<-function(data, name){

  if (name == "dataset"){
  names<-list(
    unique(data$metadata$dataset_name),
    unique(data$site$dataset_name),
    unique(data$profile$dataset_name),
    unique(data$layer$dataset_name),
    unique(data$fraction$dataset_name)
  )
   }

  if (name == "site"){
    names<-list(
      unique(data$site$site_name),
      unique(data$profile$site_name),
      unique(data$layer$site_name),
      unique(data$fraction$site_name)
    )
  }


  if (name == "profile"){
    names<-list(
      unique(data$profile$profile_name),
      unique(data$layer$profile_name),
      unique(data$fraction$profile_name)
    )
  }

  if (name == "layer"){
    names<-list(
      unique(data$layer$layer_name),
      unique(data$fraction$layer_name)
    )
  }


  return(apply(combn(seq_along(names), 2), 2, function(n) names[[n[1]]] %in% names[[n[2]]]))

}
