
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
library(shiny)

data(iris)
library(rpart)
fit <- rpart(Species~.,data=iris)

shinyServer(function(input, output) {
  
  # predict species of input characteristics
  pred <- reactive({as.character(predict(fit,data.frame(Sepal.Length=input$Sepal.Length,
                                          Sepal.Width=input$Sepal.Width,
                                          Petal.Length=input$Petal.Length,
                                          Petal.Width=input$Petal.Width),
                                         type="class"))
  })
  # determine colors based on species
  mycols <- ifelse(iris$Species=="setosa","black",
                   ifelse(iris$Species=="versicolor","blue","red"))
  mypredcol <- reactive({
    ifelse(pred()=="setosa","black",
    ifelse(pred()=="versicolor","blue","red"))
  })
  # render plot, with prediction and legend
  output$scatterPlot <- renderPlot({
      plot(iris[,input$plotVar1],iris[,input$plotVar2],xlab=input$plotVar1,ylab=input$plotVar2,col=mycols);
      points(input[[input$plotVar1]],input[[input$plotVar2]],pch=19,col=mypredcol());
      legend("bottomright",c("setosa","versicolor","virginica","predicted"),col=c("black","blue","red",mypredcol()),pch=c(1,1,1,19))
  })
  output$predText <- renderText({paste0("The predicted species is ",pred(),".")})
  
})
