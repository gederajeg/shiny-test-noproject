library(shiny)

ui <- fluidPage( # a layout function: it sets up the basic visual structure of the page
    
    # input control: allowing user interacts with the app by providing a value (e.g., the select box labelled "Dataset")
		## selectInput(inputId = "dataset", label = "Dataset", choices = ls("package:datasets")),
	  textInput(inputId = "name", label = "What's your name?"),	
	  
	  numericInput(inputId = "age", label = "How old are you?", value = NA),
    
		# output control displaying code
		## verbatimTextOutput(outputId = "summary"),
		textOutput("greeting"),
		
		# output control displaying table
		## tableOutput(outputId = "table")
		tableOutput(outputId = "mortgage"),
		
		# plotOutput(outputId = "histogram") # this code needs to be added if we want the histogram output code to be shown (from exercise no. 1 in Chapter 1)
		
)

server <- function(input, output, session) {
  
  # Create a reactive expression ({...}) to retrieve the dataset once
  dataset <- reactive(
    
    {
      # the input$dataset is populated with the current value of the UI component with ID (i.e., inputId) "dataset"
      get(input$dataset, "package:datasets")
      
    }
    
  )
  
  # prepare the "how" to Shiny to generate the output
  # the output$summary is referenced with the UI (outputId = "summary") above
  #output$summary <- renderPrint( # a render{Type} function paired with verbatimTextOutput(), a {type}Output function
    
  #  {
  #    # In this R expression ({...}), we tell shiny to store the output of summary() on the "dataset" into the output$summary
  #    summary(dataset())
  #  }
    
  #)
  
  output$greeting <- renderText(
    
    {
      
      paste0("Hello ", input$name)
      
    }
    
    
  )
  
  ## output$histogram <- renderPlot(
    
  ##  {
      
  ##    hist(rnorm(1000))
      
  ##  }, res = 96
    
    
  ## )
  
  ## output$table <- renderTable(
    
  ##  {
      
  ##    dataset()
      
  ##  }
    
  ## )
  
}

shinyApp(ui, server)