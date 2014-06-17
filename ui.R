
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Flower classifier"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    h3("Plot variables"),
    selectInput("plotVar1","Show display variable for x-axis",
                choices=list("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")),
    selectInput("plotVar2","Show display variable for y-axis",
                choices=list("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")),
    h3("Plant characteristics"),
    sliderInput("Petal.Length","Petal Length",1.0,6.9,4.0,0.1),
    sliderInput("Petal.Width","Petal Width",0.1,2.5,1.3,0.1),
    sliderInput("Sepal.Length","Sepal Length",4.3,7.9,6.0,0.1),
    sliderInput("Sepal.Width","Sepal Width",2.0,4.4,3.0,0.1)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h2("Flower species prediction, and relation to training set"),
    plotOutput("scatterPlot"),
    textOutput("predText")
  )
))
