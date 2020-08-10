shinyServer(function(input, output){
    # show map using googleVis
    # output$map <- renderGvis({
    #     gvisGeoChart(bycountry, "country", input$selected,
    #                  options=list( width="auto", height="auto"))
    # })
    # 
    # # show histogram using googleVis
    output$plot_eachcountry <- plotly::renderPlotly({
        bycountry_date
    })
 
    # # show data using DataTable
    output$table_eachcountry <- DT::renderDT({
        bycountry_date
         })
})

#     # 
#     # show statistics using infoBox
#     output$maxBox <- renderInfoBox({
#         max_value <- max(bycountry[,input$selected])
#         max_country <- 
#             bycountry$country[bycountry[,input$selected] == max_value]
#         infoBox(max_country, max_value, icon = icon("hand-o-up"))
#     })
#     output$minBox <- renderInfoBox({
#         min_value <- min(bycountry[,input$selected])
#         min_country <- 
#             bycountry$country[bycountry[,input$selected] == min_value]
#         infoBox(min_country, min_value, icon = icon("hand-o-down"))
#     })
#     # output$avgBox <- renderInfoBox(
#     #     infoBox(paste("AVG.", input$selected),
#     #             mean(bycountry[,input$selected]),
#     #             icon = icon("calculator"), fill = TRUE))
# })

