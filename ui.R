#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Tennis Sports Analysis"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("Djokovic",
                        image= https://i.dailymail.co.uk/i/pix/2015/07/12/20/2A79C0C000000578-0-image-a-68_1436728586560.jpg)
            sidebarMenu(
                menuItem("Tennis", tabName = "tennis", icon= icon("tennis")),
                menuItem("Betting", tabnName = "betting", icon = icon("battingstats")))
            )
    dashboardBody(
        tabItems(
            tabItem(tabName = "tennis",
                "to be replaced with betting graphs"),
            tabItem(tabName = "betting",
                "to be replaced with betting table"))
            )
        )
                        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
