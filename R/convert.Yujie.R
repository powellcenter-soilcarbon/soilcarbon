#' convert.Yujie
#'
#' This function converts data compiled by Yuije into format compatable with the soilcarbon template
#'
#' @param Yujie_file directory to Yuije data file
#' @import XLConnect
#' @import utils
#' @export

convert.Yuije<- function(Yujie_file){

  library(soilcarbon)

  template_file<-system.file("extdata", "Master_template.xlsx", package = "soilcarbon")
  template<-read.soilcarbon(file=template_file, template=T)
  str(template)

  library(XLConnect)
  Yujie_file="~/Dropbox/Powell Center/Yujie_dataset.xlsx"
  Yujie_workbook<-loadWorkbook(Yujie_file)
  Yujie_data<-readWorksheet(object=Yujie_workbook , sheet=1, header = T)


  template$metadata<-testframe

  blank_metadata<-as.data.frame(apply(template$metadata,2, function(x) return(rep(NA, length(unique(Yujie_data$reference))))))

  template$metadata$dataset_name<-unique(Yujie_data$reference)
  template$metadata$dataset_name<

    View(template$metadata)

  which(is.na(Yujie_data$reference))


}


