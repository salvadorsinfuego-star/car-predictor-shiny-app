library(shiny)
library(datasets)

fit <- lm(mpg ~ wt + am, data = mtcars)

shinyServer(function(input, output) {
  
  predicted_value <- reactive({
    input_data <- data.frame(wt = input$wt, am = as.numeric(input$am))
    prediction <- predict(fit, newdata = input_data)
    return(round(prediction, 2))
  })
  
  output$pred_mpg <- renderText({
    paste(predicted_value(), "Miles Per Gallon (MPG)")
  })
  
  output$mpgPlot <- renderPlot({
    col_vector <- ifelse(mtcars$am == 0, "red", "blue")
    
    plot(mtcars$wt, mtcars$mpg, 
         xlab = "Weight (1,000 lbs)", 
         ylab = "Miles Per Gallon (MPG)",
         main = "Dataset Distribution vs. Your Input",
         pch = 19, col = col_vector)
    
    legend("topright", legend = c("Automatic", "Manual", "Your Prediction"),
           col = c("red", "blue", "green"), pch = c(19, 19, 18), cex = 1.2)
    
    points(input$wt, predicted_value(), col = "green", pch = 18, cex = 2.5)
  })
})