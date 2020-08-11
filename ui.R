shinyUI(
    dashboardPage(skin = "blue",
    dashboardHeader(title="COVID-19"),
    dashboardSidebar(
        sidebarMenu(
            id = "tabs",
            menuItem("Worldwide", tabName = "map", icon = icon("globe")),
            menuItem("Select a Country", tabName = "by_country", icon = icon("map")),
            menuItem("About Me", tabName = "about_me")
                      )
                  ),
     dashboardBody(
            tabItems(
            tabItem(tabName = "map",
                    fluidPage(
                        titlePanel("COVID-19 Dashboard"),
                    tabsetPanel(
                        tabPanel("map",
                                 fluidRow(infoBoxOutput("maxBox"),
                                          infoBoxOutput("minBox")),
                                 fluidRow(box(htmlOutput("map"), height = 300)),
                        tabPanel("data",
                                fluidRow(box(DT::dataTableOutput("table"), width = 12)))
                            )
                        )
                    )),
            tabItem(tabName = "by_country",
                    fluidPage(
                        titlePanel("COVID-19 Dashboard"),
                        sidebarLayout(
                            sidebarPanel(
                                selectInput('country', 'Select Country', bycountry_date$country)
                            ),
                            mainPanel(
                                tabsetPanel(
                                    tabPanel('Plot', plotly::plotlyOutput('plot_eachcountry')),
                                    tabPanel('Table', DT::DTOutput('table_eachcountry'))
                                )
                            )
                        )
                    )
            )
            
            )
     )
    ))


####################################
# DRAFTS BELOW
####################################

# fluidPage(
#     # page title
#     titlePanel("COVID-19 Dashboard"),
#     # set theme - shinythemes::themeSelector() = test out themes
#     theme = shinythemes::shinytheme("superhero"),
# 
#     sidebarLayout(
#         sidebarPanel(
#             selectInput('country', 'Select Country', bycountry_date$country)
#         ),
#         mainPanel(
#             tabsetPanel(
#                 tabPanel('Plot', plotly::plotlyOutput('plot_eachcountry')),
#                 tabPanel('Table', DT::DTOutput('table_eachcountry'))
#             )
#         )
#     )
# )                    

# fluidPage(
# theme=shinytheme("slate"),
#     tags$head(
#         tags$style(HTML("
#           .navbar .navbar-header {float: right}
#         "))
#     ),
#     navbarPage(
#         title="COVID-19 Dashboard take 2",
#         id="nav",
#         position="fixed-top",
#         collapsible=TRUE,
#         sidebarLayout(
#             sidebarPanel(
#                 selectInput('country', 'Select Country', bycountry_date$country)
#             ),
#             mainPanel(
#                 tabsetPanel(
#                     tabPanel('Plot', plotly::plotlyOutput('plot_eachcountry')),
#                     tabPanel('Table', DT::DTOutput('table_eachcountry'))
#                 )
#             )
#         )
#         
#         # navbarMenu("EXPLORE", icon=icon('compass'),
#         #            sidebarUserPanel("Isabel",
#         #                         image = "https://yt3.ggpht.com/-04uuTMHfDz4/AAAAAAAAAAI/AAAAAAAAAAA/Kjeupp-eNNg/s100-c-k-no-rj-c0xffffff/photo.jpg"),
#         #             sidebarMenu(
#         #                 menuItem("Map", tabName = "map", icon = icon("map")),
#         #                 menuItem("Data", tabName = "data", icon = icon("database"))
#         #                 ),
#         #             selectizeInput("selected",
#         #                             "Select Item to Display",
#         #                             choice)                  
#         # ),
#         # mainPanel(
#         #         tabsetPanel(
#         #             tabPanel("map",
#         #                     fluidRow(infoBoxOutput("maxBox"),
#         #                              infoBoxOutput("minBox")),
#         #                     fluidRow(box(htmlOutput("map"), height = 300)),
#         #             tabPanel("data",
#         #                     fluidRow(box(DT::dataTableOutput("table"), width = 12)))
#         #     )
#         # )))
#     )
# )
# 
# )))))



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


