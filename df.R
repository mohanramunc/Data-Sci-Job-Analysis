library(tidyverse);
library(reticulate);
library(stringr)
library(dplyr)
use_python("/usr/bin/python3");


df <- read_csv("source_data/data.csv")

cc <- df %>% group_by(company) %>% tally() %>% filter(n>20) %>% pull(company);

df
cc


df_simple <- df %>% filter(company %in% cc);

df_simple




proj_plot <- ggplot(df_simple, aes(yearsofexperience, basesalary)) + geom_point(aes(colour=location));
ggsave("figures/df.png", plot=proj_plot);





