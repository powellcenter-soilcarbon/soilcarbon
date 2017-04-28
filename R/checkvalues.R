#' checkvalues
#'
#' Check certain column values to match what is expected, used in dataQC
#'
#' @param data soilcarbon data
#' @param tab specific tab of dataset , ie. dataset_name
#' @export
#'

checkvalues<-function(data, tab){

  cat("\t",tab,"tab...")
  data_tab<-data[[tab]]

  error<-0
  if (tab=="metadata"){
  }

  if (tab=="site"){
    datum_vocab<-c("AGD84",
                   "ED50",
                   "ETRS89",
                   "GRS80",
                   "NAD83",
                   "OSGB36",
                   "WGS84", NA)
    error<-matchvocab(data_tab$datum, datum_vocab, var_name="datum", tab="site", error=error )
    climate_cat_vocab<-c("coastal mediterranean",
                         "dry winter, wet summer",
                         "highland climate",
                         "humid continental hot summer, wet all year",
                         "humid continental hot summer, wet all year",
                         "humid continental mild summer, dry winter",
                         "humid continental mild summer, wet all year",
                         "humid subtropical",
                         "ice cap",
                         "interior mediterranean",
                         "marine cool winter",
                         "marine mild wInter",
                         "mid-latitude dry arid desert",
                         "mid-latitude dry semiarid steppe",
                         "subarctic with cold winter, dry wInter",
                         "subarctic with cold winter, wet all year",
                         "subarctic with cool summer, dry winter",
                         "subarctic with cool summer, wet all year",
                         "subtropical dry arid desert",
                         "subtropical dry semiarid steppe",
                         "tropical monsoonal",
                         "tropical wet",
                         "tropical wet and dry",
                         "tundra", NA)
    error<-matchvocab(data_tab$climate_cat, climate_cat_vocab, var_name="climate_cat", tab="site", error=error )
    aspect_vocab<-c("N",
                    "S",
                    "E",
                    "W",
                    "NE",
                    "NW",
                    "SE",
                    "SW", NA)
    error<-matchvocab(data_tab$aspect, aspect_vocab, var_name="aspect", tab="site", error=error )
    slope_shape_vocab<-c("convergent",
                         "divergent",
                         "planar", NA)
    error<-matchvocab(data_tab$slope_shape,  slope_shape_vocab, var_name="slope_shape", tab="site", error=error )
    ecoregion_vocab<-c("boreal forest/taiga",
                        "desert or xeric shrubland",
                        "flooded grassland or savanna",
                        "mangrove",
                        "mediterranean forest, woodland, or scrub",
                        "montane grassland or shrubland",
                        "temperate broadleaf or mixed forest",
                        "temperate coniferous forest",
                        "temperate grassland, savanna and shrubland",
                        "tropical or subtropical coniferous forest",
                        "tropical or subtropical grassland, savanna, or shrubland",
                        "tropical or subtropical moist broadleaf forest",
                        "tundra", NA)
    error<-matchvocab(data_tab$ecoregion,  ecoregion_vocab, var_name="ecoregion", tab="site", error=error )
    land_cover_vocab<-c("bare",
                        "cultivated",
                        "forest",
                        "rangeland/grassland",
                        "shrubland",
                        "urban",
                        "wetland", NA)
    error<-matchvocab(data_tab$land_cover,  land_cover_vocab, var_name="land_cover", tab="site", error=error )
    drainage_class_vocab<-c("excessively",
                            "somewhat excessively",
                            "well",
                            "moderately well",
                            "somewhat poorly",
                            "poorly",
                            "very poorly", NA)
    error<-matchvocab(data_tab$drainage_class,  drainage_class_vocab, var_name="drainage_class", tab="site", error=error )
    parent_material_vocab<-c("igneous intrusive",
                             "igneous extrusive",
                             "igneous pyroclastic",
                             "metamorphic",
                             "sedimentary-clastics",
                             "organic",
                             "evaporites",
                             "interbedded", NA)
    error<-matchvocab(data_tab$parent_material,  parent_material_vocab, var_name="parent_material", tab="site", error=error )
    parent_chem_vocab<-c("mafic",
                         "felsic",
                         "intermediate", NA)
    error<-matchvocab(data_tab$parent_chem,  parent_chem_vocab, var_name="parent_chem", tab="site", error=error )

  }

  if (tab=="profile"){
    X2d_position_vocab<-c("summit",
                          "shoulder",
                          "backslope",
                          "footslope",
                          "toeslope",
                          "interfluve", NA)
    error<-matchvocab(data_tab$X2d_position,  X2d_position_vocab, var_name="X2d_position", tab="profile", error=error )

  }

  if (tab=="layer"){
    texture_class_vocab<-c("sand",
                           "loamy sand",
                           "sandy loam",
                           "loam",
                           "silt",
                           "silty loam",
                           "sandy clay loam",
                           "clay loam",
                           "silty clay loam",
                           "sandy clay",
                           "silty clay",
                           "clay", NA)
    error<-matchvocab(data_tab$texture_class,  texture_class_vocab, var_name="texture_class", tab="layer", error=error )
    mbc_method_vocab<-c("chloroform fumigation extraction",
                        "chloroform fumigation incubation",
                        "substrate induced respiration",
                        "total PLFA",
                        "other",
                        NA)
    error<-matchvocab(data_tab$mbc_method,  mbc_method_vocab, var_name="mbc_method", tab="layer", error=error )

  }

  if (tab=="fraction"){
    f_scheme_vocab<-c("SPT_Density",
                      "HF",
                      "Aggregate_Size",
                      "Particle_Size",
                      "Incubation")
    error<-matchvocab(data_tab$f_scheme,  f_scheme_vocab, var_name="f_scheme", tab="fraction", error=error )
    f_property_vocab<-c("sonicated",
                        "soluble",
                        "insoluble",
                        "wet sieve",
                        "dry sieve",
                        "HMP",
                        "respired",
                        "not respired")
    error<-matchvocab(data_tab$f_property,  f_property_vocab, var_name="f_property", tab="fraction", error=error )




  }

  if (error==0) cat("OK\n")

}
