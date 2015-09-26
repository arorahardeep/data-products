library(shiny)
data("mtcars")

shinyUI(fluidPage(
    headerPanel("Regression Demo"),
    sidebarLayout(
      sidebarPanel(
        selectInput('response','Select a response variable',choices = colnames(mtcars)),
        selectInput('predictor','Select a predictor variable',choices = colnames(mtcars))
      ),
      mainPanel(
        h3("Regression plot"),
        plotOutput('regPlot'),
        h3("Regression coefficients"),
        verbatimTextOutput('regSummary')
      )
    )
  )
)
