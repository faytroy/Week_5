df = read.csv("C:/Users/RAC_P/OneDrive/Documents/UMICH/CSC-302/Week 5/ICA11/flights.csv", header=T)
library(ggplot2)
library(dplyr)
library(tidyr)

ggplot(df, aes(x = year, y = passengers)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "glm", formula = y ~ x, color = "#8fe388") +
  ggtitle("Generalized Linear Method") +
  theme(text = element_text(size = 14, color = "#8fe388"))
  
