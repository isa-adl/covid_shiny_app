fluidPage(
    theme = shinythemes::shinytheme("cerulean"),
    tags$head(
        tags$style(HTML("
          .navbar .navbar-header {float: right}
        ")) 
    ),
    navbarPage(
        title="COVID-19 WORLDWIDE",
        id="nav",
        position="fixed-top",
        collapsible=TRUE,
        
        tabPanel("WORLD MAP", icon=icon('globe'),
                 br(),
                 br(),
                 br(),
                 fluidRow(h1("COVID-19")),
                 fluidRow(
                     column(3, # this was set to 3
                            br(),
                            "Explore Worldwide COVID-19 data",
                            br(),
                            "The data is sourced from Our World in Data",
                            br(),
                            "Hover over maps and plots for details."
                     )),
                 #   # column(2,
                 #        br(),
                 #        wellPanel(h4(strong(htmlOutput("tag"))),
                 #                  h4(strong(htmlOutput("tag")))
                 #                  )
                 #        ),
                 # column(2,
                 #        br(),
                 #        wellPanel(h4(strong(htmlOutput("tag"))),
                 #                  h4(strong(htmlOutput("tag")))
                 #                  )
                 #        ),
                 # column(2,
                 #        br(),
                 #        wellPanel(h4(strong(htmlOutput("tag"))),
                 #                  h4(strong(htmlOutput("tag")))
                 #                  )
                 #        )
                 # ),
                 
                 
                 fluidRow(
                     column(3,
                            br(),
                            sliderInput("month", "Select Month:", min = 2, max = 8, value = 4)
                     ),
                     
                     column(8,
                            plotlyOutput("map"))
                     # tabItems(
                     #   tabItem(tabName = "map",
                     #     # fluidRow(infoBoxOutput("maxBox"),
                     #     #          infoBoxOutput("minBox")),
                     #     fluidRow(plotlyOutput("map"),
                     #   tabItem(tabName = "data",
                     #     fluidRow(box(DT::dataTableOutput("table2"), width = 12)))
                     # ))
                 )
        ), #end of HOME tabPanel
        
        
        
#########################################################
        
        navbarMenu("EXPLORE", icon=icon('compass'),
                   
                   tabPanel("Graphs",
                            br(),
                            br(),
                            br(),
                            fluidRow(h1("COVID-19 in countries with most cases")),
                            fluidRow(
                                # column(2,
                                #          br(),
                                sidebarLayout(
                                    sidebarPanel(
                                        selectInput('location', 'Select Country', top_7countries_OW$location)
                                        #     sliderInput("month", "Select Month:",
                                        #   min = 2, max = 8, value = 4, 
                                        # )
                                        # selectInput('month','Select Month', top_7countries_OW$month, multiple = TRUE)
                                    ),
                                    
                                    mainPanel(
                                        tabsetPanel(
                                            tabPanel('Plot', plotly::plotlyOutput('plot_top_7countries_OW')),
                                            tabPanel('Table', DT::DTOutput('table_top_7countries_OW'))
                                        ),
                                        br(),
                                        br(),
                                        br(),
                                        br(),
                                        plotOutput("plt_top_7countries"),
                                        br(),
                                        br(),
                                        plotOutput("plt_top_7countries_pm"),
                                        br(),
                                        br(),
                                        br(),
                                        br()
                                    )
                                )
                                #   column(2,
                                #          br(),
                                #          radioButtons(
                                #            inputId="X",
                                #            label="Select Data:",
                                #            choices=list("name"="tag",
                                #                         "name"="tag")
                                #          ),
                                #          br(),
                                #          selectizeInput(
                                #            inputId="tag",
                                #            label="name",
                                #            choices=unique(sort(data$tag))
                                #          )
                                #          ),
                                #   column(10,
                                #          br(),
                                #          br(),
                                #          plotlyOutput("tag"))
                                # )
                            ) #end of fluidrow
                            
                            
                   )), #end of tabPanel and nav menu
        
#########################################################

        tabPanel("DATA", icon=icon("table"),
                 br(),
                 br(),
                 br(),
                 h3("All data courtesy of Our World in Data."),
                 "This data has been collected, aggregated, and documented by Diana Beltekian, Daniel Gavrilov, Charlie Giattino, Joe Hasell, Bobbie Macdonald, Edouard Mathieu, Esteban Ortiz-Ospina, Hannah Ritchie, Max Roser.",
                 br(),
                 br(),
                 fluidRow(
                     column(12,
                            DT::dataTableOutput("table"))
                 ),
                 br()
        ), #end of DATA tabPanel
 
#########################################################
tabPanel("ABOUT ME", icon=icon('user'),
                 br(),
                 fluidRow(
                     column(3,
                            br(),
                            br(),
                            br(),
                            img(src="./images/isabel.JPG", width="100%")),
                     column(4,
                            br(),
                            br(),
                            h3(strong("Isabel Alvarez de Lugo")),
                            h5("isabel.adlugo@gmail.com"),
                            tags$a(
                                href="https://www.linkedin.com/in/isabel-adl/",
                                img(
                                    src="./images/linkedin.png",
                                    title="linkedin",
                                    height="40px"
                                )
                            ),
                            tags$a(
                                href="https://github.com/isa-adl",
                                img(
                                    src="./images/github.png",
                                    title="github",
                                    height="40px"
                                )
                            ),
                            br(),
                            br()
                     )),
                 br(),
                 br()
        ) #end of ABOUT ME tabPanel
    )
)

# shinyUI(
#     dashboardPage(skin = "blue",
#     dashboardHeader(title="COVID-19"),
#     dashboardSidebar(
#         sidebarMenu(
#             id = "tabs",
#             menuItem("Worldwide", tabName = "map", icon = icon("globe")),
#             menuItem("Select a Country", tabName = "by_country", icon = icon("map")),
#             menuItem("About Me", tabName = "about_me")
#                       )
#                   ),
#      dashboardBody(
#             tabItems(
#             tabItem(tabName = "map",
#                     fluidPage(
#                         titlePanel("COVID-19 Dashboard"),
#                     tabsetPanel(
#                         tabPanel("map",
#                                  fluidRow(infoBoxOutput("maxBox"),
#                                           infoBoxOutput("minBox")),
#                                  fluidRow(box(htmlOutput("map"), height = 300)),
#                         tabPanel("data",
#                                 fluidRow(box(DT::dataTableOutput("table"), width = 12)))
#                             )
#                         )
#                     )),
#             tabItem(tabName = "by_country",
#                     fluidPage(
#                         titlePanel("COVID-19 Dashboard"),
#                         sidebarLayout(
#                             sidebarPanel(
#                                 selectInput('country', 'Select Country', bycountry_date$country)
#                             ),
#                             mainPanel(
#                                 tabsetPanel(
#                                     tabPanel('Plot', plotly::plotlyOutput('plot_eachcountry')),
#                                     tabPanel('Table', DT::DTOutput('table_eachcountry'))
#                                 )
#                             )
#                         )
#                     )
#             )
#             
#             )
#      )
#     ))
# 

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


