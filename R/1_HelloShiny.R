
library(shiny)
# runExample("01_hello")
# runApp("newdir") #The script app.R lives in a directory (for example, newdir/)
# runApp("App-1", display.mode = "showcase") #display in showcase mode (with the app.R script in the display)

# Define a UI (user interface) object for app that draws a histogram ----
ui <- fluidPage( #to create a display that automatically adjusts to the dimensions of your user’s browser window
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
    )
  )
)

# Define server function required to draw a histogram ----
server <- function(input, output) {
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
}

# Create Shiny app ---- a call to the shinyApp function
shinyApp(ui = ui, server = server)


# library(shiny)
# # See above for the definitions of ui and server
# Define UI ----
# ui <- fluidPage(
#   
# )
# # Define server logic ----
# server <- function(input, output) {
#   
# }
# # Run the app ----
# shinyApp(ui = ui, server = server)









