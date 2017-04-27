#' convert.Yujie
#'
#' This function converts data compiled by Yuije into format compatable with the soilcarbon template
#'
#' @param Yujie_file directory to Yuije data file
#' @import utils
#' @export

convert.Yuije<- function(Yujie_file){

  Yujie_dataset<-read.csv(Yujie_file, na.strings = c(""," ", "  "))
  levels(Yujie_dataset$reference)<-c(levels(Yujie_dataset$reference), "no_ref")
  Yujie_dataset$reference[which(is.na(Yujie_dataset$reference))] <- as.factor("no_ref")
  Yujie_dataset<-Yujie_dataset[-which(is.na(Yujie_dataset$Lon)),]

  Yujie_dataset_clean<-data.frame()
  sites<-unique(Yujie_dataset$Site)
  for (i in 1:length(sites)){
    site<-subset(Yujie_dataset, Yujie_dataset$Site==sites[i])
    if (length(unique(site$Lon))>1 | length(unique(site$Lat))>1){
      site$Site<-as.character(site$Site)
      latlons<-as.list(as.data.frame(t(cbind(site$Lat, site$Lon))))
      for (j in 1:length(unique(latlons))){
        site$Site[which(as.numeric(site$Lon)==unique(latlons)[[j]][2] & as.numeric(site$Lat)==unique(latlons)[[j]][1])]<-paste(sites[i], j, sep="_")
      }
    }
    Yujie_dataset_clean<-rbind(Yujie_dataset_clean, site)
  }

  clean_sites<-unique(Yujie_dataset_clean$Site)
  Yujie_dataset_sites<-data.frame()
  for (i in 1:length(clean_sites)){
    site<-subset(Yujie_dataset_clean, Yujie_dataset_clean$Site==clean_sites[i])[1,]
    Yujie_dataset_sites<-rbind(Yujie_dataset_sites, site)
  }

Yujie_dataset_clean$profile_name<-paste(Yujie_dataset_clean$Site, Yujie_dataset_clean$ProfileID, sep="_")
clean_profiles<-unique(Yujie_dataset_clean$profile_name)

Yujie_dataset_profiles<-data.frame()
for (i in 1:length(clean_profiles)){
  profile<-subset(Yujie_dataset_clean, Yujie_dataset_clean$profile_name==clean_profiles[i])[1,]
  Yujie_dataset_profiles<-rbind(Yujie_dataset_profiles, profile)
}

Yujie_dataset_clean$layer_name<-paste(Yujie_dataset_clean$profile_name, Yujie_dataset_clean$Layer_bottom, Yujie_dataset_clean$Layer_top, sep="_")

Yujie_soilcarbon<-list(metadata=data.frame(dataset_name=c("Yujie_non_peat_synthesis")),
                       site=data.frame(dataset_name=rep("Yujie_non_peat_synthesis", nrow(Yujie_dataset_sites)),
                                       site_name=Yujie_dataset_sites$Site,
                                       lat=Yujie_dataset_sites$Lat,
                                       long=Yujie_dataset_sites$Lon,
                                       parent_material=Yujie_dataset_sites$ParentMaterial,
                                       slope=Yujie_dataset_sites$Slope,
                                       slope_shape=Yujie_dataset_sites$SlopePosition,
                                       aspect=Yujie_dataset_sites$Aspect,
                                       veg_note=Yujie_dataset_sites$VegTypeCodeStr_Local,
                                       country=Yujie_dataset_sites$Country,
                                       state_province=Yujie_dataset_sites$State_City,
                                       mat=Yujie_dataset_sites$MAT,
                                       map=Yujie_dataset_sites$MAP,
                                       elevation=Yujie_dataset_sites$Elevation),
                       profile=data.frame(dataset_name=rep("Yujie_non_peat_synthesis", nrow(Yujie_dataset_profiles)),
                                        site_name=Yujie_dataset_profiles$Site,
                                        profile_name=Yujie_dataset_profiles$profile_name,
                                        observation_date=Yujie_dataset_profiles$SampleYear,
                                        soil_taxon=Yujie_dataset_profiles$SoilOrder_LEN_USDA_original),
                       layer=data.frame(dataset_name=rep("Yujie_non_peat_synthesis", nrow(Yujie_dataset_clean)),
                                        site_name=Yujie_dataset_clean$Site,
                                        profile_name=Yujie_dataset_clean$profile_name,
                                        layer_name=Yujie_dataset_clean$layer_name,
                                        layer_top=Yujie_dataset_clean$Layer_top,
                                        layer_bot=Yujie_dataset_clean$Layer_bottom,
                                        hzn=Yujie_dataset_clean$HorizonDesignation,
                                        rc_year=Yujie_dataset_clean$Measurement_Year,
                                        X13c=Yujie_dataset_clean$d13C,
                                        X14c=Yujie_dataset_clean$D14C_BulkLayer,
                                        X14c_sigma=Yujie_dataset_clean$D14C_err,
                                        bd_tot=Yujie_dataset_clean$BulkDensity,
                                        bet_surface_area=Yujie_dataset_clean$SpecificSurfaceArea,
                                        ph_h2o=Yujie_dataset_clean$PH_H2O,
                                        c_tot=Yujie_dataset_clean$pct_C,
                                        n_tot=Yujie_dataset_clean$pct_N,
                                        c_to_n=Yujie_dataset_clean$CN,
                                        sand_tot_psa=Yujie_dataset_clean$sand_pct,
                                        silt_tot_psa=Yujie_dataset_clean$silt_pct,
                                        clay_tot_psa=Yujie_dataset_clean$clay_pct,
                                        cat_exch=Yujie_dataset_clean$cation_exch,
                                        fe_dith=Yujie_dataset_clean$Fe_d,
                                        fe_ox=Yujie_dataset_clean$Fe_o,
                                        fe_py=Yujie_dataset_clean$Fep,
                                        al_py=Yujie_dataset_clean$Alp,
                                        al_dith=Yujie_dataset_clean$Ald,
                                        al_ox=Yujie_dataset_clean$Alo,
                                        smect_vermic=Yujie_dataset_clean$Smectite),
                       fraction=data.frame())
attributes(Yujie_soilcarbon)$file_name<-Yujie_file

return(Yujie_soilcarbon)
}
