library(ggplot2)
library(dplyr)
library(reshape2)

View(WinnerBet)
View(LoserBet)

View(cbind(WinnerBet, LoserBet))


View(top_10_scorers)

?top_n


                                      
#_______________________________

Avg_W_Bet= WinnerBet %>% 
  group_by(Winner)%>% 
  summarise(., mean(B365W))
View(Avg_W_Bet)

Avg_L_Bet= LoserBet %>% 
  group_by(Loser)%>% 
  summarise(., mean(B365L))
View(Avg_L_Bet)


filtered_betw_1= filter(WinnerBet, Round == "1st Round")
View(filtered_betw_1)

filtered_betw_2= WinnerBet %>% filter(Round %in% c("2nd Round"))
View(filtered_betw_2)

filtered_betw_3= WinnerBet %>% filter(Round %in% c("3rd Round"))

filtered_betw_4= WinnerBet %>% filter(Round %in% c("4th Round"))

filtered_betw_QF= WinnerBet %>% filter(Round %in% c("Quarterfinals")) 

filtered_betw_SF= WinnerBet %>% filter(Round %in% c("Semifinals"))

filtered_betw_F= WinnerBet %>% filter(Round %in% c("The Final"))
View(filtered_betw_F)
                                      
                                      
#Losing bets per round 

filtered_betL_1= LoserBet %>% filter(Round %in% c("1st Round"))
View(filtered_betL_1)

filtered_betL_2= LoserBet %>% filter(Round %in% c("2nd Round"))
View(filtered_betL_2)

filtered_betL_3= LoserBet %>% filter(Round %in% c("3rd Round"))

filtered_betL_4= LoserBet %>% filter(Round %in% c("4th Round"))

filtered_betL_QF= LoserBet %>% filter(Round %in% c("Quarterfinals")) 

filtered_betL_SF= LoserBet %>% filter(Round %in% c("Semifinals"))

filtered_betL_F= LoserBet %>% filter(Round %in% c("The Final"))
View(filtered_betL_F)
                                      
                                      
View(TennisL)


#Winnin/Losing betting odds for each Final round tournaments 

Average_Tennis_Win= filtered_betw_F  %>% 
  group_by(Winner, Tournament, SecondD, Round)%>% 
  summarise(., mean(B365W))
View(Average_Tennis_Win)

Average_Tennis_Loss=  TennisL %>% 
  group_by(Loser, Tournament, Date, Round)%>% 
  summarise(., mean(B365L))
View(Average_Tennis_Loss)


US_open_Final_Win= Average_Tennis_Win %>% filter(Tournament %in% c("US Open"))
names(US_open_Final_Win)[names(US_open_Final_Win) == "mean(B365W)"] <- "B365W"
View(US_open_Final_Win)

US_open_Final_Loss= Average_Tennis_Loss %>% filter(Tournament %in% c("US Open"))
names(US_open_Final_Loss)[names(US_open_Final_Loss) == "mean(B365L)"] <- "B365L"
View(US_open_Final_Loss)

Average_Final_W= US_open_Final_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Final_W)
names(Average_Final_W)[names(Average_Final_W) == "mean(B365W)"] <- "B365W"

Average_Final_L= US_open_Final_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Final_L)
names(Average_Final_L)[names(Average_Final_L) == "mean(B365L)"] <- "B365L"






#histograms/boxplots

#Final round

US_open_F_Win= filtered_betw_F %>% filter(Tournament %in% c("US Open"))
View(US_open_R1_Win)

US_open_F_Loss= filtered_betL_F %>% filter(Tournament %in% c("US Open"))
View(US_open_R1_Loss)


Average_F_W= US_open_F_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_F_W)
names(Average_F_W)[names(Average_F_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_F_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  labs(title = "Average Betting Odds for Winning Player in US Open Final")+
  coord_flip()


Average_F_L= US_open_F_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_F_L)
names(Average_F_L)[names(Average_F_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_F_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  labs(title = "Average Betting Odds for Losing Player in US Open Final")+
  coord_flip()


French_open_F_Win= filtered_betw_F %>% filter(Tournament %in% c("French Open"))
French_open_F_Win

French_open_F_Loss= filtered_betL_F %>% filter(Tournament %in% c("French Open"))
French_open_F_Loss


Average_French_F_W= French_open_F_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_French_F_W)
names(Average_French_F_W)[names(Average_French_F_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_French_F_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  labs(title = "Average Betting Odds for Winning Player in French Open Final")+
  coord_flip()


Average_French_F_L= French_open_F_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_French_F_L)
names(Average_French_F_L)[names(Average_French_F_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_French_F_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  labs(title = "Average Betting Odds for Losing Player in French Open Final")+
  coord_flip()


Aussie_open_F_Win= filtered_betw_F %>% filter(Tournament %in% c("Australian Open"))
Aussie_open_F_Win

Aussie_open_F_Loss= filtered_betL_F %>% filter(Tournament %in% c("Australian Open"))
Aussie_open_F_Loss


Average_Aussie_F_W= Aussie_open_F_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Aussie_F_W)
names(Average_Aussie_F_W)[names(Average_Aussie_F_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_Aussie_F_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  labs(title = "Average Betting Odds for Winning Player in Aussie Open Final")+
  coord_flip()


Average_Aussie_F_L= Aussie_open_F_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Aussie_F_L)
names(Average_Aussie_F_L)[names(Average_Aussie_F_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_Aussie_F_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  labs(title = "Average Betting Odds for Losing Player in Aussie Open Final")+
  coord_flip()



Wimbledon_F_Win= filtered_betw_F %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_F_Win

Wimbledon_F_Loss= filtered_betL_F %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_F_Loss


Average_Wimbledon_F_W= Wimbledon_F_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Wimbledon_F_W)
names(Average_Wimbledon_F_W)[names(Average_Wimbledon_F_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_Wimbledon_F_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  labs(title = "Average Betting Odds for Winning Player in Wimbledon Final")+
  coord_flip()



Average_Wimbledon_F_L= Wimbledon_F_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Wimbledon_F_L)
names(Average_Wimbledon_F_L)[names(Average_Wimbledon_F_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_Wimbledon_F_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  labs(title = "Average Betting Odds for Losing Player in Wimbledon Final")+
  coord_flip()

##Winnin/Losing betting odds for each First round tournaments 

US_open_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("US Open"))
View(US_open_R1_Win)

US_open_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("US Open"))
View(US_open_R1_Loss)


Average_R1_W= US_open_R1_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_R1_W)
names(Average_R1_W)[names(Average_R1_W) == "mean(B365W)"] <- "B365W"

qplot(Average_R1_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "First Round US Open Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))

Average_R1_L= US_open_R1_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_R1_L)
names(Average_R1_L)[names(Average_R1_L) == "mean(B365L)"] <- "B365L"

qplot(Average_R1_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "First Round US Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



French_open_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("French Open"))
French_open_R1_Win

French_open_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("French Open"))
French_open_R1_Loss


Average_French_R1_W= French_open_R1_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_French_R1_W)
names(Average_French_R1_W)[names(Average_French_R1_W) == "mean(B365W)"] <- "B365W"

qplot(Average_French_R1_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "First Round French Open Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_French_R1_L= French_open_R1_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_French_R1_L)
names(Average_French_R1_L)[names(Average_French_R1_L) == "mean(B365L)"] <- "B365L"

qplot(Average_French_R1_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "First Round French open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



Australian_open_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R1_Win

Australian_open_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R1_Loss

Average_Aussie_R1_W= Australian_open_R1_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Aussie_R1_W)
names(Average_Aussie_R1_W)[names(Average_Aussie_R1_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Aussie_R1_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "First Round Aussie Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Aussie_R1_L= Australian_open_R1_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Aussie_R1_L)
names(Average_Aussie_R1_L)[names(Average_Aussie_R1_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Aussie_R1_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "First Round Aussie Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))





Wimbledon_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R1_Win)

Wimbledon_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R1_Loss


Average_Wimbledon_R1_W= Wimbledon_R1_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Wimbledon_R1_W)
names(Average_Wimbledon_R1_W)[names(Average_Wimbledon_R1_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Wimbledon_R1_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "First Round Wimbledon Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Wimbledon_R1_L= Wimbledon_R1_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Wimbledon_R1_L)
names(Average_Wimbledon_R1_L)[names(Average_Wimbledon_R1_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Wimbledon_R1_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "First Round Wimbeledon Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



##Winnin/Losing betting odds for each Second round tournaments 

US_open_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("US Open"))
US_open_R2_Win

US_open_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("US Open"))
US_open_R2_Loss

Average_US_R2_W= US_open_R2_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_US_R2_W)
names(Average_US_R2_W)[names(Average_US_R2_W) == "mean(B365W)"] <- "B365W"

qplot(Average_US_R2_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Second Round US Open Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))



Average_R2_US_L= US_open_R2_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_R2_US_L)
names(Average_R2_US_L)[names(Average_R2_US_L) == "mean(B365L)"] <- "B365L"

qplot(Average_R2_US_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Second Round US Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))


French_open_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("French Open"))
French_open_R2_Win

French_open_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("French Open"))
French_open_R2_Loss


Average_French_R2_W= French_open_R2_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_French_R2_W)
names(Average_French_R2_W)[names(Average_French_R2_W) == "mean(B365W)"] <- "B365W"

qplot(Average_French_R2_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Second Round French Open Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_French_R2_L= French_open_R2_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_French_R2_L)
names(Average_French_R2_L)[names(Average_French_R2_L) == "mean(B365L)"] <- "B365L"

qplot(Average_French_R2_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Second Round French Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



Australian_open_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R2_Win

Australian_open_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R2_Loss

Average_Aussie_R2_W= Australian_open_R2_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Aussie_R2_W)
names(Average_Aussie_R2_W)[names(Average_Aussie_R2_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Aussie_R2_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Second Round Aussie Open Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Aussie_R2_L= Australian_open_R2_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Aussie_R2_L)
names(Average_Aussie_R2_L)[names(Average_Aussie_R2_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Aussie_R2_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Second Round Aussie Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))




Wimbledon_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R2_Win)

Wimbledon_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R2_Loss

Average_Wimbledon_R2_W= Wimbledon_R2_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Wimbledon_R2_W)
names(Average_Wimbledon_R2_W)[names(Average_Wimbledon_R2_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Wimbledon_R2_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Second Round Wimbledon Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Wimbledon_R2_L= Wimbledon_R2_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Wimbledon_R2_L)
names(Average_Wimbledon_R2_L)[names(Average_Wimbledon_R2_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Wimbledon_R2_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Second round wimbledon Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



##Winnin/Losing betting odds for each Third round tournaments

US_open_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("US Open"))
US_open_R3_Win

US_open_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("US Open"))
US_open_R3_Loss

Average_US_R3_W= US_open_R3_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_US_R3_W)
names(Average_US_R3_W)[names(Average_US_R3_W) == "mean(B365W)"] <- "B365W"

qplot(Average_US_R3_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Third Round US Open Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))



Average_US_R3_L= US_open_R3_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_US_R3_L)
names(Average_US_R3_L)[names(Average_US_R3_L) == "mean(B365L)"] <- "B365L"

qplot(Average_US_R3_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Third Round US Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))


French_open_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("French Open"))
French_open_R3_Win

French_open_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("French Open"))
French_open_R3_Loss


Average_French_R3_W= French_open_R3_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_French_R3_W)
names(Average_French_R3_W)[names(Average_French_R3_W) == "mean(B365W)"] <- "B365W"

qplot(Average_French_R3_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Third Round French Open Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_French_R3_L= French_open_R3_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_French_R3_L)
names(Average_French_R3_L)[names(Average_French_R3_L) == "mean(B365L)"] <- "B365L"

qplot(Average_French_R3_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Third Round French Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



Australian_open_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R3_Win

Australian_open_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R3_Loss


Average_Aussie_R3_W= Australian_open_R3_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Aussie_R3_W)
names(Average_Aussie_R3_W)[names(Average_Aussie_R3_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Aussie_R3_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Third Round Aussie Open Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Aussie_R3_L= Australian_open_R3_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Aussie_R3_L)
names(Average_Aussie_R3_L)[names(Average_Aussie_R3_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Aussie_R3_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Third Round Aussie Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



Wimbledon_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R3_Win)

Wimbledon_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R3_Loss


Average_Wimbledon_R3_W= Wimbledon_R3_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Wimbledon_R3_W)
names(Average_Wimbledon_R3_W)[names(Average_Wimbledon_R3_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Wimbledon_R3_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Third Round Wimbledon Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Wimbledon_R3_L= Wimbledon_R3_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Wimbledon_R3_L)
names(Average_Wimbledon_R3_L)[names(Average_Wimbledon_R3_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Wimbledon_R3_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Third Round Wimbledon Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))





##Winnin/Losing betting odds for each Fourth round tournaments

US_open_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("US Open"))
US_open_R4_Win

US_open_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("US Open"))
US_open_R4_Loss

Average_US_R4_W= US_open_R4_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_US_R4_W)
names(Average_US_R4_W)[names(Average_US_R4_W) == "mean(B365W)"] <- "B365W"

qplot(Average_US_R4_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round US Open Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))



Average_R4_US_L= US_open_R4_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_R4_US_L)
names(Average_R4_US_L)[names(Average_R4_US_L) == "mean(B365L)"] <- "B365L"

qplot(Average_R4_US_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round US Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))


French_open_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("French Open"))
French_open_R4_Win

French_open_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("French Open"))
French_open_R4_Loss

Average_French_R4_W= French_open_R4_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_French_R4_W)
names(Average_French_R4_W)[names(Average_French_R4_W) == "mean(B365W)"] <- "B365W"

qplot(Average_French_R4_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round French Open Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_French_R4_L= French_open_R4_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_French_R4_L)
names(Average_French_R4_L)[names(Average_French_R4_L) == "mean(B365L)"] <- "B365L"

qplot(Average_French_R4_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round French Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))



Australian_open_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R4_Win

Australian_open_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R4_Loss

Average_Aussie_R4_W= Australian_open_R4_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Aussie_R4_W)
names(Average_Aussie_R4_W)[names(Average_Aussie_R4_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Aussie_R4_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round Aussie Open Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Aussie_R4_L= Australian_open_R4_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Aussie_R4_L)
names(Average_Aussie_R4_L)[names(Average_Aussie_R4_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Aussie_R4_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round Aussie Open Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))




Wimbledon_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R4_Win)

Wimbledon_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R4_Loss

Average_Wimbledon_R4_W= Wimbledon_R4_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Wimbledon_R4_W)
names(Average_Wimbledon_R4_W)[names(Average_Wimbledon_R4_W) == "mean(B365W)"] <- "B365W"

qplot(Average_Wimbledon_R4_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round Wimbledon Winners", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,35))


Average_Wimbledon_R4_L= Wimbledon_R4_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Wimbledon_R4_L)
names(Average_Wimbledon_R4_L)[names(Average_Wimbledon_R4_L) == "mean(B365L)"] <- "B365L"

qplot(Average_Wimbledon_R4_L$B365L, geom="histogram",
      binwidth = 1,  
      main = "Fourth Round Wimbledon Losers", 
      xlab = "Betting Range",
      ylab = "Player count",
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(0,35))


##Winnin/Losing betting odds for each QF tournaments

US_open_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("US Open"))
US_open_QF_Win

US_open_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("US Open"))
US_open_QF_Loss


Average_US_QF_W= US_open_QF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_US_QF_W)
names(Average_US_QF_W)[names(Average_US_QF_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_US_QF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  labs(title = "Average Betting Odds for Winning Player in US Open QuarterFinal")+
  coord_flip()



# qplot(Average_US_QF_W$B365W, geom="histogram",
#       binwidth = 1,  
#       main = "Winners", 
#       xlab = "Betting Range",  
#       fill=I("blue"), 
#       col=I("red"), 
#       alpha=I(20),
#       xlim=c(0,11))



Average_QF_US_L= US_open_QF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_QF_US_L)
names(Average_QF_US_L)[names(Average_QF_US_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_QF_US_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  theme_minimal() +
  theme(axis.text.y= element_text(size= 8)) +
  labs(title = "Average Betting Odds for Losing Player in US Open QuarterFinal")+
  coord_flip()


# qplot(Average_US_QF_L$B365L, geom="histogram",
#       binwidth = 1,  
#       main = "Losers", 
#       xlab = "Betting Range",
#       ylab = "Player count",
#       fill=I("red"), 
#       col=I("blue"), 
#       alpha=I(20),
#       xlim=c(0,11))


French_open_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("French Open"))
French_open_QF_Win

French_open_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("French Open"))
French_open_QF_Loss

Average_French_QF_W= French_open_QF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_French_QF_W)
names(Average_French_QF_W)[names(Average_French_QF_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_French_QF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  coord_flip()+
  labs(title ="Average Betting Odds for Winning players in French Open QF")


# qplot(Average_French_QF_W$B365W, geom="histogram",
#       binwidth = 1,  
#       main = "Winners", 
#       xlab = "Betting Range",
#       ylab = "Player count",
#       fill=I("blue"), 
#       col=I("red"), 
#       alpha=I(20),
#       xlim=c(0,11))


Average_French_QF_L= French_open_QF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_French_QF_L)
names(Average_French_QF_L)[names(Average_French_QF_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_French_QF_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  coord_flip()+
  theme_minimal() +
  theme(axis.text.y= element_text(size= 8)) +
  labs(title ="Average Betting Odds for Losing players in French Open QF")



# qplot(Average_French_QF_L$B365L, geom="histogram",
#       binwidth = 1,  
#       main = "Losers", 
#       xlab = "Betting Range",
#       ylab = "Player count",
#       fill=I("blue"), 
#       col=I("red"), 
#       alpha=I(20),
#       xlim=c(0,11))



Australian_open_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_QF_Win

Australian_open_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_QF_Loss

Average_Aussie_QF_W= Australian_open_QF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Aussie_QF_W)
names(Average_Aussie_QF_W)[names(Average_Aussie_QF_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_Aussie_QF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  coord_flip()+
  labs(title ="Average Betting Odds for Winning players in Aussie Open QF")


# qplot(Average_Aussie_QF_W$B365W, geom="histogram",
#       binwidth = 1,  
#       main = "Winners", 
#       xlab = "Betting Range",
#       ylab = "Player count",
#       fill=I("blue"), 
#       col=I("red"), 
#       alpha=I(20),
#       xlim=c(0,11))


Average_Aussie_QF_L= Australian_open_QF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Aussie_QF_L)
names(Average_Aussie_QF_L)[names(Average_Aussie_QF_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_Aussie_QF_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  coord_flip()+
  theme_minimal() +
  theme(axis.text.y= element_text(size= 8)) +
  labs(title ="Average Betting Odds for Losing players in Aussie Open QF")


Wimbledon_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R4_Win)

Wimbledon_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_QF_Loss


Average_Wimbledon_QF_W= Wimbledon_QF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Wimbledon_QF_W)
names(Average_Wimbledon_QF_W)[names(Average_Wimbledon_QF_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_Wimbledon_QF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  coord_flip()+
  theme_minimal() +
  theme(axis.text.y= element_text(size= 7)) +
  labs(title ="Average Betting Odds for Winning players in Wimbledon QF")


# qplot(Average_Wimbledon_QF_W$B365W, geom="histogram",
#       binwidth = 1,  
#       main = "Winners", 
#       xlab = "Betting Range",
#       ylab = "Player count",
#       fill=I("blue"), 
#       col=I("red"), 
#       alpha=I(20),
#       xlim=c(0,11))


Average_Wimbledon_QF_L= Wimbledon_QF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Wimbledon_QF_L)
names(Average_Wimbledon_QF_L)[names(Average_Wimbledon_QF_L) == "mean(B365L)"] <- "B365L"


ggplot(Average_Wimbledon_QF_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  coord_flip()+
  theme_minimal() +
  theme(axis.text.y= element_text(size= 8)) +
  labs(title ="Average Betting Odds for Losing players in Wimbledon QF")


# qplot(Average_Wimbledon_QF_L$B365L, geom="histogram",
#       binwidth = 1,  
#       main = "Losers", 
#       xlab = "Betting Range",
#       ylab = "Player count",
#       fill=I("blue"), 
#       col=I("red"), 
#       alpha=I(20),
#       xlim=c(0,35))


##Winnin/Losing betting odds for each SF tournaments

US_open_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("US Open"))
US_open_SF_Win

US_open_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("US Open"))
US_open_SF_Loss

Average_US_SF_W= US_open_SF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_US_SF_W)
names(Average_US_SF_W)[names(Average_US_SF_W) == "mean(B365W)"] <- "B365W"


ggplot(Average_US_SF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  coord_flip()+
  theme_minimal() +
  theme(axis.text.y= element_text(size= 8)) +
  labs(title ="Average Betting Odds for Winning players in US Open SF")



Average_SF_US_L= US_open_SF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_SF_US_L)
names(Average_SF_US_L)[names(Average_SF_US_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_SF_US_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  coord_flip()+
  theme_minimal() +
  theme(axis.text.y= element_text(size= 8)) +
  labs(title ="Average Betting Odds for Losing players in US Open SF")




French_open_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("French Open"))
French_open_SF_Win

French_open_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("French Open"))
French_open_SF_Loss

Average_French_SF_W= French_open_SF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_French_SF_W)
names(Average_French_SF_W)[names(Average_French_SF_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_French_SF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  coord_flip()+
  labs(title = "Average Betting Odds for Winning Player in French SF")


Average_French_SF_L= French_open_SF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_French_SF_L)
names(Average_French_SF_L)[names(Average_French_SF_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_French_SF_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  coord_flip()+
  labs(title = "Average Betting Odds for Losing Player in French SF")



Australian_open_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_SF_Win

Australian_open_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_SF_Loss


Average_Aussie_SF_W= Australian_open_SF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Aussie_SF_W)
names(Average_Aussie_SF_W)[names(Average_Aussie_SF_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_Aussie_SF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  coord_flip()+
  labs(title = "Average Betting Odds for Winning Player in Aussie SF")



Average_Aussie_SF_L= Australian_open_SF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Aussie_SF_L)
names(Average_Aussie_SF_L)[names(Average_Aussie_SF_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_Aussie_SF_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  coord_flip()+
  labs(title = "Average Betting Odds for Losing Player in Aussie SF")





Wimbledon_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_SF_Win)

Wimbledon_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_SF_Loss


Average_Wimbledon_SF_W= Wimbledon_SF_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_Wimbledon_SF_W)
names(Average_Wimbledon_SF_W)[names(Average_Wimbledon_SF_W) == "mean(B365W)"] <- "B365W"

ggplot(Average_Wimbledon_SF_W, aes(x=Winner, y=B365W)) +
  geom_bar(stat= "identity", fill= "blue")+
  coord_flip()+
  labs(title = "Average Betting Odds for Winning Player in Wimbledon SF")



Average_Wimbledon_SF_L= Wimbledon_SF_Loss  %>% 
  group_by(Loser, Tournament, Round)%>% 
  summarise(., mean(B365L))
View(Average_Wimbledon_SF_L)
names(Average_Wimbledon_SF_L)[names(Average_Wimbledon_SF_L) == "mean(B365L)"] <- "B365L"

ggplot(Average_Wimbledon_SF_L, aes(x=Loser, y=B365L)) +
  geom_bar(stat= "identity", fill= "red")+
  coord_flip()+
  labs(title = "Average Betting Odds for Losing Player in Wimbledon SF")


  
