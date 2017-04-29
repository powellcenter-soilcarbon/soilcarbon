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


  output$plot <- renderPlot({

    variables<-list(
    y_var=input$y_var,
    x_var=input$x_var,
    size_var=input$size_var,
    col_var=input$col_var,
    col_facet_var=input$col_facet_var,
    row_facet_var=input$row_facet_var
    )
    variables[which(variables=="NULL")]<-NULL

    plot_data<-na.omit(soilcarbon_database[,unlist(variables)])
    plot_data$facet_cut<-""
    plot_data$facet_cut2<-""
    col_facet_thresh<-NA
    row_facet_thresh<-NA

    if ((input$col_facet_thresh != "" & !is.null(variables$col_facet_var))){
      col_facet_thresh<-as.numeric(input$col_facet_thresh)
      plot_data$facet_cut<-plot_data[,variables$col_facet_var] < col_facet_thresh
      plot_data$facet_cut[which(plot_data$facet_cut)]<-paste(variables$col_facet_var, " < ", col_facet_thresh)
      plot_data$facet_cut[which(plot_data$facet_cut==F)]<-paste(variables$col_facet_var, " > ", col_facet_thresh)
    }

    if ((input$row_facet_thresh != "" & !is.null(variables$row_facet_var))){
      row_facet_thresh<-as.numeric(input$row_facet_thresh)
      plot_data$facet_cut2<-plot_data[,variables$row_facet_var] < row_facet_thresh
      plot_data$facet_cut2[which(plot_data$facet_cut2)]<-paste(variables$row_facet_var, " < ", row_facet_thresh)
      plot_data$facet_cut2[which(plot_data$facet_cut2==F)]<-paste(variables$row_facet_var, " > ", row_facet_thresh)
    }


    if(is.null(variables$size)){
      p<-ggplot(plot_data, aes_string(x=variables$x_var, y=variables$y_var, col=variables$col_var))+
        geom_point(alpha=input$alpha, size=2)+
        facet_grid(facet_cut2~facet_cut)+
        scale_colour_gradient(low="dodgerblue", high="orange")+
        scale_y_reverse()+
        theme_light(base_size = 16)+
        theme(strip.background = element_blank())+
        theme(strip.text = element_text(colour = 'black'))
      print(p)
    }else {

    p<-ggplot(plot_data, aes_string(x=variables$x_var, y=variables$y_var,size=variables$size_var, col=variables$col_var))+
      geom_point(alpha=input$alpha)+
      scale_colour_gradient(low="dodgerblue", high="orange")+
      facet_grid(facet_cut2~facet_cut)+
      scale_y_reverse()+
      theme_light(base_size = 16)+
      theme(strip.background = element_rect(fill="white"))+
      theme(strip.text = element_text(colour = 'black'))+
      scale_size_continuous(range = c(1, 10))
    print(p)
}
  })

  output$download_database<-downloadHandler(
    filename = "soilcarbon_Database.csv",
    content = function(file) {
      write.csv(soilcarbon_database, file)
    }
  )


#### add data

  output$download_template<-downloadHandler(
    filename = "soilcarbon_master_template.xlsx",
    content = function(file) {
      template_file <- system.file("extdata", "Master_template.xlsx", package = "soilcarbon")
      file.copy(from=template_file, to=file)
    }
)



  output$fileUploaded <- reactive({
    return(!is.null(input$upload))
  })

 outputOptions(output, 'fileUploaded', suspendWhenHidden=FALSE)

    output$download_dataqc<-downloadHandler(
      filename = "soilcarbon_dataQC_report.txt",
      content = function(file) {
        dataset=read.soilcarbon(input$upload$datapath)
        dataQC(dataset, writeQCreport=T, outfile = file)
        }
      )




})

