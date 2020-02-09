library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(reshape2)

header = dashboardHeader(
    title = "How to Build Market Through the Eyes of Tennis."
)

sidebar = dashboardSidebar(
    sidebarMenu(
                menuItem("About the Project", tabName = "AbouttheProject",icon=icon("info")),
                menuItem("Author Page",tabName="AboutMe",icon=icon("address-card")),
                menuItem("Betting Trends Rounds 1-4",tabName = "Histograms",icon=icon("Histograms")),
                menuItem("Betting Trends Rounds QF-Final",tabName = "ScatterPlots",icon=icon("Scatterplot")),
                menuItem("Win Loss Experince Comparison",tabName = "DensityPlot",icon=icon("Density Plot")),
                menuItem("Conclusion",tabName = "cc",icon=icon("info"))
                                    
    )
    
)
    

body = dashboardBody(
    tabItems(
        tabItem(tabName="AbouttheProject",
            h2("How to Build Market Through the Eyes of Tennis.", align = "center"),
            
            h2("Summary"),
            
            h4("This project aims to observe and analyze the data of all tennis players
               dating back to 2000. Data includes: experience, wins over losses, and the betting odds
               of the winners and losers (data for betting was captured from 2003-2019).
               The data is split up into 3 primary categories: Early round betting odds, later round 
               betting odds, and win loss ratio based on experience"),
            h4("-All data was taken from: 'https://www.kaggle.com/tbrownlow3/atp-tennis' and 
               'http://www.tennis-data.co.uk/data.php'."),
            h4("-The tournaments analyzed were all grand slams, and the betting data was through Bet365."),
            
            h2("Business Objectives:"),
            
            h4("-To understand betting trends and see if there is a relative flow with winners and losers to determine
               when it is good to bet and not good to bet to generate the highest level of profit."), 
            h4("-To understand the win loss ratio on players per round based on experince and see if there is a trend 
               in how long it takes before a player becomes successful, this information would be vital for coaches
               both in this sport and other sports, as it will give them a bigger perception on the amount of time needed to 
               generate consistency for athletes, as well as build up the market value of the game do to more relative success."), 
            img(src= 'https://media.giphy.com/media/RlZuXOrS8uiBuLYlnr/giphy.gif', height= 400, width= 600, style= "display: block; margin-left: auto, margin-right: auto;", align= "center"),
            h4("With great power comes great grass!"),
            
            htmlOutput("openingtext")
        ),
        
        

        tabItem(tabName="AboutMe",
            h1("Author", align = "center"),
            img(src= 'https://media-exp1.licdn.com/dms/image/C4D03AQEwX9GN_odx_A/profile-displayphoto-shrink_200_200/0?e=1586995200&v=beta&t=UnL0zZYeVrehX7UXDedtXb_fd680MZ0EQAqEVRDonP0',  height= 500, width= 600, style= "display: block; margin-left: auto, margin-right: auto;", align= "center"),
            h4("Jason Hoffmeier is a Data Science fellow who currently resides in New York City. He has a Masters
               Degree in Systems Engineering, and a Lean Six Sigma Black Belt. Jason believes Data 
               Science is the tool of the future, and it is because of that he strives to understand its fundamentals
               as well as possible so he and others can fully see the power and success that data can bring."), 
               h4("You can find more info on Jason Hoffmeier through his Linkedin:
               'https://www.linkedin.com/in/jason-hoffmeier-ms-lssbb-377801131/'. You could also leanrn more 
               about this project and many others through his github: 'https://github.com/jhoffme1/Shiny-Tennis-App'."),
            plotOutput("ABOUT TEXT HERE"),
            
            fluidRow( img(src="LinkedInLogo.png", height ="75%", width = "50%"), uiOutput("LItab"),
                      img(src="githublogo.svg", height="75%", width = "50%"), uiOutput("gittab"),align="center")
        ),
              
        tabItem(tabName="Histograms",
            fluidRow(
                tabBox(
                    title= tagList(shiny::icon("Early Rounds"), 'Histograms of Betting odds for Early Rounds'),
                    id = 'tabset1',
                    tabPanel('R1USW', plotOutput('First.Round.US.Win')),
                    tabPanel('R1USL', plotOutput('First.Round.US.Loss')),
                    tabPanel('R1FW', plotOutput('First.Round.French.Win')),
                    tabPanel('R1FL', plotOutput('First.Round.French.Loss')),
                    tabPanel('R1AW', plotOutput('First.Round.Aussie.Win')),
                    tabPanel('R1AL', plotOutput('First.Round.Aussie.Loss')),
                    tabPanel('R1WW', plotOutput('First.Round.Wimbledon.Win')),
                    tabPanel('R1WL', plotOutput('First.Round.Wimbledon.Loss')),
                    tabPanel('R2UW', plotOutput('Second.Round.US.Win')),
                    tabPanel('R2UL', plotOutput('Second.Round.US.Loss')),
                    tabPanel('R2FW', plotOutput('Second.Round.French.Win')),
                    tabPanel('R2FL', plotOutput('Second.Round.French.Loss')),
                    tabPanel('R2AW', plotOutput('Second.Round.Aussie.Win')),
                    tabPanel('R2AL', plotOutput('Second.Round.Aussie.Loss')),
                    tabPanel('R2WW', plotOutput('Second.Round.Wimbledon.Win')),
                    tabPanel('R2WL', plotOutput('Second.Round.Wimbledon.Loss')),
                    tabPanel('R3UW', plotOutput('Third.Round.US.Win')),
                    tabPanel('R3UL', plotOutput('Third.Round.US.Loss')),
                    tabPanel('R3FW', plotOutput('Third.Round.French.Win')),
                    tabPanel('R3FL', plotOutput('Third.Round.French.Loss')),
                    tabPanel('R3AW', plotOutput('Third.Round.Aussie.Win')),
                    tabPanel('R3AL', plotOutput('Third.Round.Aussie.Loss')),
                    tabPanel('R3WW', plotOutput('Third.Round.Wimbledon.Win')),
                    tabPanel('R3WL', plotOutput('Third.Round.Wimbledon.Loss')),
                    tabPanel('R4UW', plotOutput('Fourth.Round.US.Win')),
                    tabPanel('R4UL', plotOutput('Fourth.Round.US.Loss')),
                    tabPanel('R4FW', plotOutput('Fourth.Round.French.Win')),
                    tabPanel('R4FL', plotOutput('Fourth.Round.French.Loss')),
                    tabPanel('R4AW', plotOutput('Fourth.Round.Aussie.Win')),
                    tabPanel('R4AL', plotOutput('Fourth.Round.Aussie.Loss')),
                    tabPanel('R4WW', plotOutput('Fourth.Round.Wimbledon.Win')),
                    tabPanel('R4WL', plotOutput('Fourth.Round.Wimbledon.Loss')),
                    h4("-Round 1 matches tend to show consistent variance within how 
                    winners and losers are favored for each Grand Slam. Wimbledon is 
                    shown to have the most amount of upsets though, with the betting 
                    odds spreading out a bit more compared to the other 3 majors. Deeper analysis 
                    will be made to look further into these betting numbers." ),
                    h4("-Round 2 also shows a relatively consistent trend in terms 
                       of favored players winning, however the Aussie open does appear to 
                       hold more upsets this round compared to the other 3 slams."),
                    h4("-Round 3 is like round 2, the Aussie open is again showing the 
                       more apparent betting odd upsets compared to the other 3 majors."),
                    h4("-Round 4 is interesting, as this round tends to have a fair 
                       number of underdogs winning based on the bets. The losing players odds are still 
                       higher statistically, but should not come as a surprise. The higher 
                       number of upsets overall could be because there are less player remaining 
                       in the draw.")
                ))),
                        
                        
        tabItem(tabName = "ScatterPlots",
                fluidRow(
                    tabBox(
                        title= tagList(shiny::icon("Later Rounds"), "Scatter of Betting odds for Later Rounds"),
                        id = 'tabset2',
                        tabPanel('QFUW', plotOutput('QF.Round.US.Win')),
                        tabPanel('QFUL', plotOutput('QF.Round.US.Loss')),
                        tabPanel('QFFW', plotOutput('QF.Round.French.Win')),
                        tabPanel('QFFL', plotOutput('QF.Round.French.Loss')),
                        tabPanel('QFAW', plotOutput('QF.Round.Aussie.Win')),
                        tabPanel('QFAL', plotOutput('QF.Round.Aussie.Loss')),
                        tabPanel('QFWW', plotOutput('QF.Round.Wimbledon.Win')),
                        tabPanel('QFWL', plotOutput('QF.Round.Wimbledon.Loss')),
                        tabPanel('SFUW', plotOutput('SF.Round.US.Win')),
                        tabPanel('SFUL', plotOutput('SF.Round.US.Loss')),
                        tabPanel('SFFW', plotOutput('SF.Round.French.Win')),
                        tabPanel('SFFL', plotOutput('SF.Round.French.Loss')),
                        tabPanel('SFAW', plotOutput('SF.Round.Aussie.Win')),
                        tabPanel('SFAL', plotOutput('SF.Round.Aussie.Loss')),
                        tabPanel('SFWW', plotOutput('SF.Round.Wimbledon.Win')),
                        tabPanel('SFWL', plotOutput('SF.Round.Wimbledon.Loss')),
                        tabPanel('FUW', plotOutput('F.Round.US.Win')),
                        tabPanel('FUL', plotOutput('F.Round.US.Loss')),
                        tabPanel('FFW', plotOutput('F.Round.French.Win')),
                        tabPanel('FFL', plotOutput('F.Round.French.Loss')),
                        tabPanel('FAW', plotOutput('F.Round.Aussie.Win')),
                        tabPanel('FAL', plotOutput('F.Round.Aussie.Loss')),
                        tabPanel('FWW', plotOutput('F.Round.Wimbledon.Win')),
                        tabPanel('FWL', plotOutput('F.Round.Wimbledon.Loss')),
                        h4("-The later rounds have less players, therefore the switch 
                           from a histogram to a scatter plot was made to analyze the 
                           betting odds more deeply."),
                        h4("-For the Quarterfinal results, it is interesting to note how 
                           scattered all the betting odds are for both the winning player 
                           and the losing players. There is a relative variance that is seen 
                           in the data for all 4 of the Grand Slams. This can particularly be 
                           seen through the betting odds for the Australian Open Quarter Finals. "),
                        h4("-The semifinal betting odds show to be more geared towards the favored 
                           opponent winning, but the betting odds are also smaller this deep into the 
                           tournament, (with betting odds ranging from 1-2.5 for Wimbledon for example)."),
                        h4("-The final round betting odds tend to be tight, with some upsets occurring 
                           (such as the Aussie open where the betting odds for Wawrinka were at 5.5).")
                                        
                ))),
                
        tabItem(tabName = "DensityPlot",
                fluidRow(
                    tabBox(
                title= tagList(shiny::icon("All Rounds"), "Density Plot of Experinced players win/loss"),
                id = 'tabset3',
                tabPanel('R1EXP', plotOutput('First.Round.exp')),
                tabPanel('R2EXP', plotOutput('Second.Round.exp')),
                tabPanel('R3EXP', plotOutput('Third.Round.exp')),
                tabPanel('R4EXP', plotOutput('Fourth.Round.exp')),
                tabPanel('QFEXP', plotOutput('QuarterFinals.exp')),
                tabPanel('SFEXP', plotOutput('SemiFinals.exp')),
                tabPanel('FEXP', plotOutput('The.Final.exp')),
                h4("-Each of the plots show an interesting trend that is occurring with all players."),
                h4("-As the rounds get deeper, the win loss ratio begins to widen significantly"),
                h4("-The earliar rounds show what on average it can take up to 30-50 matches worth of experince 
                before players begin to win more consistently. There are exceptions to this, such as legends and prodigies.
                   such as Roger Federer or Rafael Nadal"),
                h4("-The later the rounds go the wider the plot becomes, this could be because it already took so much 
                   experience, training, and focus to get there (and a lot of matches), therefore widening the density plot."),
                h4("It can be determined that it can take some time for players to build up relative consistency.")
            
            ))) ,
            # menuItem("Conclusion",tabName = "Conclusions",icon=icon("info"))                        
                            
        tabItem(tabName ="cc",
                h1("Conclusions", align = "center"),
                h4("-Based on the data that analyzed so far, a few conclusions can be made."),
                h4("-The favourite is shown to be the likely winner most of the time, as to be expected; 
                people should look into investing bets in the middle rounds of
                   tournaments (the second round through quarterfinals to be more specific). Those show to have
                   higher odds."),
                h4("-Based on the win loss ratio of all players, some player may take up to 30-50 
                   matches to start winning consistently. Deeper analysis will be made for each round 
                   seperately to see how long it takes before certain players start to win more, seeing as
                   some become more successful than others fairly soon,this will be looked at for 
                   each of the 4 Grand Slams tournaments."),
                h4("-For now though, it is good for coaches to know that it could take, on average, some time before 
                   a player can become relatively successful in a major tournament, it could take
                   multiple matches just to get their first win."),
                img(src= 'https://thumbs.gfycat.com/HighAmusingHuemul-size_restricted.gif', height= 400, width= 600, style= "display: block; margin-left: auto, margin-right: auto;", style="text-align: center;"),
                h4("We will bounce our way to great success!")
                
            
                            )
                        )
                )

                 
ui <- dashboardPage(header, sidebar, body, skin = "green")
                                        
                                        
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    