#For the data sets, sort out the rows so that they are evnly distributed.
#For distribution, use the STATS data frame as the independent variable because that holds all of the stats per match. 
#Use the player data frame to merge each of the player IDs with the player ids in the Stats data frame (independent variable)
#Key frames to get rid of: 
                        #Match:  #Date
                        #Player:  #birthday
                        #Stats:   #Ranking points
                        
#Use the merge functions to combine the data frames.
#

library(dplyr)
library (ggplot2)
library(tidyr)
library(stringr)
library(tidyverse)


match= Match
# x= gsub("_W", "_L", match$match_id)
# match$match_id = x
View(match)

# match2= Match_ordered_tournaments
stats= Stats
player= Player

#manipulating the data set for wimbledon using gsub= x <- (gsub("_W", "_L", match$match_id)), match$match_id = x


#match[3]= NULL
#View(match)

# match2[3]=NULL
# View(match2)

# stats[3]= NULL
# View(stats)


head(player)

mergeCols= c("Data A", "Data B", "Data C" )
View(mergeCols)


natural = merge(player, stats)

View(player)
View(stats)
View(match)

library(tidyverse)




#these are the merge commands for all of the data

player_id_stats= stats %>% select(player_id)
View(player_id_stats)

player_id_players= player %>% select(1:5)
View(player_id_players)

combined_id= merge(player_id_stats, player_id_players)
View(combined_id)


match_id= match %>% select(1:2)
View(match_id)

stat_match_id= stats %>% select(match_id)
View(stat_match_id)

combined_match_id= merge(match_id, stat_match_id)
View(combined_match_id)

match_new= merge(combined_match_id, match)

View(match_new)

match_new
View(stats)

View(combined_id)

#These are the names of the merged sections that even out the rows.

player_data= combined_id
match_data= match_new
View(player_data)
View(match_data)
View(stats)

View(match)
View(stats)
View(player)

stats_match= merge(match_data, stats)
View(stats_match)


#merging all data evenly together now, FOLLOW THESE STEPS

library(tidyverse)

unique(tennis)

test2= stats_match %>% distinct()
View(test2)

tennis= merge(test2, player_data)
View(tennis)

tennis_edited= tennis %>% distinct()
View(tennis_edited)

x= gsub("_W", "_L", tennis_edited$match_id)
tennis_edited$match_id = x
y= gsub(" ", "0", tennis_edited$pts )
tennis_edited$pts = y

#manipulating the data set for wimbledon using gsub= x <- (gsub("_W", "_L", match$match_id)), match$match_id = x

save(tennis_edited, file= "tennis_edited")
save(Match, file= "Match")
save(Stats, file= "Stats")
save(Player, file= "Player")


View(tennis_edited)















