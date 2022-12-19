library(shiny)
library(tidyverse)
library(h2o)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("united"),
                titlePanel(h1("Klientu mokumo analize")),
                sidebarLayout(
                  sidebarPanel(
                    fileInput("file", "Ikelkite faila",
                              accept = ".csv",
                              placeholder = "Nepasirinktas failas"),
                uiOutput("download")),
    mainPanel(
      sliderInput(inputId = "num",
                  label = "Pasirinkite rezultatu kieki",
                  value = 5, min = 1, max = 20),
      tableOutput("table")
    )
  )
)
server <- function(input, output) {
  h2o.init()
  model <- h2o.loadModel("project/4-model/my_model1")
  
  output$table <- renderTable({
    req(input$file$datapath)
    df <- h2o.importFile(input$file$datapath)
    results <- h2o.predict(model, df)
    
     results %>%
        as_tibble() %>%
        mutate("Eil. Nr." = row_number(), "Mokumo tikimybe" = p0, "Rezultatas" = ifelse(predict == 0, "Gera paskola", "Bloga paskola")) %>%
        select("Eil. Nr.", "Mokumo tikimybe", "Rezultatas") %>%
        head(n=input$num)

  },
 
    spacing = "l",
     bordered = TRUE,
     width = 400,
     align = "ccc",
     colnames = TRUE)
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$file, "-predictions.csv", sep = "")
    },
  content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    })
  
  output$download <- renderUI({
    if(!is.null(input$file)) {
      downloadButton('downloadData', 'Download Output File')
    }
  })

}

shinyApp(ui = ui, server = server)