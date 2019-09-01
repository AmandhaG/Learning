library(shiny)

# Define UI for application 
ui <- fluidPage(
    
    sliderInput(inputId = "num", label = "Choose the number of Simulations", value=150, min=100,max=5000),
    
    radioButtons(inputId="Dist",label="Choose Distribution",choices=c("Normal","Gamma")),
    
    plotOutput("hist")
)

# Define server logic 
server <- function(input, output) {
    
    output$hist = renderPlot({
        title = paste("Histogram of", input$num, "random",input$Dist, "Values")
        
        if(input$Dist=="Gamma"){
            hist(rgamma(input$num,shape=0.5,scale=1),main=title, xlab="Value")
        }else{
            hist(rnorm(input$num),main=title, xlab="Value")
        }
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

