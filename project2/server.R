function(input, output) {

    
    
    
    ### World Map
    
    
    
    output$worldmap2 = renderPlotly({
        
        clean1 = clean %>% filter(., Year==input$worldmap_year)
        
        plot_geo(clean1) %>% 
            add_trace(z = clean1[, input$worldmap_data], color = clean1[, input$worldmap_data], 
                      colors = 'Greens',
                      text = clean1$Country, 
                      locations = clean1$Code, 
                      marker = list(line = list(color = toRGB("grey"), width = 0.5))) %>% 
            colorbar(title = '', ticksuffix = '') %>% 
            layout(geo = list(
                showframe = FALSE,
                showcoastlines = FALSE,
                projection = list(type = 'Mercator')
            ))
        
    })
    
}