## Introduction

This is the first part of Coursera's Developing Data Products class project. My Shiny Application is motivated by the Coursera's Statistical Inference class https://github.com/cobu2b/statinference-project/blob/master/partI.pdf. The application allows us to adjust the size of the samples used for calculating their mean in order to represent sample population. We can compare sample and theoretical means and variances of the exponential distribution based on the different sizes. Central Limit Theorem can be used to explain the distributions.

## File description
1. ui.R: This R script defines layout and components of the applicaiton's user interface.
    - exps of the sliderInput passes a user's input to the Shiny engine.
    - meanPlot and varPlot are rendered plots defined in server.R
    - sampleMean, distMean, sampleVar, distVar are rendered the values of the sample and theoretical means and variances.
2. server.R: This R script processes a user's inputs and defines the values of the output's components defined in ui.R
    - input$exps: the size of the samples used for calculating their mean in order to represent sample population
    - means, sample_mean, sample_var, th_var are assigned via reactive funtions for sample populations, sample mean, sample variance, and theoretical variance. These variables are dependent on input$exps.