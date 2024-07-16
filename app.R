library(shiny)

ui <- fluidPage( # a layout function: it sets up the basic visual structure of the page
    
    # input control: allowing user interacts with the app by providing a value (e.g., the select box labelled "Dataset")
		selectInput(inputId = "dataset", label = "Dataset", choices = ls("package:datasets")),
		
		# output control displaying code
		verbatimTextOutput(outputId = "summary"),
		
		# output control displaying table
		tableOutput(outputId = "table")
)

server <- function(input, output, session) {

}

shinyApp(ui, server)