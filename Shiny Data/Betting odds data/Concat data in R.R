
library(dplyr)
library(tidyr)

file_names = list.files(path= "./Aussie Open/", pattern = '*.csv', all.files= FALSE, 
                        full.names= FALSE, recursive= FALSE,
                        ignore.case= FALSE, include.dirs = FALSE, no..= FALSE)

file_names = lapply(file_names, function(x){paste0('./Aussie Open/', x)})

file_names

Aussie = lapply(file_names, read.csv)

View(Aussie)


file_namesF = list.files(path= "./French Open/", pattern = '*.csv', all.files= FALSE, 
                        full.names= FALSE, recursive= FALSE,
                        ignore.case= FALSE, include.dirs = FALSE, no..= FALSE)

file_namesF = lapply(file_namesF, function(x){paste0('./French Open/', x)})

file_namesF

French = lapply(file_namesF, read.csv)

View(French)




file_namesW = list.files(path= "./Wimbledon/", pattern = '*.csv', all.files= FALSE, 
                         full.names= FALSE, recursive= FALSE,
                         ignore.case= FALSE, include.dirs = FALSE, no..= FALSE)

file_namesW = lapply(file_namesW, function(x){paste0('./Wimbledon/', x)})

file_namesW

Wimbledon = lapply(file_namesW, read.csv)

View(Wimbledon)




file_namesU = list.files(path= "./US Open/", pattern = '*.csv', all.files= FALSE, 
                         full.names= FALSE, recursive= FALSE,
                         ignore.case= FALSE, include.dirs = FALSE, no..= FALSE)

file_namesU = lapply(file_namesU, function(x){paste0('./US Open/', x)})

file_namesU

US = lapply(file_namesU, read.csv)

View(US)

#______________________________

Aussie_new= lapply(Aussie, function(x) x[(names(x) %in% c("Location", "Date", "Round", "Winner", "Loser", "B365W", "B365L", "Tournament"))])

French_new= lapply(French, function(x) x[(names(x) %in% c("Location", "Date", "Round", "Winner", "Loser", "B365W", "B365L", "Tournament"))])

Wimbledon_new= lapply(Wimbledon, function(x) x[(names(x) %in% c("Location", "Date", "Round", "Winner", "Loser", "B365W", "B365L", "Tournament"))])

US_new= lapply(US, function(x) x[(names(x) %in% c("Location", "Date", "Round", "Winner", "Loser", "B365W", "B365L", "Tournament"))])

View(US_new)
View(Wimbledon_new)
View(French_new)
View(Aussie_new)

Data= rbind(US_new, Wimbledon_new, French_new, Aussie_new)

View(Data)

new= do.call("rbind", Data)

View(new)
View(Aussie_new)

new_W=  new %>% 
  group_by(Winner, Date, B365W, Tournament)%>% 
  summarise(., first(Round))
View(new_W)

new_L=  new %>% 
  group_by(Loser, Date, B365L, Tournament)%>% 
  summarise(., first(Round))
View(new_L)


View(match_exp_player)

#stacking new_W and new_L together 


both <- cbind(t(new_L), t(new_W))

View(both)

#fix date issue 




























