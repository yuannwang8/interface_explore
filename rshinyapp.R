#
# This is a Shiny web application. 
#

# source relevant bits

library(shiny)

source("fnmakeBarPlot.R")

# Define UI inputs
ui <- fluidPage(
   
   # Application title
   titlePanel("A Simple Random Integer Generator"),
   
   # helpText
   helpText("Input the number of picks and the number of runs, then click submit."),
   
   # Sidebar slider inputs 
   sidebarLayout(
      sidebarPanel(
         sliderInput("npick",
                     "How many numbers to pick?",
                     min = 6,
                     max = 10,
                     value = 6) ,
         
         sliderInput("nrun",
                     "How many runs to make?",
                     min = 1,
                     max = 5000,
                     value = 100),

        submitButton("Submit") # comment submit button (and comma above) to make the output reactive
            
      ),
      
      # Main Panel outputs
      mainPanel(
        textOutput("thistext1"),
        textOutput("thistext2"),
        plotOutput("thisbarplot")
      )
   )
)

# Define server logic required to produce outputs
server <- function(input, output) {
   
  output$thistext1 <- renderText({
    paste0("Here's your pick input: ", input$npick)
  })

  output$thistext2 <- renderText({
    paste0("Here's twice your run input: ",2*input$nrun)
  })
  
  output$thisbarplot <- renderPlot({
    
     npick <- input$npick
     nrun <- input$nrun

     fn.makeBarPlot(npick, nrun)
     
   })

}

# Run the application 
shinyApp(ui = ui, server = server)

