library(shiny)
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlotly({
    duration = faithful$eruptions   # the eruption durations 
    bins <- seq(min(duration), max(duration), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    plot <- ggplot(faithful, aes(x=eruptions)) + geom_histogram(breaks = bins, col="white", fill="blue") + ylab("  ") + xlab(" ")
    ggplotly(plot) %>% layout(xaxis = list(title = "Eruption duration (min)"), yaxis = list(title = "Count")) 
  })
})