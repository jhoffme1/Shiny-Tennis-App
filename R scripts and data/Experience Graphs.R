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

  
  # round 2
     
round_2_exp= experienced_players %>% filter(round %in% c("2nd Round"))
View(round_2_exp)
round_2_exp[3:4]= NULL


Average_R2= round_2_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_R2)[names(Average_R2) == "mean(experience)"] <- "experience"
View(Average_R2)


round_2_exp= Average_R2 %>% filter(round %in% c("2nd round"))
ggplot(Average_R2, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for Second Round Matches ")
View(round_2_exp)

#round 3

round_3_exp= experienced_players %>% filter(round %in% c("3rd Round"))
View(round_3_exp)
round_3_exp[3:4]= NULL

Average_R3= round_3_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_R3)[names(Average_R3) == "mean(experience)"] <- "experience"
View(Average_R3)

# round_3_exp= Average_R3 %>% filter(round %in% c("3rd round"))
ggplot(Average_R3, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for Third Round Matches ")



#round 4
round_4_exp= experienced_players %>% filter(round %in% c("4th Round"))
View(round_4_exp)
round_4_exp[3:4]= NULL

Average_R4= round_4_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_R4)[names(Average_R4) == "mean(experience)"] <- "experience"
View(Average_R4)

# round_3_exp= Average_R3 %>% filter(round %in% c("3rd round"))
ggplot(Average_R4, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for Fourth Round Matches ")

#QF

round_QF_exp= experienced_players %>% filter(round %in% c("Quarterfinals")) 
View(round_4_exp)
round_4_exp[3:4]= NULL


Average_QF= round_QF_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_QF)[names(Average_QF) == "mean(experience)"] <- "experience"
View(Average_QF)

# round_3_exp= Average_R3 %>% filter(round %in% c("3rd round"))
ggplot(Average_QF, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for QF Matches ")

#SemiFinal

round_SF_exp= experienced_players %>% filter(round %in% c("Semifinals"))
View(round_SF_exp)
round_SF_exp[3:4]= NULL

Average_SF= round_SF_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_SF)[names(Average_SF) == "mean(experience)"] <- "experience"
View(Average_SF)

# round_3_exp= Average_R3 %>% filter(round %in% c("3rd round"))
ggplot(Average_SF, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for SF Matches ")

#Final

round_F_exp= experienced_players %>% filter(round %in% c("The Final"))
View(round_F_exp)
round_F_exp[3:4]= NULL

Average_F= round_F_exp %>% 
  group_by(name, winner, round) %>% 
  summarise(., mean(experience))
names(Average_F)[names(Average_F) == "mean(experience)"] <- "experience"
View(Average_F)

# round_3_exp= Average_R3 %>% filter(round %in% c("3rd round"))
ggplot(Average_F, aes(x = experience, fill = winner)) + 
  geom_density(position = "identity", alpha = 0.4) +
  scale_x_continuous(name = "Amount of matches played") +
  scale_y_continuous(name = "Density of players") +
  ggtitle("Density Plot of Players Experience for Finals Matches ")









