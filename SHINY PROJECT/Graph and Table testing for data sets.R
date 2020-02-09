library(ggplot2)
library(dplyr)
install.packages(reshape2)
library(reshape)

View(WinnerBet)
View(LoserBet)
View(experienced_players)
experienced_players[12:13]= NULL

View(cbind(WinnerBet, LoserBet))


top_10_scorers= experinced_players %>% 
  group_by(name, round, match_minutes) %>% 
  summarise(., max(total_pts))

top_10_scorers

top_20_scorers=  experienced_players %>% 
  group_by(name)%>% 
  summarise(., mean(total_pts))
View(top_20_scorers)

# top_10_scorers=  experienced_players %>% 
#   group_by(name)%>% 
#   summarise(., mean(total_pts))
# View(top_10_scorers)


top_20_rounds=  experienced_players %>% 
  group_by(name, winner, round)%>% 
  summarise(., mean(total_pts))
View(top_20_rounds)

top_20_experience= experienced_players %>% 
  group_by(name, winner, round)%>% 
  summarise(., mean(experience))
View(top_20_experience)



View(top_10_scorers)

?top_n


top_experienceWL=  experienced_players %>% 
  group_by(name, winner, round)%>% 
  summarise(., mean(experience))
View(top_experienceWL)


top_experience=  experienced_players %>% 
  group_by(name)%>% 
  summarise(., mean(experience))
View(top_experience)


#top_10_scorers[top_10_scorers$name %>%  c("Kevin Anderson", "Marin Cilic"), ] #more names to add
View(out)
E_top_10= top_10_scorers %>% filter(name %in% c("Kevin Anderson", "Marin Cilic", "John Isner", "Lukas Dlouhy", "Andy Roddick", "Mark Philippoussis", "Sam Querrey", "
                                      Lukas Lacko", "Michael Yani", "Fabrice Santoro", "Ivo Karlovic"))

View(E_top_10)

#Seperated rounds on average total points

filtered_round_1= top_20_rounds %>% filter(round %in% c("1st Round"))

filtered_round_2= top_20_rounds %>% filter(round %in% c("2nd Round"))

filtered_round_3= top_20_rounds %>% filter(round %in% c("3rd Round"))

filtered_round_4= top_20_rounds %>% filter(round %in% c("4th Round"))

filtered_round_QF= top_20_rounds %>% filter(round %in% c("Quarterfinals")) 

filtered_round_SF= top_20_rounds %>% filter(round %in% c("Semifinals"))

filtered_round_F= top_20_rounds %>% filter(round %in% c("The Final"))
View(filtered_round_F)



#Seperated rounds on average experience

filtered_round_1= top_20_experience %>% filter(round %in% c("1st Round"))

filtered_round_2= top_20_experience %>% filter(round %in% c("2nd Round"))

filtered_round_3= top_20_experience %>% filter(round %in% c("3rd Round"))

filtered_round_4= top_20_experience %>% filter(round %in% c("4th Round"))

filtered_round_QF= top_20_experience %>% filter(round %in% c("Quarterfinals")) 

filtered_round_SF= top_20_experience %>% filter(round %in% c("Semifinals"))

filtered_round_F= top_20_experience %>% filter(round %in% c("The Final"))
                                      
                                      
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
                                      
                                      
# Djokovic_Winning= filtered_betw_F %>% filter(Winner %in% c("Djokovic N."))
# 
# Djokovic_Losing= filtered_betL_F %>% filter(Loser %in% c("Djokovic N."))
# View(Djokovic_Winning)                                      
# Djokovic_Losing                                      
#                                       
# boxplot(Djokovic_Winning$B365W)                           
# 
# boxplot(filtered_betL_F$B365L) 
# boxplot(filtered_betw_F$B365W)                                      
                                      
# View(TennisL)                                      
# View()    
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
names(Average_Final_L)[names(Average_Final_L) == "mean(B365W)"] <- "B365W"


#barplots

US_open_final_plotW<-ggplot(US_open_Final_Win, aes(x=Winner, y=B365W)) +
  geom_bar(stat="identity")
US_open_final_plot

US_open_final_plotL<-ggplot(US_open_Final_Loss, aes(x=Loser, y=(B365L))) +
  geom_bar(stat="identity")
US_open_final_plotL

French_open_Final_Win= Average_Tennis_Win %>% filter(Tournament %in% c("French Open"))
names(French_open_Final_Win)[names(French_open_Final_Win) == "mean(B365W)"] <- "B365W"
French_open_Final_Win

French_open_Final_Loss= Average_Tennis_Loss %>% filter(Tournament %in% c("French Open"))
names(French_open_Final_Loss)[names(French_open_Final_Loss) == "mean(B365L)"] <- "B365L"
French_open_Final_Loss

Australian_open_Final_Win= Average_Tennis_Win %>% filter(Tournament %in% c("Australian Open"))
names(Australian_open_Final_Win)[names(Australian_open_Final_Win) == "mean(B365W)"] <- "B365W"
Australian_open_Final_Win

Australian_open_Final_Loss= Average_Tennis_Loss %>% filter(Tournament %in% c("Australian Open"))
names(Australian_open_Final_Loss)[names(Australian_open_Final_Loss) == "mean(B365L)"] <- "B365L"
Australian_open_Final_Loss

Wimbledon_Final_Win= Average_Tennis_Win %>% filter(Tournament %in% c("Wimbledon"))
names(Wimbledon_Final_Win)[names(Wimbledon_Final_Win) == "mean(B365W)"] <- "B365W"
Wimbledon_Final_Win

Wimbledon_Final_Loss= Average_Tennis_Loss %>% filter(Tournament %in% c("Wimbledon"))
names(Wimbledon_Final_Loss)[names(Wimbledon_Final_Loss) == "mean(B365L)"] <- "B365L"
Wimbledon_Final_Loss


##Winnin/Losing betting odds for each First round tournaments 

US_open_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("US Open"))
# names(US_open_Final_Win)[names(US_open_Final_Win) == "mean(B365W)"] <- "B365W"
View(US_open_R1_Win)


Average_R1_W= US_open_R1_Win  %>% 
  group_by(Winner, Tournament, Round)%>% 
  summarise(., mean(B365W))
View(Average_R1_W)
names(Average_R1_W)[names(Average_R1_W) == "mean(B365W)"] <- "B365W"

qplot(Average_R1_W$B365W, geom="histogram",
      binwidth = 1,  
      main = "Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(0,11))

US_open_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("US Open"))
# names(US_open_Final_Loss)[names(US_open_Final_Loss) == "mean(B365L)"] <- "B365L"
View(US_open_R1_Loss)



ggplot(US_open_R1_Win, aes(x=B365W, y=Winner)) +
  geom_point(shape=1) 



qplot(US_open_R1_Win$B365W, geom="histogram",
      binwidth = 1,  
      main = "Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(-5,15))


qplot(US_open_R1_Loss$B365L, geom="histogram",
      binwidth = 1,  
      main = "Losers", 
      xlab = "Betting Range",  
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(-5,65))


# 
# R1_US_WL= cbind(US_open_R1_Win, US_open_R1_Loss)
# View(R1_US_WL)
# A= (R1_US_WL$B365W - R1_US_WL$B365L)
# Round1_US_Odds= cbind(A, R1_US_WL)
# names(Round1_US_Odds)[names(Round1_US_Odds) == "A"] <- "Odds"
# Round1_US_Odds[4:5]= NULL
# View(Round1_US_Odds)

ggplot(Round1_US_Odds, aes(x=Odds)) + geom_histogram()


French_open_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("French Open"))
French_open_R1_Win

French_open_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("French Open"))
French_open_R1_Loss

R1_French_WL= cbind(French_open_R1_Win, French_open_R1_Loss)

qplot(French_open_R1_Win$B365W, geom="histogram",
      binwidth = 1,  
      main = "Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(-5,15))


qplot(French_open_R1_Loss$B365L, geom="histogram",
      binwidth = 1,  
      main = "Losers", 
      xlab = "Betting Range",  
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(-5,65))




# View(R1_French_WL)
# A= (R1_French_WL$B365W - R1_French_WL$B365L)
# Round1_French_Odds= cbind(A, R1_French_WL)
# names(Round1_French_Odds)[names(Round1_French_Odds) == "A"] <- "Odds"
# Round1_French_Odds[3]= NULL
# Round1_French_Odds[4:5]= NULL
# View(Round1_French_Odds)
# 
# ggplot(Round1_French_Odds, aes(x=Odds)) + geom_histogram()



Australian_open_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R1_Win

Australian_open_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R1_Loss

R1_Aussie_WL= cbind(Australian_open_R1_Win, Australian_open_R1_Loss)

qplot(Australian_open_R1_Win$B365W, geom="histogram",
      binwidth = 1,  
      main = "Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(-5,15))


qplot(Australian_open_R1_Loss$B365L, geom="histogram",
      binwidth = 1,  
      main = "Losers", 
      xlab = "Betting Range",  
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(-5,65))


# View(R1_Aussie_WL)
# A= (R1_Aussie_WL$B365W - R1_Aussie_WL$B365L)
# Round1_Aussie_Odds= cbind(A, R1_Aussie_WL)
# names(Round1_Aussie_Odds)[names(Round1_Aussie_Odds) == "A"] <- "Odds"
# Round1_Aussie_Odds[3]= NULL
# Round1_Aussie_Odds[4:5]= NULL
# View(Round1_Aussie_Odds)
# 
# ggplot(Round1_Aussie_Odds, aes(x=Odds)) + geom_histogram()





Wimbledon_R1_Win= filtered_betw_1 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R1_Win)

Wimbledon_R1_Loss= filtered_betL_1 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R1_Loss


qplot(Wimbledon_R1_Win$B365W, geom="histogram",
      binwidth = 1,  
      main = "Winners", 
      xlab = "Betting Range",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(20),
      xlim=c(-5,15))


qplot(Wimbledon_R1_Loss$B365L, geom="histogram",
      binwidth = 1,  
      main = "Losers", 
      xlab = "Betting Range",  
      fill=I("red"), 
      col=I("blue"), 
      alpha=I(20),
      xlim=c(-5,65))




# R1_Wimbledon_WL= cbind(Wimbledon_R1_Win, Wimbledon_R1_Loss)
# View(R1_Wimbledon_WL)
# 
# View(R1_Wimbledon_WL)
# A= (R1_Wimbledon_WL$B365W - R1_Wimbledon_WL$B365L)
# Round1_Wimbledon_Odds= cbind(A, R1_Wimbledon_WL)
# names(Round1_Wimbledon_Odds)[names(Round1_Wimbledon_Odds) == "A"] <- "Odds"
# Round1_Wimbledon_Odds[3]= NULL
# Round1_Wimbledon_Odds[4:5]= NULL
# View(Round1_Wimbledon_Odds)
# 
# ggplot(Round1_Wimbledon_Odds, aes(x=Odds)) + geom_histogram()

##Winnin/Losing betting odds for each Second round tournaments 

US_open_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("US Open"))
US_open_R2_Win

US_open_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("US Open"))
US_open_R2_Loss

# R2_US_WL= cbind(US_open_R2_Win, US_open_R2_Loss)
# View(R2_US_WL)
# A= (R2_US_WL$B365W - R2_US_WL$B365L)
# Round2_US_Odds= cbind(A, R2_US_WL)
# names(Round2_US_Odds)[names(Round2_US_Odds) == "A"] <- "Odds"
# Round2_US_Odds[3]= NULL
# Round2_US_Odds[4:5]= NULL
# View(Round2_US_Odds)
# 
# ggplot(Round2_US_Odds, aes(x=Odds)) + geom_histogram()


French_open_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("French Open"))
French_open_R2_Win

French_open_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("French Open"))
French_open_R2_Loss

R2_French_WL= cbind(French_open_R2_Win, French_open_R2_Loss)

# View(R2_French_WL)
# A= (R2_French_WL$B365W - R2_French_WL$B365L)
# Round2_French_Odds= cbind(A, R2_French_WL)
# names(Round2_French_Odds)[names(Round2_French_Odds) == "A"] <- "Odds"
# Round2_French_Odds[3]= NULL
# Round2_French_Odds[4:5]= NULL
# View(Round2_French_Odds)
# 
# ggplot(Round2_French_Odds, aes(x=Odds)) + geom_histogram()


Australian_open_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R2_Win

Australian_open_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R2_Loss

R2_Aussie_WL= cbind(Australian_open_R2_Win, Australian_open_R2_Loss)

View(R2_Aussie_WL)
A= (R2_Aussie_WL$B365W - R2_Aussie_WL$B365L)
Round2_Aussie_Odds= cbind(A, R2_Aussie_WL)
names(Round2_Aussie_Odds)[names(Round2_Aussie_Odds) == "A"] <- "Odds"
Round2_Aussie_Odds[3]= NULL
Round2_Aussie_Odds[4:5]= NULL
View(Round2_Aussie_Odds)

ggplot(Round2_Aussie_Odds, aes(x=Odds)) + geom_histogram()


Wimbledon_R2_Win= filtered_betw_2 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R2_Win)

Wimbledon_R2_Loss= filtered_betL_2 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R2_Loss

R2_Wimbledon_WL= cbind(Wimbledon_R2_Win, Wimbledon_R2_Loss)
View(R2_Wimbledon_WL)

View(R2_Wimbledon_WL)
A= (R2_Wimbledon_WL$B365W - R2_Wimbledon_WL$B365L)
Round2_Wimbledon_Odds= cbind(A, R2_Wimbledon_WL)
names(Round2_Wimbledon_Odds)[names(Round2_Wimbledon_Odds) == "A"] <- "Odds"
Round2_Wimbledon_Odds[3]= NULL
Round2_Wimbledon_Odds[4:5]= NULL
View(Round2_Wimbledon_Odds)

ggplot(Round2_Wimbledon_Odds, aes(x=Odds)) + geom_histogram()


##Winnin/Losing betting odds for each Third round tournaments

US_open_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("US Open"))
US_open_R3_Win

US_open_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("US Open"))
US_open_R3_Loss

R3_US_WL= cbind(US_open_R3_Win, US_open_R3_Loss)
View(R3_US_WL)
A= (R3_US_WL$B365W - R3_US_WL$B365L)
Round3_US_Odds= cbind(A, R3_US_WL)
names(Round3_US_Odds)[names(Round3_US_Odds) == "A"] <- "Odds"
Round3_US_Odds[3]= NULL
Round3_US_Odds[4:5]= NULL
View(Round3_US_Odds)

ggplot(Round3_US_Odds, aes(x=Odds)) + geom_histogram()


French_open_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("French Open"))
French_open_R3_Win

French_open_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("French Open"))
French_open_R3_Loss

R3_French_WL= cbind(French_open_R3_Win, French_open_R3_Loss)

View(R3_French_WL)
A= (R3_French_WL$B365W - R3_French_WL$B365L)
Round3_French_Odds= cbind(A, R3_French_WL)
names(Round3_French_Odds)[names(Round3_French_Odds) == "A"] <- "Odds"
Round3_French_Odds[3]= NULL
Round3_French_Odds[4:5]= NULL
View(Round3_French_Odds)

ggplot(Round3_French_Odds, aes(x=Odds)) + geom_histogram()



Australian_open_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R3_Win

Australian_open_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R3_Loss

R3_Aussie_WL= cbind(Australian_open_R3_Win, Australian_open_R3_Loss)

View(R3_Aussie_WL)
A= (R3_Aussie_WL$B365W - R3_Aussie_WL$B365L)
Round3_Aussie_Odds= cbind(A, R3_Aussie_WL)
names(Round3_Aussie_Odds)[names(Round3_Aussie_Odds) == "A"] <- "Odds"
Round3_Aussie_Odds[3]= NULL
Round3_Aussie_Odds[4:5]= NULL
View(Round3_Aussie_Odds)

ggplot(Round3_Aussie_Odds, aes(x=Odds)) + geom_histogram()



Wimbledon_R3_Win= filtered_betw_3 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R3_Win)

Wimbledon_R3_Loss= filtered_betL_3 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R3_Loss


R3_Wimbledon_WL= cbind(Wimbledon_R3_Win, Wimbledon_R3_Loss)
View(R3_Wimbledon_WL)

View(R3_Wimbledon_WL)
A= (R3_Wimbledon_WL$B365W - R3_Wimbledon_WL$B365L)
Round3_Wimbledon_Odds= cbind(A, R3_Wimbledon_WL)
names(Round3_Wimbledon_Odds)[names(Round3_Wimbledon_Odds) == "A"] <- "Odds"
Round3_Wimbledon_Odds[3]= NULL
Round3_Wimbledon_Odds[4:5]= NULL
View(Round3_Wimbledon_Odds)

ggplot(Round3_Wimbledon_Odds, aes(x=Odds)) + geom_histogram()




##Winnin/Losing betting odds for each Fourth round tournaments

US_open_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("US Open"))
US_open_R4_Win

US_open_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("US Open"))
US_open_R4_Loss

R4_US_WL= cbind(US_open_R4_Win, US_open_R4_Loss)
#Line Graph


French_open_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("French Open"))
French_open_R4_Win

French_open_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("French Open"))
French_open_R4_Loss

R4_French_WL= cbind(French_open_R4_Win, French_open_R4_Loss)
#Line Graph


Australian_open_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R4_Win

Australian_open_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("Australian Open"))
Australian_open_R4_Loss

R4_Aussie_WL= cbind(Australian_open_R4_Win, Australian_open_R4_Loss)
#Line Graph


Wimbledon_R4_Win= filtered_betw_4 %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R4_Win)

Wimbledon_R4_Loss= filtered_betL_4 %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_R4_Loss

R4_Wimbledon_WL= cbind(Wimbledon_R4_Win, Wimbledon_R4_Loss)
R4_Wimbledon_WL
#LineGraph


##Winnin/Losing betting odds for each QF tournaments

US_open_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("US Open"))
US_open_QF_Win

US_open_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("US Open"))
US_open_QF_Loss


US_open_QF_WL= cbind(US_open_QF_Win, US_open_QF_Loss)
View(US_open_QF_WL)

ggplot(US_open_QF_Win, aes(x=B365W, y=Winner)) +
  geom_point(shape=1) 

ggplot(US_open_QF_Loss, aes(x=B365L, y=Loser)) +
  geom_point(shape=1)



French_open_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("French Open"))
French_open_QF_Win

French_open_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("French Open"))
French_open_QF_Loss

Australian_open_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_QF_Win

Australian_open_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_QF_Loss

Wimbledon_QF_Win= filtered_betw_QF %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_R4_Win)

Wimbledon_QF_Loss= filtered_betL_QF %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_QF_Loss

##Winnin/Losing betting odds for each SF tournaments

US_open_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("US Open"))
US_open_SF_Win

US_open_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("US Open"))
US_open_SF_Loss

French_open_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("French Open"))
French_open_SF_Win

French_open_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("French Open"))
French_open_SF_Loss

Australian_open_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_SF_Win

Australian_open_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("Australian Open"))
Australian_open_SF_Loss

Wimbledon_SF_Win= filtered_betw_SF %>% filter(Tournament %in% c("Wimbledon"))
View(Wimbledon_SF_Win)

Wimbledon_SF_Loss= filtered_betL_SF %>% filter(Tournament %in% c("Wimbledon"))
Wimbledon_SF_Loss



ggplot(, aes(x=dose, y=len, group=1)) +
  geom_line()+
  geom_point()



# ggplot(US_open_Final_Loss, aes(x=Loser, y=B365L)) + 
#   geom_boxplot(outlier.colour="red", outlier.shape=8,
#                outlier.size=4)




# histogram_US_R1_w <- ggplot(US_open_R1_Win = diamonds, aes(x = B365W))
# g + geom_histogram(binwidth = 1)

# 
# qplot(US_open_R1_Win$B365W, geom="histogram") 
# qplot(US_open_R1_Loss$B365L, geom="histogram") 
# 
# View(US_open_R1_Win)
# View(US_open_R1_Loss)
# 
# R1_US_W_hist <- ggplot(AD, aes(x = B365W))
# zoom <- coord_cartesian(xlim = c(0, 70))
# R1_US_W_hist + geom_histogram(binwidth = 1) + zoom
# 



geom_line(aes(y = B365W, x = Winner),
          Data = AD)

A + geom_histogram(aes(B365L, fill=cut), binwidth = 1,
                               B365L = position_stack(reverse=TRUE)) + zoom
# 
# 
AD= cbind(US_open_R1_Win, US_open_R1_Loss)
# View(AD)


C= qplot(B$A, geom="histogram") 


ggplot(US_open_Final_Win, aes(x=Winner, y=B365W)) + 
  geom_bar(stat = "identity")

ggplot(US_open_Final_Loss, aes(x=Loser, y=B365L)) + 
  geom_bar(stat = "identity")

ggplot(US_open_Final_Win, aes(x=Winner, y=B365W)) +
  geom_point(size=2, shape=23)

ggplot(US_open_Final_Loss, aes(x=Loser, y=B365L)) +
  geom_point(size=6, shape=25)

US_open_Final_Win




