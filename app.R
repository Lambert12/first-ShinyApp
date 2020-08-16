####################################
# NZUNGIZE Labert                  #
# Email: nzulapa@outlook.com       #
# https://github.com/Lambert12      #
####################################

# Modified from https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/

library(shiny)
data("Loblolly")

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Height"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of Loblolly pine trees:",
                  min = 1,
                  max = 100,
                  value = 20)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    
    x    <- Loblolly$height
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "blue", border = "black",
         xlab = "height level",
         main = "Histogram of Growth of Loblolly pine trees by height")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
