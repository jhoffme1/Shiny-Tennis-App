library(shiny)
library(shinythemes)
library(shinydashboard)

header = dashboardHeader(title = "Tennis, what are the odds")

sidebar = dashboardSidebar(
  sidebarMenu(
    menuItem(
      "Map",
      tabName = "Map",
      icon = icon("Map")
    ),
    menuItem(
      "Graphs",
      icon = icon("Graphs"),
      tabName = "Graphs"
    )
  ))

body = dashboardBody(
  tabItems(
    tabItem(
      # Tab 1#####################
      tabName = "Map",
      h2("Map"),
      fluidRow(
        ### map ###################################
        column(
          width = 9,
          box(
            width = NULL,
            solidHeader = TRUE,
            leafletOutput(outputId = "map", height = 675)
          )
        ),
        ### Date Range #######################
        column(
          width = 3,
          box(
            width = NULL,
            status = "primary",
            uiOutput("Rat Map"),
            dateRangeInput(
              'dateRange',
              label = 'Date range input: yyyy-mm-dd',
              format = "yyyy-mm-dd",
              start = '2010-01-01',
              end = '2019-12-31',
              min = '2010-01-01',
              max = '2019-12-31'
            )
          )
        )
      )
    ),
    
    # Tab 2############
    tabItem(tabName = "Graphs",
            h2("Graphs"),
            fluidRow(column(
              width = 9,
              ### Histogram ################################
              box(
                width = NULL,
                solidHeader = TRUE,
                plotOutput("hist2")
              )
            ),
            ### Control Widgets #######################
            column(
              width = 3,
              box(
                width = NULL,
                status = "primary",
                uiOutput("Date Range"),
                dateRangeInput(
                  'dateRange2',
                  label = 'Date range input: yyyy-mm-dd',
                  format = "yyyy-mm-dd",
                  start = '2010-01-01',
                  end = '2019-12-31',
                  min = '2010-01-01',
                  max = '2019-12-31'
                )
              )
            ))),
    
    tabItem(tabName = "Search by Zip",
            h2("Search by Zip Codes"),
            fluidRow(column(3, verbatimTextOutput("value"),
                            selectInput("select", label = h3("Select box"), 
                                        choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
                                        selected = 1)
            ))
    )
  )
)


dashboardPage(
  header,
  dashboardSidebar(
    sidebarMenu(
      menuItem('Map', tabName = "Map", icon = icon("dashboard")),
      menuItem('Graphs', tabName = "Graphs",icon = icon("table")),
      menuItem('Search by Zip', tabName = "Search by Zip",icon = icon("table"))
    )),
  body
)


