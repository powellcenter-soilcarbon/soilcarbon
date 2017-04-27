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
shinyServer(function(input, output) {
  library(ggplot2)
  
  output$plot <- renderPlot({
    
    variables<-list(
    y_var=input$y_var,
    x_var=input$x_var,
    size_var=input$size_var,
    col_var=input$col_var
    )

    variables[which(variables=="NULL")]<-NULL
    
    plot_data<-na.omit(Yujie_flat[,unlist(variables)])
    
    p<-ggplot(plot_data, aes_string(x=variables$x_var, y=variables$y_var,size=variables$size_var, col=variables$col_var))+
      geom_point(alpha=0.5)+
      scale_colour_gradient(low="blue", high="red")+
      scale_y_reverse()+
      theme_classic()
    print(p)
    
  })

})
  