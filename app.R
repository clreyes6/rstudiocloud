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
      h4("CREATE ACCOUNT"), width = 3,
      textInput(inputId = "email", label = "EMAIL ADDRESS", width = "80%"),
      passwordInput(inputId = "password", label = "PASSWORD", width = "80%"),

      h4("PERSONAL INFORMATION"),
      # Name
      textInput(inputId = "lastname", label = "NAME", placeholder = "Last Name",  width = "80%"),
      textInput(inputId = "firstname", label = "", placeholder = "First Name", width = "80%"),

      # Birthday
      dateInput(inputId = "birthday", label = "BIRTHDAY", value = 0, min = NULL, max = NULL, format = "yyyy-mm-dd", width = "80%"),

      # Sex
      radioButtons(inputId = "sex", label = "SEX", choices = c("Male", "Female"), selected = NULL),

      # Marital Status
      selectizeInput(inputId = "marital", label = "MARITAL STATUS", choices = c("Single", "Married", "Widowed"), selected = NULL, width = "80%", multiple = TRUE, options = list(maxItems = 2)),

      # Language
      checkboxGroupInput(inputId = "language", label = "LANGUAGE", choices = c("Filipino", "English", "Others, please specify")),

      # Number of Children
      numericInput(inputId = "children", label = "NUMBER OF CHILDREN", min = 1, max = 100, value = 0, width = "80%"),

      # Work Experience
      sliderInput(inputId = "workexperience", label = "WORK EXPERIENCE IN YEARS", min = 0, max = 50, value = NULL, width = "80%"),

      # Attached Photo
      fileInput(inputId = "attachment", label = "UPLOAD PHOTO", accept = c(".png", ".jpg", ".svg"), multiple = FALSE, width = "80%")
    ),
    mainPanel(
      h4("SUMMARY"),
      textOutput("name"),
      textOutput("birthday"),
      textOutput("age"),
      textOutput("sex"),
      span("Marital Status:"),
      textOutput("marital", inline = TRUE),
      div(),
      span("Language:"),
      textOutput("language", inline = TRUE),
      textOutput("children"),
      textOutput("workexperience"),
      textOutput("email")
    )
  )
)

# Server component
server <- function(input, output) {
  # Name output
  output$name <- renderText(
    paste("Name:", input$firstname, input$lastname)
  )

  # Birthday output
  output$birthday <- renderText(
    paste("Birthday:", input$birthday)
  )

  # Age calculation
  library(eeptools) 
  calc_age <- age_calc(dob = as.Date('1991-04-28'), units = 'years')
  absage = round(calc_age, digits = 0)

  # Age output
  output$age <- renderText(
    paste("Age:", absage)
  )

  # Sex output
  output$sex <- renderText(
    paste("Sex:", input$sex)
  )

  # Marital status output
  output$marital <- renderText(
    paste(input$marital)
  )

  # Language
  output$language <- renderText(
    paste(input$language)
  )

  # Children
  output$children <- renderText(
    paste("Number of Children:", input$children)
  )

  # Work Experience
  output$workexperience <- renderText(
    paste("Work Experience in Years:", input$workexperience)
  )

  # Email
  output$email <- renderText(
    paste("Email Address:", input$email)
  )
}

# Run the application
shinyApp(ui = ui, server = server)
