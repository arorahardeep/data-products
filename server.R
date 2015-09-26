library(shiny)
library(ggplot2)
data("mtcars")

scatterPlot <- function(xvar,yvar,dat) {
  g <- ggplot(dat, aes_string(x=xvar, y=yvar)) +
    geom_point(shape=1) +  
    geom_smooth(method=lm) 
  g
}

shinyServer( function(input, output){
  
  selectedData <- reactive({
    mtcars[, c(input$predictor, input$response)]
  })
  
  regModel <- reactive({
    regFromula <- as.formula(paste(input$response,input$predictor,sep="~"))
    summary(lm(regFromula, data=selectedData()))
  })
  
  output$regPlot <-  renderPlot( {
    scatterPlot(input$predictor,input$response,selectedData())
  })
  
  output$regSummary <- renderPrint({
    regModel()$coefficients
  })
  
}
)
