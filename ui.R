?nottem


library(shiny)

# Rely on the 'nottem' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Daily Closing Prices of Major European Stock Indices, 1991–1998"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("index", label = "Select a European stock index:",
                    choices=colnames(EuStockMarkets)),
        hr(),
               
        helpText("The daily closing prices of major European stock indices: Germany DAX (Ibis), Switzerland SMI, France CAC, and UK FTSE. The data are sampled in business time, i.e., weekends and holidays are omitted. The data were kindly provided by Erste Bank AG, Vienna, Austria.")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("stockPlot"),
        hr(),
        h4("Summary"),
        verbatimTextOutput("summary")
      )
      
    )
  )
)