library(shiny)
library(tm)

source("./coreFunc.R")

shinyServer(
        function(input, output) {
                        ctxt <- reactive({cleanText(as.character(input$txt))})
                        wordprediction <- reactive({
                                wordlist <- predictNextWord(ctxt())
                                data.frame(NextWord = wordlist)
                        })
                        output$enter <- renderText({
                                input$Go
                                input$txt
                        })
                        output$nextWord <- renderTable({
                                input$Go
                                wordprediction()
                        },include.rownames = FALSE)
        }
)