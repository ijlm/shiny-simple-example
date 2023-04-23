library(shiny)

ui <- fluidPage(
  headerPanel("Example reactive"),
  mainPanel(
    # input field
    textInput("user_text", label = "Enter some text:", placeholder = "Please enter some text."),
    # display text output
    textOutput("text"))
)

server <- function(input, output) {
  # reactive expression
  text_reactive <- reactive({ input$user_text })
  
  # text output
  output$text <- renderText({
    text_reactive()
  })
}
shinyApp(ui = ui, server = server)




ui <- fluidPage(
  headerPanel("Example eventReactive"),
  mainPanel(
    # input field
    textInput("user_text", label = "Enter some text:", placeholder = "Please enter some text."),
    # submit button
    actionButton("submit", label = "Submit"),
    # display text output
    textOutput("text"))
)

server <- function(input, output) {
  # reactive expression
  text_reactive <- eventReactive( input$submit, {  input$user_text})
  
  # text output
  output$text <- renderText({
    text_reactive()
  })
}
shinyApp(ui = ui, server = server)




ui <- fluidPage(
  headerPanel("Example reactiveValues"),
  mainPanel(
    # input field
    textInput("user_text", label = "Enter some text:", placeholder = "Please enter some text."),
    actionButton("submit", label = "Submit"),
    # display text output
    textOutput("text"))
)

server <- function(input, output) {
  # observe event for updating the reactiveValues
  observeEvent(input$submit, { text_reactive$text <- input$user_text})
    # reactiveValues
  text_reactive <- reactiveValues(
    text = "No text has been submitted yet."
  )
  # text output
  output$text <- renderText({
    text_reactive$text
  })
}
shinyApp(ui = ui, server = server)



ui <- fluidPage(
  headerPanel("Example reactive"),
  mainPanel(
    # action buttons
    actionButton("button1","Button 1"),
    actionButton("button2","Button 2")
  )
)

server <- function(input, output) {
  # observe button 1 press.
  observeEvent(input$button1, {
    # The observeEvent takes no dependency on button 2, even though we refer to the input in the following line.
    input$button2  
    showModal(modalDialog(
      title = "Button pressed",   "You pressed one of the buttons!"
    ))
  })
}
shinyApp(ui = ui, server = server)



ui <- fluidPage(
  headerPanel("Example reactive"),
  mainPanel(
    # action buttons
    actionButton("button1","Button 1"),
    actionButton("button2","Button 2")
  )
)

server <- function(input, output) {
  # observe button 1 press.
  observe({
    input$button1
    input$button2  
    showModal(modalDialog(
      title = "Button pressed",
      "You pressed one of the buttons!"
    ))
  })
}
shinyApp(ui = ui, server = server)





