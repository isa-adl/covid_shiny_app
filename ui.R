fluidPage(
    # page title
    titlePanel("COVID-19 Dashboard"),
    # set theme - shinythemes::themeSelector() = test out themes
    theme = shinythemes::shinytheme("superhero"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput('country', 'Select Country', bycountry$country)
        ),
        mainPanel(
            tabsetPanel(
                tabPanel('Plot', plotly::plotlyOutput('plot_eachcountry')),
                tabPanel('Table', DT::DTOutput('table_eachcountry'))
            )
        )
    )
)



# shinyUI(fluidPage(
#     titlePanel("COVID-19 Dashboard"),
#     theme = shinythemes ::
#     dashboardHeader(title = "My Dashboard"),
#     dashboardSidebar(
#         
#         sidebarUserPanel("Isabel",
#                          image = "https://yt3.ggpht.com/-04uuTMHfDz4/AAAAAAAAAAI/AAAAAAAAAAA/Kjeupp-eNNg/s100-c-k-no-rj-c0xffffff/photo.jpg"),
#         sidebarMenu(
#             menuItem("Map", tabName = "map", icon = icon("map")),
#             menuItem("Data", tabName = "data", icon = icon("database"))
#         ),
#         selectizeInput("selected",
#                        "Select Item to Display",
#                        choice)
#     ),
#     mainPanel(
#         tabsetPanel(
#             tabPanel("map",
#                     fluidRow(infoBoxOutput("maxBox"),
#                              infoBoxOutput("minBox")),
#                     fluidRow(box(htmlOutput("map"), height = 300)),
#                              box(htmlOutput("plot"), height = 300)),
#             tabPanel("data",
#                     fluidRow(box(DT::dataTableOutput("table"), width = 12)))
#     )
# )))


