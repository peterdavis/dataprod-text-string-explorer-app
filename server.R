

shinyServer(function(input, output) {
    # Reactive expression to generate the distance comparison This is 
    # called whenever the inputs change. The output functions defined 
    # below then all use the value computed from this expression
    data <- reactive({
        distance <- adist(input$startText,
                       input$endText,
                       partial = FALSE)
        
    })

    dataAttributes <- reactive({
        distance <- attr(adist(input$startText,
                          input$endText,
                          counts = TRUE,
                          partial = FALSE),"counts")
        
    })
    
    datatrafos <- reactive({
        distance <- attr(adist(input$startText,
                               input$endText,
                               counts = TRUE,
                               partial = FALSE),"trafos")
        
    })
    
    # In the code above, the call to isolate() is used inline in
    # a function call. However, isolate can take any expression,
    # as shown in the code below.
    output$startText <- renderText({
        
        str <- paste0('Starting text is "', input$startText, '"')
        
        
    })
    output$endText <- renderText({
        
        str <- paste0('Comparison Text is "', input$endText, '"')
        
        
    })    
    output$distance <- renderText({
        
        data()        
        
    })
    output$counts <- renderText({
        
        paste0('Inserts:', dataAttributes()[1],
               ' Deletes:', dataAttributes()[2], 
                ' Substitutions:', dataAttributes()[3])
        
        
    })
    
    output$trafos <- renderUI({
        
        paste0('Transformation Sequence:', datatrafos()[1])
        
        
    })
    
})
