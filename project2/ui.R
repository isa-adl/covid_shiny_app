
fluidPage(
    theme=shinytheme("slate"),
    tags$head(
        tags$style(HTML("
          .navbar .navbar-header {float: right}
        ")) 
    ),
    navbarPage(
        title="COVID-19 Worldwide 2020",
        id="nav",
        position="fixed-top",
        collapsible=TRUE,
        
        tabPanel("WORLDWIDE", icon=icon('globe'),
                 br(),
                 br(),
                 br(),
                 fluidRow(h1("Global Covid-19 Rates")),
                 fluidRow(
                     column(3,
                            br(),
                            sliderInput(
                                inputId="worldmap_year", #change
                                label="Select Month:",
                                min=1, max=8,
                                value=8,
                                sep=""
                            ),
                     column(8,
                            plotlyOutput("worldmap2"))
                 )
                 
        )) #end of HOME tabPanel

)
)    
        
        
        


