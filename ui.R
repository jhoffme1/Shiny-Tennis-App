library(shiny)
library(shinydashboard)

header = dashboardHeader(
    title = "Tennis, Odds and Experience"
)

sidebar = dashboardSidebar(
    sidebarMenu(
                menuItem("About the Project", tabName = "AbouttheProject",icon=icon("info")),
                menuItem("Author Page",tabName="AboutMe",icon=icon("address-card")),
                menuItem("Betting Trends Rounds 1-4",tabName = "Histograms",icon=icon("Histograms")),
                menuItem("Betting Trends Rounds QF-Final",tabName = "ScatterPlots",icon=icon("Scatterplot")),
                menuItem("Win Loss Experince Comparison",tabName = "Density Plot",icon=icon("Density Plot")),
                menuItem("Conclusion",tabName = "Conclusion",icon=icon("film"))
                                    
    )
    
)
    

body = dashboardBody(
    tabItems(
        tabItem(tabName="AbouttheProject",
            h1("Tennis Odds, and Experience Factors", align = "center"),
            plotOutput("Hello, my name is Jason")
        ),

        tabItem(tabName="AboutJason",
            h1("Author", align = "center"),
            HTML('HEAD SHOT HERE'),
            plotOutput("ABOUT TEXT HERE"),
            
            fluidRow( img(src="LinkedInLogo.png", height ="5%", width = "5%"), uiOutput("LItab"),
                      img(src="githublogo.svg", height="5%", width = "5%"), uiOutput("gittab"),align="center")
        ),
              
        tabItem(tabName="Betting Trends Rounds 1-4",
            fluidRow(
                tabBox(
                    title= tagList(shiny::icon("Early Rounds"), "Histograms of Betting odds for Early Rounds"),
                    id = 'tabset1',
                    tabPanel('Tab 1', plotOutput("First.Round.US.Win")),
                    tabPanel('Tab 2', plotOutput("First.Round.US.Loss")),
                    tabPanel('Tab 3', plotOutput("First.Round.French.Win")),
                    tabPanel('Tab 4', plotOutput("First.Round.French.Loss")),
                    tabPanel('Tab 5', plotOutput("First.Round.Aussie.Win")),
                    tabPanel('Tab 6', plotOutput("First.Round.Aussie.Loss")),
                    tabPanel('Tab 7', plotOutput("First.Round.Wimbledon.Win")),
                    tabPanel('Tab 8', plotOutput("First.Round.Wimbledon.Loss")),
                    tabPanel('Tab 9', plotOutput("Second.Round.US.Win")),
                    tabPanel('Tab 10', plotOutput("Second.Round.US.Loss")),
                    tabPanel('Tab 11', plotOutput("Second.Round.French.Win")),
                    tabPanel('Tab 12', plotOutput("Second.Round.French.Loss")),
                    tabPanel('Tab 13', plotOutput("Second.Round.Aussie.Win")),
                    tabPanel('Tab 14', plotOutput("Second.Round.Aussie.Loss")),
                    tabPanel('Tab 15', plotOutput("Second.Round.Wimbledon.Win")),
                    tabPanel('Tab 16', plotOutput("Second.Round.Wimbledon.Loss")),
                    tabPanel('Tab 17', plotOutput("Third.Round.US.Win")),
                    tabPanel('Tab 18', plotOutput("Third.Round.US.Loss")),
                    tabPanel('Tab 19', plotOutput("Third.Round.French.Win")),
                    tabPanel('Tab 20', plotOutput("Third.Round.French.Loss")),
                    tabPanel('Tab 21', plotOutput("Third.Round.Aussie.Win")),
                    tabPanel('Tab 22', plotOutput("Third.Round.Aussie.Loss")),
                    tabPanel('Tab 23', plotOutput("Third.Round.Wimbledon.Win")),
                    tabPanel('Tab 24', plotOutput("Third.Round.Wimbledon.Loss")),
                    tabPanel('Tab 25', plotOutput("Fourth.Round.US.Win")),
                    tabPanel('Tab 26', plotOutput("Fourth.Round.US.Loss")),
                    tabPanel('Tab 27', plotOutput("Fourth.Round.French.Win")),
                    tabPanel('Tab 28', plotOutput("Fourth.Round.French.Loss")),
                    tabPanel('Tab 29', plotOutput("Fourth.Round.Aussie.Win")),
                    tabPanel('Tab 30', plotOutput("Fourth.Round.Aussie.Loss")),
                    tabPanel('Tab 31', plotOutput("Fourth.Round.Wimbledon.Win")),
                    tabPanel('Tab 32', plotOutput("Fourth.Round.Wimbledon.Loss"))
                ))),
                        
                        
        tabItem(tabName = "Betting Trends Rounds QF-Final",
                fluidRow(
                    tabBox(
                        title= tagList(shiny::icon("Later Rounds"), "Scatter of Betting odds for Later Rounds"),
                        id = 'tabset2',
                        tabPanel('Tab 1', plotOutput("QF.Round.US.Win")),
                        tabPanel('Tab 2', plotOutput("QF.Round.US.Loss")),
                        tabPanel('Tab 3', plotOutput("QF.Round.French.Win")),
                        tabPanel('Tab 4', plotOutput("QF.Round.French.Loss")),
                        tabPanel('Tab 5', plotOutput("QF.Round.Aussie.Win")),
                        tabPanel('Tab 6', plotOutput("QF.Round.Aussie.Loss")),
                        tabPanel('Tab 7', plotOutput("QF.Round.Wimbledon.Win")),
                        tabPanel('Tab 8', plotOutput("QF.Round.Wimbledon.Loss")),
                        tabPanel('Tab 9', plotOutput("SF.Round.US.Win")),
                        tabPanel('Tab 10', plotOutput("SF.Round.US.Loss")),
                        tabPanel('Tab 11', plotOutput("SF.Round.French.Win")),
                        tabPanel('Tab 12', plotOutput("SF.Round.French.Loss")),
                        tabPanel('Tab 13', plotOutput("SF.Round.Aussie.Win")),
                        tabPanel('Tab 14', plotOutput("SF.Round.Aussie.Loss")),
                        tabPanel('Tab 15', plotOutput("SF.Round.Wimbledon.Win")),
                        tabPanel('Tab 16', plotOutput("SF.Round.Wimbledon.Loss")),
                        tabPanel('Tab 17', plotOutput("F.Round.US.Win")),
                        tabPanel('Tab 18', plotOutput("F.Round.US.Loss")),
                        tabPanel('Tab 19', plotOutput("F.Round.French.Win")),
                        tabPanel('Tab 20', plotOutput("F.Round.French.Loss")),
                        tabPanel('Tab 21', plotOutput("F.Round.Aussie.Win")),
                        tabPanel('Tab 22', plotOutput("F.Round.Aussie.Loss")),
                        tabPanel('Tab 23', plotOutput("F.Round.Wimbledon.Win")),
                        tabPanel('Tab 24', plotOutput("F.Round.Wimbledon.Loss"))
                        
                                        
                ))),
                
        tabItem(tabName = "Win Loss Experince Comparison",
                fluidRow(
                    tabBox(
                title= tagList(shiny::icon("All Rounds"), "Density Plot of Experinced players win/loss"),
                id = 'tabset3',
                tabPanel('Tab 1', plotOutput("First.Round.exp")),
                tabPanel('Tab 2', plotOutput("Second.Round.exp")),
                tabPanel('Tab 3', plotOutput("Third.Round.exp")),
                tabPanel('Tab 4', plotOutput("Fourth.Round.exp")),
                tabPanel('Tab 5', plotOutput("QuarterFinals.exp")),
                tabPanel('Tab 6', plotOutput("SemiFinals.exp")),
                tabPanel('Tab 7', plotOutput("The Final.exp"))
            ),
                            
                            
        tabItem(tabName = "Conclusion",
                h1("Conclusion", align = "center"),
                HTML('CONCLUSIONS MADE'),
                plotOutput('CLOSING TEXT')
                
            
                            )
                        )
                )
    )
)
                 
ui <- dashboardPage(header, sidebar, body, skin = "green")
                                        
                                        
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    