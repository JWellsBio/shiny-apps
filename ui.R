#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
#######This app will build two scatterplots based on variables form the 'mtcars' dataset and display best linear fit
#######along with r-squared values
# Define UI for application that draws the scatterplots
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Correlation of mtcars Data"),
  
  # Sidebar with a selection input for variables to be plotted 
  sidebarLayout(
    sidebarPanel(
       selectInput('main_var', label = h3('Main Variable'), # this is the main variable to plotted on the x-axis
                   choices = colnames(mtcars)),
       selectInput('second_var', label = h4('First Dependent'), # this variable will be plotted along y-axis of graph 1
                   choices = colnames(mtcars)),
       selectInput('third_var',, label = h4('Second Dependent'),# this variable will be plotted along y-axis for graph 2
                   choices = colnames(mtcars))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
