library(dplyr)
library(ggplot2)
library(reshape2)


round_1_exp= experienced_players %>% filter(round %in% c("1st Round"))
View(round_1_exp)
round_1_exp[3:4]= NULL


Average_R1= round_1_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_R1)[names(Average_R1) == "mean(experience)"] <- "experience"
View(Average_R1)
round_1_exp

round_1_exp= Average_R1 %>% filter(round %in% c("First round"))
ggplot(Average_R1, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for First Round Matches ")






# ggplot(Average_R1, aes(x = experience, fill = winner)) + 
#   geom_density(position = "identity", alpha = 20)




  
  # round 2
     
round_2_exp= experienced_players %>% filter(round %in% c("2nd Round"))
ggplot(round_2_exp, aes(x = experience, fill = winner)) + 
  geom_histogram(position = "identity", alpha = 20)

round_2_exp= round_2_exp %>% filter(round %in% c("First round"))
ggplot(Average_R1, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for First Round Matches ")
View(round_1_exp)

#round 3

round_3_exp= experienced_players %>% filter(round %in% c("3rd Round"))
ggplot(round_3_exp, aes(x = experience, fill = winner)) + 
  geom_histogram(position = "identity", alpha = 20)


#round 4
round_4_exp= experienced_players %>% filter(round %in% c("4th Round"))
ggplot(round_4_exp, aes(x = experience, fill = winner)) + 
  geom_histogram(position = "identity", alpha = 20)

#QF

round_QF_exp= experienced_players %>% filter(round %in% c("Quarterfinals")) 
ggplot(Average_QF, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 20)

Average_QF= round_QF_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_QF)[names(Average_QF) == "mean(experience)"] <- "experience"
View(Average_QF)

Average_QF.melted = melt(Average_QF,
                         id.vars=c('name','winner'),
                         variable.name='round')

ggplot(Average_QF, aes(experience, name, color=winner)) + 
  geom_point() + 
  facet_grid(round~.)


round_SF_exp= experienced_players %>% filter(round %in% c("Semifinals"))
ggplot(round_SF_exp, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 20)

Average_SF= round_SF_exp %>% 
  group_by(tournament, winner, round, hand) %>% 
  summarise(., mean(experience))
names(Average_SF)[names(Average_SF) == "mean(experience)"] <- "experience"
View(Average_SF)


Average_SF.melted = melt(Average_SF,
                        id.vars=c('tournament','winner'),
                        variable.name='round')

ggplot(Average_SF, aes(experience, tournament, color=winner)) + 
  geom_point() + 
  facet_grid(round~.)



# ggplot(round_F_exp, aes(x = experience, fill = winner)) +
#   geom_density(position="identity", alpha=20) +
#   scale_x_continuous(name = "Amount of matches played") +
#   scale_y_continuous(name = "Density of players") +
#   ggtitle("Density Plot of Players Experience for First Round Matches ") 
#   # theme_bw() +
#   # theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
#   #       text = element_text(size = 12, family = "Tahoma")) +
#   # scale_fill_brewer(palette="Accent"))

Average_F= round_F_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_F)[names(Average_F) == "mean(experience)"] <- "experience"
View(Average_F)

round_F_exp=  round_F_exp %>% filter(round %in% c("The Final"))
ggplot(round_F_exp, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.5) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for Final Round Matches ")
View(round_F_exp)









