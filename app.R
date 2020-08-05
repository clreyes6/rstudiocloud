library(shiny)

# UI component
ui <- fluidPage(
  # Application title
  titlePanel("Simple Shiny App"),
  
  # Sidebar Layout
  sidebarLayout(
    sidebarPanel("This is the sidebar panel"),
    mainPanel("This is the main panel")
  )
)

# Server component
server <- function(input, output) {
  # Blank
}

# Run the application
shinyApp(ui = ui, server = server)
