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
  headerPanel("Powell Center soilcarbon data visualizer"),

  sidebarPanel(

    conditionalPanel(condition="input.conditionedPanels==1",
                     helpText("Make plots with all of the soil carbon data"),
    selectInput("y_var", "Y Variable:",
                list("Top of layer" = "layer_top",
                     "Bottom of layer" = "layer_bot"
                     )),
    selectInput("x_var", "X Variable:",
                list("C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot"
                )),

     selectInput("size_var", "Size Variable:",
                list("None" = "NULL",
                    "C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot"
                )),


    div(style="display:inline-block; width: 50%",
        selectInput("col_var", "Color Variable:",
                list("None" = "NULL",
                    "C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot"
                ))),
    div(style="display:inline-block; width: 15%", colourInput("color1","", "dodgerblue", showColour = "background")),
    div(style="display:inline-block; width: 15%", colourInput("color2", "", "darkorange", showColour = "background")),
    div(style="width: 150px;",    sliderInput("alpha", "Alpha", min = 0,
        max = 1, value = 0.4)),
    width=3
  ),

  conditionalPanel(condition="input.conditionedPanels==2",
                   helpText("View the complete soilcarbon dataset"),
                   fileInput("download", label = "download data")),


  conditionalPanel(condition="input.conditionedPanels==3",
                   helpText("Add your own data to the soilcarbon dataset!"),
                   fileInput("upload", label = "Upload data", accept = "xslx"),
                   helpText("View the data"),
                   radioButtons("tab",label="tab:",
                                choices = list("metadata" = "metadata", "site" = "site", "profile" = "profile", "layer" = "layer", "fraction" = "fraction"),
                                selected = "metadata"),
                   helpText("Check your own data for compatability with soilcarbon"),
                   downloadButton("download_dataqc", "download quality control report"))

  ),

  mainPanel(tabsetPanel(
    tabPanel("Plot", plotOutput("plot"), value=1),
    tabPanel("soilcarbon dataset", dataTableOutput("table"), value=2),
    tabPanel("Add data to the dataset", value=3 , dataTableOutput("uploaded_table")),
    tabPanel("data template", value=4),
    id = "conditionedPanels"
      )
    )
))

