library(shiny)

# Rely on the nottem dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$stockPlot <- renderPlot({
    
    # Render line plot of time series for market
    plot.ts(EuStockMarkets[,input$index],
            ylab="Daily closing price",
            xlab="Date")
  })
  
  # Fill in the spot we created for a plot
  output$summary <- renderPrint({
    dataset <- EuStockMarkets[,input$index]
    summary(dataset)
  })
  
  
})

