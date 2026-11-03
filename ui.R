library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Car Fuel Efficiency (MPG) Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      h3("1. Input Specifications"),
      
      numericInput("wt", 
                   "Weight of the Vehicle (in 1000 lbs):", 
                   value = 3.2, 
                   min = 1.5, 
                   max = 6.0, 
                   step = 0.1),
      
      radioButtons("am", 
                   "Transmission Type:",
                   choices = list("Automatic" = 0, "Manual" = 1),
                   selected = 0),
      
      hr(),
      h3("How to Use This App"),
      p("This application uses a linear regression model built on the classic R 'mtcars' dataset to forecast a vehicle's fuel efficiency."),
      p("1. Enter the vehicle weight in the numeric box above (e.g., 3.2 represents 3,200 lbs)."),
      p("2. Select whether the vehicle has an Automatic or Manual transmission."),
      p("3. The application will instantly recalculate and display the predicted Miles Per Gallon (MPG) and its position on the plot in the right panel.")
    ),
    
    mainPanel(
      h3("Prediction Results"),
      
      h4("Predicted Fuel Efficiency:"),
      verbatimTextOutput("pred_mpg"),
      
      h4("Where your input sits compared to the dataset:"),
      plotOutput("mpgPlot")
    )
  )
))