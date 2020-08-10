shinyServer(function(input, output){
    # show map using googleVis
    output$map <- renderGvis({
        gvisGeoChart(bycountry, "country", input$selected,
                     options=list( width="auto", height="auto"))
    })
    
    # # show histogram using googleVis
    # output$hist <- renderGvis({
    #     gvisHistogram(state_stat[,input$selected, drop=FALSE])
    # })
    # 
    # # show data using DataTable
    output$table <- DT::renderDataTable({
        datatable(bycountry, rownames=FALSE) %>%
            formatStyle(input$selected, background="skyblue", fontWeight='bold')
    })
    # 
    # show statistics using infoBox
    output$maxBox <- renderInfoBox({
        max_value <- max(bycountry[,input$selected])
        max_country <- 
            bycountry$country[bycountry[,input$selected] == max_value]
        infoBox(max_country, max_value, icon = icon("hand-o-up"))
    })
    output$minBox <- renderInfoBox({
        min_value <- min(bycountry[,input$selected])
        min_country <- 
            bycountry$country[bycountry[,input$selected] == min_value]
        infoBox(min_country, min_value, icon = icon("hand-o-down"))
    })
    # output$avgBox <- renderInfoBox(
    #     infoBox(paste("AVG.", input$selected),
    #             mean(bycountry[,input$selected]),
    #             icon = icon("calculator"), fill = TRUE))
})

