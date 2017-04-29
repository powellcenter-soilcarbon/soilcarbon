#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(colourpicker)
library(soilcarbon)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  theme = "bootstrap_simplex.css",

  # Application title
  headerPanel("Powell Center soilcarbon workbench"),

  sidebarPanel(

    conditionalPanel(condition="input.conditionedPanels==1",
                     helpText("Make plots with the soilcarbon database"),
    selectInput("y_var", "Depth Variable:",
                list("Top of layer" = "layer_top",
                     "Bottom of layer" = "layer_bot"
                     )),
    selectInput("x_var", "X Variable:",
                list("C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot",
                     "Bulk Density" = "bd_tot"
                ),
                selected = "bd_tot"),

    fluidRow(column(7,   selectInput("col_facet_var", "Panel Variable:",
                list("None" = "NULL",
                     "C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot",
                     "Bulk Density" = "bd_tot",
                     "MAP" = "map",
                     "MAT" = "mat"
                ),
                selected = "map")),
                column(5, textInput("col_facet_thresh", "threshold", value = "1000"))),

    fluidRow(column(7,   selectInput("row_facet_var", "Panel Variable 2:",
                                     list("None" = "NULL",
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
                    "C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot",
                    "Bulk Density" = "bd_tot",
                    "MAP" = "map",
                    "MAT" = "mat"
                ),
                selected = "mat")),
             column(5, sliderInput("alpha", "transparency", min = 0,
        max = 1, value = 0.7))),

    selectInput("size_var", "Size Variable:",
                list("None" = "NULL",
                     "C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot",
                     "Bulk Density" = "bd_tot",
                     "MAP" = "map",
                     "MAT" = "mat"
                )),
    downloadButton("download_database", "Download Database (flattened)")),

  conditionalPanel(condition="input.conditionedPanels==2",
                   h3("Template file"),
                   downloadButton("download_template", "Download soilcarbon Template file"),
                   h4("Tips for filling out template file:"),
                   HTML("<ul><li>The 'metadata', 'site', 'profile', 'layer', and 'fraction' tabs are required in order to upload file to database</li><li>Variables with red column names are required and cannot have missing values.</li><li>Values in the variables called 'dataset_name', 'site_name', 'profile_name', and 'layer_name' must match across tabs in which they are found.</li><li>Check the 'controlled vocabulary' tab for acceptable values for certain variables</li></ul>")
              )
  ),

  mainPanel(tabsetPanel(
    tabPanel("Database", plotOutput("plot"), value=1),
    tabPanel("Add data to database", value=2 , helpText("To add a dataset to the soilcarbon database, the data must pass a quality control check without any warning messages, for questions email Grey (greymonroe@gmail.com)"),
             fileInput("upload", label = "Upload data"),
             conditionalPanel(
               condition = "output.fileUploaded",
               downloadButton("download_dataqc", "download quality control report"),
               helpText("If the quality control report does not have any warning messages, you may submit the data by emailing it to Grey (greymonroee@gmail.com). Thanks!")
             )
             ),
    id = "conditionedPanels"
      )
    )
))
