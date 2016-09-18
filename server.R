library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  # System configuration
  lambda <- 0.2
  simulations <- 1000
  
  # Global variables
  # x label for all plots
  xlabel <- reactive({
    paste("Averages of",  input$exps, "exponentials")
  })
  
  # Calculate means of samples
  means <- reactive({
    set.seed(952)
    means <- NULL
    for (i in 1 : simulations) {
      means = c(means, mean(rexp(input$exps, lambda)))
    }
    means
  })

  # Calculate theoretical mean
  dist_mean = 1/lambda
  
  # Calculate sample mean
  sample_mean <- reactive({
    mean(means())
  })

  # Calculate theoretical variance
  dist_sd = 1/lambda
  th_var = (dist_sd^2)/40
  
  # Calculate sample variance
  sample_var <- reactive({
    var(means())
  })  
  
  # The distribution with sample and theoretical means
  output$meanPlot <- renderPlot({
    base <- qplot(means(), geom="histogram")
    base <- base + labs(title = "Fig 1. The distribution with sample and theoretical means")
    base <- base + labs(y = "Count", x = xlabel())
    base <- base + geom_point(aes(x = dist_mean, y = 0), colour="red", size = 4)
    base <- base + geom_vline(xintercept = sample_mean(), size = 1, colour="green")
    print(base)
  })
  
  # The distribution with sample and theoretical variances
  output$varPlot <- renderPlot({
    base <- qplot(means(), geom="density")
    base <- base + labs(title = "Fig 2. The distribution with sample and theoretical variances")
    base <- base + labs(y = "Density", x = xlabel())
    base <- base + stat_function(fun=dnorm, size=1, color="red", args=list(mean=sample_mean(), sd=sd(means())))
    print(base)
  })

  # Summary
  output$sampleMean <- renderText({
    paste("- Sample mean:", sample_mean())
  })

  output$distMean <- renderText({
    paste("- Theoretical mean:", dist_mean)
  })    

  output$sampleVar <- renderText({
    paste("- Sample variance:", sample_var())
  })
  
  output$distVar <- renderText({
    paste("- Theoretical variance:", th_var)
  })  
})
