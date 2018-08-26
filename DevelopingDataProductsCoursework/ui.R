#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# Idea: Introduce the concept of adding multiple parameters to a linear model to build a better fit? Do so with radial buttons

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Building a more comprehensive model!"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("parameters", "Select Variables to include in model:",
                    c("Agriculture"="Agriculture",
                    "Examination"="Examination",
                    "Education"="Education",
                    "Catholic"="Catholic",
                    "Infant Mortality"="Infant.Mortality"),
                    selected="Education"),
      
      actionButton("update" ,"Update Model", icon("refresh"),
                   class = "btn btn-primary")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      h2("Introduction"),
      
      h5("This page aims to show how adding parameters to a model can improve the predictive power, but also how a model might not cover everything!"),
      h5("Using the information on Swiss demographic data, select parameters to use in a linear model"),
      h3("See how much of the model you can cover with the available parameters."),
      
      h2("The Model"),
      
      textOutput("tableDat"),
      textOutput("modelBlock")
       
    )
  )
))
