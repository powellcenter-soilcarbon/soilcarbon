#' getnames
#'
#' Extracts the names at names between hierarchical levels, used to compare names between levels
#'
#' @param data directory to data file
#' @param name specific heirarchial name, ie. dataset_name
#'
#' @export
#'
#'

getnames<-function(data, name){

  if (name == "dataset"){
    names<-list(
      metadata=unique(data$metadata$dataset_name),
      site=unique(data$site$dataset_name),
      profile=unique(data$profile$dataset_name),
      layer=unique(data$layer$dataset_name),
      fraction=unique(data$fraction$dataset_name)
    )
  }

  if (name == "site"){
    names<-list(
      site=unique(data$site$site_name),
      profile=unique(data$profile$site_name),
      layer=unique(data$layer$site_name),
      fraction=unique(data$fraction$site_name)
    )
  }

  if (name == "profile"){
    names<-list(
      profile=unique(data$profile$profile_name),
      layer=unique(data$layer$profile_name),
      fraction=unique(data$fraction$profile_name)
    )
  }

  if (name == "layer"){
    names<-list(
      layer=unique(data$layer$layer_name),
      fraction=unique(data$fraction$layer_name)
    )
  }

return(names)
}
