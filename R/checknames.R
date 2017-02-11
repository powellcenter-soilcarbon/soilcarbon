#' checknames
#'
#' Check the names of different levels in the dataset to make sure they match, used in dataQC
#'
#' @param data soilcarbon data
#' @param name specific heirarchial name, ie. dataset_name
#' @export
#'

checknames<-function(data, name){

  cat("\t", name, "...")

  level_names<-getnames(data, name)
  names_compared<-comparenames(level_names)

  if(F %in% names_compared){
    message("\nWARNING... '", name, "' names do not match at different levels, see below:")
    for (i in 1:length(level_names)){
      cat("\t","\t", name, "names in", names(level_names)[i], " tab... \n")
      if (length(level_names[[i]])>0){
      for (j in 1:length(level_names[[i]])){
        cat("\t","\t", j, ". ", as.character(level_names[[i]][j]), "\n")
      }
      } else cat("\t\t NONE \n")
    }

    }else cat("OK\n")

  }


