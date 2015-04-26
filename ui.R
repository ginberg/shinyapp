library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Faithful Geyser eruptions"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Faithful Geyser"),
      br(),
      p("Old Faithful is a cone geyser located in Wyoming, in Yellowstone National Park in the United States. 
        Old Faithful was named in 1870 during the Washburn-Langford-Doane Expedition and was the first geyser in the park
        to receive a name. It is one of the most predictable geographical features on Earth, erupting almost every 63 minutes. 
        The geyser, as well as the nearby Old Faithful Inn, is part of the Old Faithful Historic District."),
      img(src="old-faithful.jpg", height = 200, width = 200)
    ),
    # Show a plot of the generated distribution
    mainPanel(            
      plotOutput("distPlot"),
      p("The plot above shows the duration of the eruptions. With the slider below you can choose the number of time intervals (bins)"),
      br(),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    )
  )
))