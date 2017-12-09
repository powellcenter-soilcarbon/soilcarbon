#' tabfromHe
#'
#' Creates a tab from Yujie He's database using the format of the Master_template
#'
#' @param dir directory where Yujie He database and Master_template files are stored in your local computer
#' @param tab target tab to be created. Only site, profile, layer, fraction are valid
#' @param Author Author of data to be extracted
#'
#' @return a data.frame with columns matching those of the template and additional columns appended at the end
#'
#' @import openxlsx
#' @export

tabfromHe=function(dir, tab, Author){

  requireNamespace("openxlsx")

  template=read.xlsx(paste(dir,"Master_template.xlsx", sep=""), sheet=tab)
  he=readYujie(Yujie_file=paste(dir,"Yujie_dataset.csv", sep=""))
  coltemp=colnames(template)
  hetab=he[[tab]]
  autset=hetab[hetab[,1]==Author,]

  colmatch1=(match(colnames(autset),coltemp))
  clm1=colmatch1[!is.na(colmatch1)]
  colmatch2=(match(coltemp,colnames(autset)))
  clm2=colmatch2[!is.na(colmatch2)]

  template[1:nrow(autset),]<-NA
  template[,clm1]=autset[,clm2]

  out=cbind(template,autset[-clm2])
  return(out)
}

