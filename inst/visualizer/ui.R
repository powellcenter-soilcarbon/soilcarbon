#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Powell Center soilcarbon data visualizer"),

  sidebarPanel(
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
    selectInput("col_var", "Color Variable:",
                list("None" = "NULL",
                    "C14" = "X14c",
                     "Total Carbon" = "c_tot",
                     "Total Nitrogen" = "n_tot"
                ))
  ),

  mainPanel(plotOutput("plot"))
))

