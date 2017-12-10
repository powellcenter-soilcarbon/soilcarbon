#' saveYujieXlsx
#'
#' This function saves Yujie database as individual .xlsx files matching the template
#'
#' @param directory directory to save files
#'
#' @import openxlsx
#'
#' @export

saveYujieXlsx<-function(directory){
  requireNamespace("openxlsx")

  datasets<-readYujie(system.file("extdata", "Yujie_dataset.csv", package = "soilcarbon"))
  dataset_names<-unique(datasets$dataset_name)

  template_file<-system.file("extdata", "Master_template.xlsx", package = "soilcarbon")
  template<-read.soilcarbon(file=template_file, template=T)
  template<-lapply(template, function(x) {
    x[1,]<-c("description row1", rep("", ncol(x)-1))
    x[2,]<-c("description row2", rep("", ncol(x)-1))
    return(x)
  }
    )

  for (d in 1:length(dataset_names)){
    d_sub<-subset(datasets, datasets$dataset_name==dataset_names[d])

    dataset_object<-list()

    dataset_object$metadata<-rbind(template$metadata, d_sub[colnames(template$metadata)])
    dataset_object$metadata<-dataset_object$metadata[!duplicated(dataset_object$metadata),]

    dataset_object$site<-rbind(template$site,d_sub[colnames(template$site)])
    dataset_object$site<-dataset_object$site[!duplicated(dataset_object$site),]

    dataset_object$profile<-rbind(template$profile,d_sub[colnames(template$profile)])
    dataset_object$profile<- dataset_object$profile[!duplicated(dataset_object$profile),]

    dataset_object$layer<-rbind(template$layer,d_sub[colnames(template$layer)])
    dataset_object$layer<-dataset_object$layer[!duplicated(dataset_object$layer),]

    dataset_object$fraction<-template$fraction

    write.xlsx(dataset_object, file = paste0(directory, dataset_names[d], ".xlsx"))

  }

}
