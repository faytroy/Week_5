
library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
install.packages('ggridges')
library(ggridges)
library(lubridate)


load("C:/Users/RAC_P/OneDrive/Documents/UMICH/CSC-302/Week 5/HW4/preprint_growth.rda") #please change the path if needed

head(preprint_growth)

preprint_growth %>% filter(archive == "bioRxiv") %>%
  filter(count > 0) -> biorxiv_growth

preprints<-preprint_growth %>% filter(archive %in%
                                        c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")) %>%filter(count > 0) %>%
  mutate(archive = factor(archive, levels = c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")))

head(preprints)

ggplot(preprints, aes(date, count, color = archive, fill= archive, shape = archive)) +
  geom_line(size = .75) +
  geom_point(color = "white", size = 2) +
  scale_y_continuous(limits = c(0, 600), expand = c(0,0),
                     name = "preprints / month") +
  scale_x_date(name = "year",
               limits = c(min(biorxiv_growth$date), ymd("2018-01-01"))) + #picked new start date of 1/1/2028
  scale_color_manual(values = c("#c51b8a", "#de2d26", "#2c7fb8"), #picked three different colors
                                name = NULL) +
  scale_fill_manual(values = c("#c51b8a", "#de2d26", "#2c7fb8"),
                               name = NULL) +
  scale_shape_manual(values = c(21,22,23),
                     name = NULL) +
  theme(legend.title.align = 0.5,
        legend.position = c(0.1, .9),
        legend.just = c(0,1),
        plot.margin = margin(14, 7, 3, 1.5))
                    

               