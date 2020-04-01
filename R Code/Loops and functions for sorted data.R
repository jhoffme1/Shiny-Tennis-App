library(dplyr)


View(tennis_edited)
unique(tennis_edited$match_id)

match_exp_player = match_exp_player %>% mutate(., experience = rank*0)


#for loop to get number of matches played

for(name in unique(match_exp_player$name)){
  match_exp_player[match_exp_player$name == name, ]$experience <- 1:nrow(match_exp_player[match_exp_player$name == name,])
}


match_exp_player %>% arrange(., round)

match_exp_player= match_exp_player %>% arrange(desc(tournament, c("Wimbledon", "US Open")))

#tennis_edited= tennis_edited %>% arrange(., match_id)
# 
# ORIGINAL GROUP BY USED
# match_exp_player= tennis_edited %>%  
#   group_by(name, match_id, tournament, round, rank) %>% 
#   summarise(., max(year))
# 


#match_exp_player$id_number= substring(match_exp_player$match_id, first = 3, last = 12)

#View(match_exp_player$id_number)

# id_number= match_exp_player$id_number

match_exp_player= tennis_edited %>% 
    group_by(name, match_id, date, rank, round, match_minutes, sets, tournament, total_pts, winner, hand, avg_odds, max_odds, birthday) %>% 
    summarise(., max(year))

View(match_exp_player)

#code for experience alignment in relation to tournament.

# for(player_id in unique(match_exp_player$player_id)){
#   match_exp_player[match_exp_player$player_id== player_id,]$experience <- 1:nrow(match_exp_player[match_exp_player$player_id == player_id,])
# } 

View(match_exp_player)
View(tennis_edited)

tennis_order= match_exp_player

View(tennis_order)




#___________________________________

####VERY IMPORTANT CODE BELOW, DO NOT DELETE!!!!!

#match_exp_player= tennis_edited %>% 
#group_by(name, match_id, rank, round) %>% 
 # summarise(., max(year))

#______________________________________



 # round_order= match_exp_player %>% 
 #   group_by(name, rank) %>% 
 #   summarise(first(round), last(round))

View(match_exp_player)
#View(round_order)


#merged tennis data, and sorted data with every players experience.

### (tennis_edited)
### (match_exp_player)







