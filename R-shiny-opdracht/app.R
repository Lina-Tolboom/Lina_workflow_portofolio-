# R Shiny-app: geneesmiddelrespons in kankercellijnen

library(shiny)
library(dplyr)
library(ggplot2)

# Data inladen
shiny_data <- readRDS("data/shiny_drug_response_data.rds")

# User interface: wat de gebruiker ziet
ui <- fluidPage(
  
  titlePanel("Geneesmiddelrespons in kankercellijnen"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        inputId = "geneesmiddel",
        label = "Kies een geneesmiddel:",
        choices = sort(unique(shiny_data$DRUG_NAME)),
        selected = "Camptothecin"
      ),
      
      helpText(
        "Een lagere LN_IC50-waarde betekent dat een cellijn gevoeliger is voor het gekozen geneesmiddel."
      )
    ),
    
    mainPanel(
      
      h3(textOutput("titel")),
      
      plotOutput("ic50_grafiek")
    )
  )
)

# Server: wat de app doet met de keuze van de gebruiker
server <- function(input, output) {
  
  geselecteerde_data <- reactive({
    
    shiny_data %>%
      filter(DRUG_NAME == input$geneesmiddel) %>%
      arrange(LN_IC50) %>%
      slice_head(n = 20)
    
  })
  
  output$titel <- renderText({
    paste("Meest gevoelige cellijnen voor", input$geneesmiddel)
  })
  
  output$ic50_grafiek <- renderPlot({
    
    ggplot(
      geselecteerde_data(),
      aes(x = reorder(CELL_LINE_NAME, LN_IC50), y = LN_IC50)
    ) +
      geom_col() +
      coord_flip() +
      labs(
        subtitle = "Top 20 cellijnen met de laagste LN_IC50-waarde",
        x = "Cellijn",
        y = "LN_IC50"
      ) +
      theme_minimal()
    
  })
}

# Start de app
shinyApp(ui=ui, server = server)