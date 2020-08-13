# Libraries
library(shiny)

# UI component
ui <- fluidPage(

  includeCSS("styles.css"),

  # Application title
  titlePanel(windowTitle = "RApp Newsletter",
    h1("Subscribe to Shiny RApp Newsletter")
       ),

  # Sidebar Layout
  sidebarLayout(
    sidebarPanel(
      h4("CREATE ACCOUNT"),
        textInput(inputId = "email", label = "EMAIL ADDRESS", width = "50%"),
        passwordInput(inputId = "password", label = "PASSWORD", width = "50%"),

      h4("PERSONAL INFORMATION"),
        # Name
        textInput(inputId = "lastname", label = "NAME", placeholder = "Last Name",  width = "50%"),
        textInput(inputId = "firstname", label = "", placeholder = "First Name", width = "50%"),

        # Birthday
        dateInput(inputId = "birthday", label = "BIRTHDAY", value = NULL, format = "yyyy-mm-dd", width = "50%"),

        # Sex
        radioButtons(inputId = "sex", label = "SEX", choices = c("Male", "Female"), selected = NULL),

        # Marital Status
        selectInput(inputId = "marital", label = "MARITAL STATUS", choices = c("Single", "Married", "Widowed"), width = "50%")
    ),
    mainPanel(
      h4("SUMMARY"),
      textOutput("name")
    )
  )
)

# Server component
server <- function(input, output) {
  output$name <- renderText(
    paste("Name:", input$firstname, input$lastname)
  )
}

# Run the application
shinyApp(ui = ui, server = server)
