shinyServer(function(input, output){
    # show map using googleVis
    # output$map <- renderGvis({
    #     gvisGeoChart(owid_bycountry , "location",
    #                  options=list( width="auto", height="auto"))
    # })
    
    # })
    # Function to plot trends in a country
    plot_trends <- function(){
        bycountry_date %>% 
            group_by(date) %>%
            filter(country == input$country, type == "confirmed")%>% 
            ggplot(aes(x = date, y = total_cases)) +
            geom_line()
    }
    output$plot_eachcountry <- plotly::renderPlotly({
        plot_trends()  
    })
    
    # # show data using DataTable
    output$table_eachcountry <- DT::renderDT({
        bycountry_date
         })
})

#     # 
    # show statistics using infoBox
    # output$maxBox <- renderInfoBox({
    #     max_value <- max(owid_covid[,input$selected])
    #     max_country <-
    #         owid_covid$location[owid_covid[,input$selected] == max_value]
    #     infoBox(max_country, max_value, icon = icon("hand-o-up"))
    # })
    # output$minBox <- renderInfoBox({
    #     min_value <- min(owid_covid[,input$selected])
    #     min_country <-
    #         owid_covid$location[owid_covid[,input$selected] == min_value]
    #     infoBox(min_country, min_value, icon = icon("hand-o-down"))
    })
#     # output$avgBox <- renderInfoBox(
#     #     infoBox(paste("AVG.", input$selected),
#     #             mean(bycountry[,input$selected]),
#     #             icon = icon("calculator"), fill = TRUE))
# })

