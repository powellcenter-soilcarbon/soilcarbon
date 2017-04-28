#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  library(ggplot2)

  data(data="soilcarbon_database", package="soilcarbon")
  output$plot <- renderPlot({

    variables<-list(
    y_var=input$y_var,
    x_var=input$x_var,
    size_var=input$size_var,
    col_var=input$col_var
    )
    variables[which(variables=="NULL")]<-NULL

    plot_data<-na.omit(soilcarbon_database[,unlist(variables)])

    if(is.null(variables$size)){
      p<-ggplot(plot_data, aes_string(x=variables$x_var, y=variables$y_var, col=variables$col_var))+
        geom_point(alpha=input$alpha, size=3)+
        scale_colour_gradient(low=input$color1, high=input$color2)+
        scale_y_reverse()+
        theme_classic(base_size = 18)
      print(p)
    }else {

    p<-ggplot(plot_data, aes_string(x=variables$x_var, y=variables$y_var,size=variables$size_var, col=variables$col_var))+
      geom_point(alpha=input$alpha)+
      scale_colour_gradient(low=input$color1, high=input$color2)+
      scale_y_reverse()+
      theme_classic(base_size = 18)+
      scale_size_continuous(range = c(1, 7))
    print(p)
}
  })
  output$table <- renderDataTable(soilcarbon_data)

  dummy <- reactiveValues(dataset=NULL)

  observeEvent(input$upload, {
  dummy$dataset=read.soilcarbon(input$upload$datapath)
})


  output$uploaded_table <- renderDataTable(dummy$dataset[[input$tab]])

    output$download_dataqc<-downloadHandler(
      filename = "soilcarbon_dataQC_report.txt",
      content = function(file) {

        dataQC(dummy$dataset, writeQCreport=T, outfile = file)

        }
      )

})

