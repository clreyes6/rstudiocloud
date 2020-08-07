# Libraries
library(shiny)

# UI component
ui <- fluidPage(
  # Application title
  titlePanel("Subscribe to Shiny RApp Newsletter"),
  
  # Sidebar Layout
  sidebarLayout(
    sidebarPanel(
      h4("CREATE ACCOUNT"),
        textInput(inputId = "email", label = "EMAIL ADDRESS", width = "50%"),
        passwordInput(inputId = "password", label = "PASSWORD", width = "50%"),

      h4("PERSONAL INFORMATION"),
        textInput(inputId = "lastname", label = "NAME", placeholder = "Last Name",  width = "50%"),
        textInput(inputId = "firstname", label = "", placeholder = "First Name", width = "50%")
    ),
    mainPanel("This is the main panel")
  )
)

# Server component
server <- function(input, output) {
  # Blank
}

# Run the application
shinyApp(ui = ui, server = server)
