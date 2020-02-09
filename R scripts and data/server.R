server <- function(input, output, session) {
    
    url <- a("LinkedIn", href="https://www.linkedin.com/in/jason-hoffmeier-ms-lssbb-377801131/")
    url2 <- a("GitHub", href="https://github.com/jhoffme1/Shiny-Tennis-App")
    output$LItab <- renderUI({
        tagList(url)})
    output$gittab <- renderUI({
        tagList(url2)})
    
    output$closingtext <- renderUI({
        HTML(paste('<br/><br/> We can see from the data that is presented that betting odds do tend to
                   favor the favourite within in tennis matches, however, more winner variety does appear to 
                   exist for matches that occur in earlier rounds, especially for.'
                   
        ))})

#Betting Odds per Tournament and Round 1-4
output$First.Round.US.Win = renderPlot({
    
    qplot(Average_R1_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "First Round US Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
    )
})


output$First.Round.US.Loss = renderPlot({
    
    qplot(Average_R1_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "First Round US Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$First.Round.French.Win = renderPlot({
    
    qplot(Average_French_R1_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "First Round French Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$First.Round.French.Loss = renderPlot({
    
    qplot(Average_French_R1_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "First Round French open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$First.Round.Aussie.Win = renderPlot({
    
    qplot(Average_Aussie_R1_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "First Round Aussie Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$First.Round.Aussie.Loss = renderPlot({
    
    qplot(Average_Aussie_R1_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "First Round Aussie Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$First.Round.Wimbledon.Win = renderPlot({
    
    qplot(Average_Wimbledon_R1_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "First Round Wimbledon Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$First.Round.Wimbledon.Loss = renderPlot({
    
    qplot(Average_Wimbledon_R1_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "First Round Wimbeledon Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.US.Win = renderPlot({
    
    qplot(Average_US_R2_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Second Round US Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.US.Loss = renderPlot({
    
    qplot(Average_R2_US_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Second Round US Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.French.Win = renderPlot({
    
    qplot(Average_French_R2_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Second Round French Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.French.Loss = renderPlot({
    
    qplot(Average_French_R2_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Second Round French Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.Aussie.Win = renderPlot({
    
    qplot(Average_Aussie_R2_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Second Round Aussie Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.Aussie.Loss = renderPlot({ 
    
    qplot(Average_Aussie_R2_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Second Round Aussie Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.Wimbledon.Win = renderPlot({
    
    qplot(Average_Wimbledon_R2_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Second Round Wimbledon Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Second.Round.Wimbledon.Loss = renderPlot({
    
    qplot(Average_Wimbledon_R2_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Second round wimbledon Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.US.Win = renderPlot({
    
    qplot(Average_US_R3_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Third Round US Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.US.Loss = renderPlot({
    
    qplot(Average_US_R3_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Third Round US Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.French.Win = renderPlot({
    
    qplot(Average_French_R3_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Third Round French Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.French.Loss = renderPlot({
    
    qplot(Average_French_R3_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Third Round French Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.Aussie.Win = renderPlot({
    
    qplot(Average_Aussie_R3_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Third Round Aussie Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.Aussie.Loss = renderPlot({
    
    qplot(Average_Aussie_R3_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Third Round Aussie Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.Wimbledon.Win = renderPlot({
    
    qplot(Average_Wimbledon_R3_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Third Round Wimbledon Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Third.Round.Wimbledon.Loss = renderPlot({
    
    qplot(Average_Wimbledon_R3_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Third Round Wimbledon Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Fourth.Round.US.Win = renderPlot({
    
    qplot(Average_US_R4_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round US Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Fourth.Round.US.Loss = renderPlot({
    
    qplot(Average_R4_US_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round US Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })


output$Fourth.Round.French.Win = renderPlot({
    
    qplot(Average_French_R4_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round French Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Fourth.Round.French.Loss = renderPlot({
    
    qplot(Average_French_R4_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round French Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Fourth.Round.Aussie.Win = renderPlot({
    
    qplot(Average_Aussie_R4_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round Aussie Open Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Fourth.Round.Aussie.Loss = renderPlot({
    
    qplot(Average_Aussie_R4_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round Aussie Open Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Fourth.Round.Wimbledon.Win = renderPlot({
    
    qplot(Average_Wimbledon_R4_W$B365W, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round Wimbledon Winners", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("blue"), 
          col=I("red"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    })

output$Fourth.Round.Wimbledon.Loss = renderPlot({
    
    qplot(Average_Wimbledon_R4_L$B365L, geom="histogram",
          binwidth = 1,  
          main = "Fourth Round Wimbledon Losers", 
          xlab = "Betting Range",
          ylab = "Player count",
          fill=I("red"), 
          col=I("blue"), 
          alpha=I(20),
          xlim=c(0,35)
          )
    
})
#Betting odds for match and tournament QF-Final
output$QF.Round.US.Win = renderPlot({
    
    ggplot(Average_US_QF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Winning players in US QF")
    })

output$QF.Round.US.Loss = renderPlot({
    
    ggplot(Average_QF_US_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Losing players in US QF")
    })

output$QF.Round.French.Win = renderPlot({  
    
    ggplot(Average_French_QF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Winning players in French Open QF")
    })

output$QF.Round.French.Loss = renderPlot({
    
    ggplot(Average_French_QF_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Losing players in French Open QF")
    })

output$QF.Round.Aussie.Win = renderPlot({
    
    ggplot(Average_Aussie_QF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Winning players in Aussie Open QF")
    })

output$QF.Round.Aussie.Loss = renderPlot({
    
    ggplot(Average_Aussie_QF_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Losing players in Aussie Open QF")
    })

output$QF.Round.Wimbledon.Win = renderPlot({
    
    ggplot(Average_Wimbledon_QF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Winning players in Wimbledon QF")
    })

output$QF.Round.Wimbledon.Loss = renderPlot({
    
    ggplot(Average_Wimbledon_QF_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 5)) +
        labs(title ="Average Betting Odds for Losing players in Wimbledon QF")
    })


output$SF.Round.US.Win = renderPlot({    
    
    ggplot(Average_US_SF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Winning players in US Open SF")
    })

output$SF.Round.US.Loss = renderPlot({   
    
    ggplot(Average_SF_US_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        theme_minimal() +
        theme(axis.text.y= element_text(size= 7)) +
        labs(title ="Average Betting Odds for Losing players in US Open SF")
    })

output$SF.Round.French.Win = renderPlot({     
    
    ggplot(Average_French_SF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        labs(title = "Average Betting Odds for Winning Player in French SF")
    })

output$SF.Round.French.Loss = renderPlot({ 
    
    ggplot(Average_French_SF_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        labs(title = "Average Betting Odds for Losing Player in French SF")
    })

output$SF.Round.Aussie.Win = renderPlot({ 
    
    ggplot(Average_Aussie_SF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        labs(title = "Average Betting Odds for Winning Player in Aussie SF")
    })

output$SF.Round.Aussie.Loss = renderPlot({ 
    
    ggplot(Average_Aussie_SF_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        labs(title = "Average Betting Odds for Losing Player in Aussie SF")
    })

output$SF.Round.Wimbledon.Win = renderPlot({ 
    
    ggplot(Average_Wimbledon_SF_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        labs(title = "Average Betting Odds for Winning Player in Wimbledon SF")
    })

output$SF.Round.Wimbledon.Loss = renderPlot({ 
    
    ggplot(Average_Wimbledon_SF_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20) +
        labs(title = "Average Betting Odds for Losing Player in Wimbledon SF")
    })

output$F.Round.US.Win = renderPlot({ 
    
    ggplot(Average_F_W, aes(x=B365W, y=Winner, group=1)) +
        geom_point(size=5, shape=20)+
        labs(title = "Average Betting Odds for Winning Player in US Open Final")
    })

output$F.Round.US.Loss = renderPlot({ 
    
    ggplot(Average_F_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20)+
        labs(title = "Average Betting Odds for Losing Player in US Open Final")
    })

output$F.Round.French.Win = renderPlot({
    
    ggplot(Average_French_F_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20) +
        labs(title = "Average Betting Odds for Winning Player in French Open Final")
    })

output$F.Round.French.Loss = renderPlot({
    
    ggplot(Average_French_F_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20)+
        labs(title = "Average Betting Odds for Losing Player in French Open Final")
    })

output$F.Round.Aussie.Win = renderPlot({
    
    ggplot(Average_Aussie_F_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20)+
        labs(title = "Average Betting Odds for Winning Player in Australian Open Final")
    })

output$F.Round.Aussie.Loss = renderPlot({
    
    ggplot(Average_Aussie_F_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20)+
        labs(title = "Average Betting Odds for Losing Player in Australian Open Final")
    })

output$F.Round.Wimbledon.Win = renderPlot({
    
    ggplot(Average_Wimbledon_F_W, aes(x=B365W, y=Winner)) +
        geom_point(size=5, shape=20)+
        labs(title = "Average Betting Odds for Winning Player in Wimbledon Final")
    })

output$F.Round.Wimbledon.Loss = renderPlot({
    
    ggplot(Average_Wimbledon_F_L, aes(x=B365L, y=Loser)) +
        geom_point(size=5, shape=20)+
        labs(title = "Average Betting Odds for Losing Player in Wimbledon Final")
    
    
})

#Experience Comparisons between winning and losing players per round
output$First.Round.exp = renderPlot({
    
    ggplot(Average_R1, aes(x = experience, fill = winner)) + 
        geom_density(position = "identity", alpha = 0.4) +
        scale_x_continuous(name = "Amount of matches played") +
        scale_y_continuous(name = "Density of players") +
        ggtitle("Density Plot of Players Experience for First Round Matches ")
    })

output$Second.Round.exp = renderPlot({ 
    
    ggplot(Average_R2, aes(x = experience, fill = winner)) + 
        geom_density(position = "identity", alpha = 0.4) +
        scale_x_continuous(name = "Amount of matches played") +
        scale_y_continuous(name = "Density of players") +
        ggtitle("Density Plot of Players Experience for Second Round Matches ")
    })

output$Third.Round.exp = renderPlot({  
    
    ggplot(Average_R3, aes(x = experience, fill = winner)) + 
        geom_density(position = "identity", alpha = 0.4) +
        scale_x_continuous(name = "Amount of matches played") +
        scale_y_continuous(name = "Density of players") +
        ggtitle("Density Plot of Players Experience for Third Round Matches ")
    })


output$Fourth.Round.exp = renderPlot({
    
    ggplot(Average_R4, aes(x = experience, fill = winner)) + 
        geom_density(position = "identity", alpha = 0.4) +
        scale_x_continuous(name = "Amount of matches played") +
        scale_y_continuous(name = "Density of players") +
        ggtitle("Density Plot of Players Experience for Fourth Round Matches ")
    })

output$QuarterFinals.exp = renderPlot({
    
    ggplot(Average_QF, aes(x = experience, fill = winner)) + 
        geom_density(position = "identity", alpha = 0.4) +
        scale_x_continuous(name = "Amount of matches played") +
        scale_y_continuous(name = "Density of players") +
        ggtitle("Density Plot of Players Experience for QF Matches ")
    })


output$SemiFinals.exp = renderPlot({
    
    ggplot(Average_SF, aes(x = experience, fill = winner)) + 
        geom_density(position = "identity", alpha = 0.4) +
        scale_x_continuous(name = "Amount of matches played") +
        scale_y_continuous(name = "Density of players") +
        ggtitle("Density Plot of Players Experience for SF Matches ")
    })


output$The.Final.exp = renderPlot({
    
    ggplot(Average_F, aes(x = experience, fill = winner)) + 
        geom_density(position = "identity", alpha = 0.4) +
        scale_x_continuous(name = "Amount of matches played") +
        scale_y_continuous(name = "Density of players") +
        ggtitle("Density Plot of Players Experience for Finals Matches ")
})        
}










