
library(soilcarbon)
library(ggplot2)


shinyUI(fluidPage(

  theme = "bootstrap_simplex.css",

  # Application title
  headerPanel("Powell Center soilcarbon workbench"),

  sidebarPanel(


  conditionalPanel(condition="input.conditionedPanels==1",
                   h3("Template file"),
                   downloadButton("download_template", "Download soilcarbon Template file"),
                   h4("Tips for filling out template file:"),
                   HTML('Check out the template info <a href="https://powellcenter-soilcarbon.github.io/soilcarbon/site_files/Template_info.html" target="_blank">here</a>.')
              ),
  conditionalPanel(condition="input.conditionedPanels==2",
                   h3("Visualize database"),
                   fluidRow(column(6, selectInput("y_var", "Y Variable:",
                                                  list("None (histogram)" = "NULL",
                                                       "Top of layer" = "layer_top",
                                                       "Bottom of layer" = "layer_bot",
                                                       "C14" = "X14c",
                                                       "Total Carbon" = "c_tot",
                                                       "Total Nitrogen" = "n_tot",
                                                       "Bulk Density" = "bd_tot",
                                                       "MAP" = "map",
                                                       "MAT" = "mat"
                                                  ),
                                                  selected = "layer_bot")),
                            column(6, selectInput("x_var", "X Variable:",
                                                  list("C14" = "X14c",
                                                       "Top of layer" = "layer_top",
                                                       "Bottom of layer" = "layer_bot",
                                                       "C14" = "X14c",
                                                       "Total Carbon" = "c_tot",
                                                       "Total Nitrogen" = "n_tot",
                                                       "Bulk Density" = "bd_tot",
                                                       "MAP" = "map",
                                                       "MAT" = "mat"
                                                  ),
                                                  selected = "bd_tot"))),

                   fluidRow(column(7,   selectInput("col_facet_var", "Panel Variable:",
                                                    list("None" = "NULL",
                                                         "Top of layer" = "layer_top",
                                                         "Bottom of layer" = "layer_bot",
                                                         "C14" = "X14c",
                                                         "Total Carbon" = "c_tot",
                                                         "Total Nitrogen" = "n_tot",
                                                         "Bulk Density" = "bd_tot",
                                                         "MAP" = "map",
                                                         "MAT" = "mat"
                                                    ),
                                                    selected = "map")),
                            column(5, textInput("col_facet_thresh", "threshold", value = "500"))),

                   fluidRow(column(7,   selectInput("row_facet_var", "Panel Variable 2:",
                                                    list("None" = "NULL",
                                                         "Top of layer" = "layer_top",
                                                         "Bottom of layer" = "layer_bot",
                                                         "C14" = "X14c",
                                                         "Total Carbon" = "c_tot",
                                                         "Total Nitrogen" = "n_tot",
                                                         "Bulk Density" = "bd_tot",
                                                         "MAP" = "map",
                                                         "MAT" = "mat"
                                                    ),
                                                    selected = "mat")),
                            column(5, textInput("row_facet_thresh", "threshold", value = "5"))),

                   fluidRow(column(7,  selectInput("col_var", "Color Variable:",
                                                   list("None" = "NULL",
                                                        "Top of layer" = "layer_top",
                                                        "Bottom of layer" = "layer_bot",
                                                        "C14" = "X14c",
                                                        "Total Carbon" = "c_tot",
                                                        "Total Nitrogen" = "n_tot",
                                                        "Bulk Density" = "bd_tot",
                                                        "MAP" = "map",
                                                        "MAT" = "mat"
                                                   ),
                                                   selected = "mat")),
                            column(5, sliderInput("alpha", "transparency", min = 0,
                                                  max = 1, value = 0.4))),

                   selectInput("size_var", "Size Variable:",
                               list("None" = "NULL",
                                    "C14" = "X14c",
                                    "Total Carbon" = "c_tot",
                                    "Total Nitrogen" = "n_tot",
                                    "Bulk Density" = "bd_tot",
                                    "MAP" = "map",
                                    "MAT" = "mat"
                               )),
                   h3("Download database"),
                   downloadButton("download_database", "Download Database (flattened)"))

  ),

  mainPanel(tabsetPanel(

    tabPanel("Add data to database", value=1 , h3("Quality Control Check"),
             helpText("To add a dataset to the soilcarbon database, the data must pass a quality control check without any warning messages, for questions email Grey (greymonroe@gmail.com)"),
             fileInput("upload", label = "Upload data"),
             conditionalPanel(
               condition = "output.fileUploaded",
               downloadButton("download_dataqc", "download quality control report"),
               helpText("If the quality control report does not have any warning messages, you may submit the data by emailing it to Grey (greymonroe@gmail.com). Thanks!")
             )
             ), tabPanel("Database", plotOutput("plot"), value=2),
    id = "conditionedPanels"
      )
    ),
  tags$script('
        Shiny.addCustomMessageHandler("resetFileInputHandler", function(x) {
              var el = $("#" + x);
              el.replaceWith(el = el.clone(true));
              var id = "#" + x + "_progress";
              $(id).css("visibility", "hidden");
              });
              ')
))

