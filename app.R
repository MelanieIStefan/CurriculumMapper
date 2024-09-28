#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

  
    # Application title
    titlePanel("Curriculum Mapping Tool"),

    
    mainPanel(

      
      # learning objectives upload
      p("Please upload your Learning Objectives."),
      p("Format requirments: .csv file, one line per learning objective"),
      p("Column 1: Short code"),
      p("Column 2: Full description"),
      p("Column 3: Additional Information"),
      
      fileInput("upload", NULL, buttonLabel = "Upload...", multiple = TRUE),
      tableOutput("files")

      # classes upload
      
      
      
      # mapping tool with tickboxes
      
      # planning tool?
      
      # output: colourful map
      
      # quadrant map
      
            
    )
    
    

)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  
  output$files <- renderTable(input$upload)

  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
