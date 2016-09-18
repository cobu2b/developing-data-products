library(shiny)

shinyUI
(
  fluidPage
  (
    # Application title
    titlePanel("Analysis of Exponential Distribution"),
  
    # Overview
    h3("Overview"),
    h4("This application helps in analyzing sample and theoretical means and variances of the exponential distribution. 
       The application will generate 1,000 means of samples and then use them for calculating the sample and theoretical means and variances."),
  
    # User guide
    h3("User Guide"),
    h4("1. Adjust the number of exponentials per mean sample using the slider input to see changes of the sample and theoretical means and variances"),
    h4("2. Fig 1 show means: green line is the sample mean, red dot is the theoretical mean"),
    h4("3. Fig 2 show distributions: black line is the sample distribution, red line is the theoretical distribution"),
    h4("Note The values of the sample and theoretical means and variances are shown below."),
  
    # Sidebar with a slider input for a number of exponentials per mean sample
    sidebarLayout
    (
      sidebarPanel
      (
        sliderInput("exps",
                    "Number of exponentials per mean sample:",
                    min = 1,
                    max = 50,
                    value = 40)
      ),
    
      # Show the plots of the generated distribution
      mainPanel
      (
        plotOutput("meanPlot"),      
        plotOutput("varPlot")
      )
    ),
  
    # Summary
    h3("Sample and theoretical means"),
    textOutput("sampleMean"),
    textOutput("distMean"),
    textOutput("sampleVar"),
    textOutput("distVar")
  )
)
