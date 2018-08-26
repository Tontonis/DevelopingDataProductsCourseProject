#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to take input parameters
# generate model and display some corresponding output
shinyServer(function(input, output) {

  
  output$tableDat <- renderText({
    library(formula.tools)
    listoffactors <- c(input$parameters)
    outputEq<-reformulate(termlabels = listoffactors, response = 'Fertility')
    paste("The model that the Swiss dataset is being fitted to is ", deparse(outputEq))
    
})

  output$modelBlock <- renderText({
    
    dataSet<-swiss
    # Parse input variables into list
    listoffactors <- c(input$parameters)
    outputEq<-reformulate(termlabels = listoffactors, response = "Fertility")
    
    # Build linear model based on input factors
    
    

    model<-lm(outputEq,data=dataSet)
    
    rmse<- (summary(model)$r.squared)
    rmse<-format(rmse,nsmall=2)
    rmseMod<- (summary(model)$r.squared*100)
    rmseMod<-format(rmseMod,nsmall=2)
    
    string<-paste("The model chosen has a RMSE of ", rmse,". ")
    string<-paste(string,"This means about ",rmseMod, "% of the data is represented by this model")
    
  })
  
})