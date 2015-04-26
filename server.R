library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    duration = faithful$eruptions   # the eruption durations 
    bins <- seq(min(duration), max(duration), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(duration, breaks = bins, col = 'darkgray', border = 'white', ylab="Frequency", xlab="Eruption duration (min)", main="")
  })
})