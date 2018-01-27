library(voteogram)
library(ggplot2)
library(gridExtra)
library(ggpubr)

# get vote of the 115th Congress in Session 2 (2018)
# get field values: https://www.govtrack.us/congress/votes

shutdown <- roll_call(critter = "senate", 
                      number = 115,
                      session = 2L,
                      rcall = 14) 

end_shutdown <- roll_call(critter = "senate",
                          number = 115,
                          session = 2L,
                          rcall = 16)

# inspect
str(shutdown, max.level = 1)

# map how the senate voted for the shutdown
sr_14 <- senate_carto(shutdown) + 
  coord_equal() +
  theme_voteogram() + 
  labs(title = "Government Shutdown", 
       subtitle = "Senate Vote 14") +
  theme(text = element_text(family = 'American Typewriter', color = '#333333'),
        plot.title = element_text(size = 14))

sr_16 <- senate_carto(shutdown) + 
  coord_equal() +
  theme_voteogram() + 
  labs(title = "End Government Shutdown", 
       subtitle = "Senate Vote 16") + 
  theme(text = element_text(family = 'American Typewriter', color = '#333333'),
        plot.title = element_text(size = 14))

figure <- grid.arrange(sr_14, sr_16, ncol = 2)

annotate_figure(figure, 
                top = text_grob("Government Shutdown 2018:\nHow the Senate Voted",
                                family = "American Typewriter",
                                size = 22,
                                vjust = 1.3))