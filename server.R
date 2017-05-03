#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw both scatterplots
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate variables based on input from ui.R
    par(mfrow = c(1,2))
    main_var <- mtcars[, input$main_var]
    second_var <- mtcars[, input$second_var]
    third_var <- mtcars[, input$third_var]
    # draw the scatterplots with the specified variables and draw linear best fit
   plot(main_var, second_var, xlim = c(min(mtcars[, input$main_var]), max(mtcars[, input$main_var])), ylim = c(min(mtcars[, input$second_var]), max(mtcars[, input$second_var])), xlab = 'Main Variable', ylab = 'second_var')
   abline(lm(mtcars[, input$second_var] ~ mtcars[, input$main_var]))
   legend('topright', legend = paste0('R-squared = ', cor(mtcars[, input$main_var], mtcars[, input$second_var])))
   plot(main_var, third_var, xlim = c(min(mtcars[, input$main_var]), max(mtcars[, input$main_var])), ylim = c(min(mtcars[, input$third_var]), max(mtcars[, input$third_var])), xlab = 'Main Variable', ylab = 'third_var')
   abline(lm(mtcars[, input$third_var] ~ mtcars[, input$main_var]))
   legend('topright', legend = paste0('R-squared = ', cor(mtcars[, input$main_var], mtcars[, input$third_var]))) 
  })
  
})
