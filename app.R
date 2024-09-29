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
      p("Column 3+: Additional Information"),
      
      # fileInput("upload", NULL, buttonLabel = "Upload...", multiple = TRUE),
      # tableOutput("files")

      fileInput("objectives", NULL, buttonLabel = "Upload...", multiple = TRUE),
      
      tableOutput("objectivesContents"),
      
      # classes upload
      p("Please upload a list of classes ."),
      p("Format requirments: .csv file, one line per class"),
      p("Column 1: Class code"),
      p("Column 2: Class name"),
      p("Column 3+: Additional Information"),
      
      
      fileInput("classes", NULL, buttonLabel = "Upload...", multiple = TRUE),
      tableOutput("classesContents")
      
        
      
      # mapping tool with tickboxes
      
      # planning tool?
      
      # output: colourful map
      
      # quadrant map
      
            
    )
    
    

)

# Define server logic required to draw a histogram
server <- function(input, output, session) {



  
    

  output$objectivesContents <- renderTable({
    req(input$objectives)
    objectivesTable <- read.csv(input$objectives$datapath)
    head(objectivesTable)
  })

  
  


  
  output$classesContents <- renderTable({
    req(input$classes)
    classesTable <- read.csv(input$classes$datapath)
    head(classesTable)[,1:2]
  })
  
  

  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
