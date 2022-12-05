

library(tidyverse)
library(reticulate)
library(stringr)
library(dplyr)
library(scales)
library(ggthemes)
library(ggplot2)
library(here)


salary_data <- read_csv("~/work/source_data/data.csv")


proj_plot <- salary_data %>% 
  ggplot() + aes(x= totalyearlycompensation) + geom_histogram(bins= 100, fill = "lightblue", color="darkblue") + scale_y_continuous(labels=comma) + 
  theme(plot.title = element_text(hjust=.5), axis.title = element_text(size=15, face="bold"), axis.text = element_text(size=12)) + xlab("\nTotal Yearly Comp") + ylab("Count\n") + 
  ggtitle("Total Compensation Distribution") + scale_x_continuous(labels=scales::dollar_format())

ggsave("~/work/figures/Total_Compensation_Distribution.png", plot=proj_plot);

#Salary By Years of Experience
exppay_plot <- salary_data %>% 
  ggplot() + aes(x= yearsofexperience, y= totalyearlycompensation) + geom_point(size=.5) + 
  scale_y_continuous(labels=scales::dollar_format()) + theme_fivethirtyeight(base_size=12) + 
  theme(axis.title = element_text(size=15, face='bold'), axis.text= element_text(size=12), plot.title = element_text(hjust=.5)) + xlab("\n Years of Experience") + ylab("Total Yearly Compensation\n") + 
  ggtitle("Compensation By Years of Experience")


ggsave("~/work/figures/Compensation_By_Years_of_Experience.png", plot=exppay_plot);


#Record Per Company
compstat <-  salary_data %>% 
  count(company, sort= T) %>%
  head(n=15) %>% 
  ggplot() + aes(x= reorder(company, n), y=n) + geom_col(fill='#0E5E8E') + coord_flip() + 
  theme_fivethirtyeight(base_size=12) + theme(plot.title= element_text(hjust = .5), 
                                              axis.title = element_text(size=15, face='bold'),
                                              axis.text= element_text(size=12)) + 
  ylab("\n Count") + xlab("Company\n") + ggtitle("Number of Salaries Recorded Per Company") + 
  scale_y_continuous(labels=comma)

ggsave("~/work/figures/Number_of_Salaries_Recorded_Per_Company.png", plot=compstat);

#Record of Titles
titleplot <- salary_data %>% 
  count(title, sort= T) %>%
  head(n=10) %>% 
  ggplot() + aes(x= reorder(title, n), y=n) + geom_col(fill='#0E5E8E') + coord_flip() + 
  theme_fivethirtyeight(base_size=12) + theme(plot.title= element_text(hjust = .5), axis.title = element_text(size=15, face='bold'),
                                              axis.text= element_text(size=12)) + 
  ylab("\n Count") + xlab("Title\n") + ggtitle("Most Common Job Titles") + 
  scale_y_continuous(labels=comma)

ggsave("~/work/figures/Most_Common_Job_Titles.png", plot=titleplot);



#Top Companies For Data Scientists
topcomp <- salary_data %>% 
  filter(title== "Data Scientist")%>% 
  count(company, sort= T) %>%
  head(n=15) %>% 
  ggplot() + aes(x= reorder(company, n), y=n) + geom_col(fill='#0E5E8E') + coord_flip() + 
  theme_fivethirtyeight(base_size=12) + theme(plot.title= element_text(hjust = .5), axis.title = element_text(size=15, face='bold'),
                                              axis.text= element_text(size=12)) + 
  ylab("\n Count") + xlab("Company\n") + ggtitle("Top Companies For Data Scientists")

ggsave("~/work/figures/Top_Companies_For_Data_Scientists.png", plot=topcomp);

#Racial breakdown
byrace <- salary_data %>% 
  filter(title== "Data Scientist")%>% 
  drop_na(Race) %>% 
  count(Race, sort= T) %>% 
  mutate(percent = n/sum(n))%>% 
  ggplot() + aes(x= reorder(Race, percent), y=percent) + geom_col(fill='#0E5E8E') + coord_flip() + 
  theme_fivethirtyeight(base_size=12) + theme(plot.title= element_text(hjust = .5), axis.title = element_text(size=15, face='bold'),
                                              axis.text= element_text(size=12)) + 
  ylab("") + xlab("") + ggtitle("Racial Makeup For Data Scientist Roles") + 
  scale_y_continuous(labels = scales::percent, breaks = pretty_breaks(8))
ggsave("~/work/figures/Racial_Makeup_For_Data_Scientist_Roles.png", plot=byrace);

#Salary for Data By YOE and Race 
datapay <- salary_data %>% 
  filter(title== "Data Scientist")%>% 
  drop_na(Race) %>% 
  ggplot() + aes(x= yearsofexperience, y= totalyearlycompensation, group= Race, color= Race) + geom_point(size=2) + 
  scale_y_continuous(labels=scales::dollar_format()) + theme_fivethirtyeight(base_size=12) + 
  theme(axis.title = element_text(size=15, face='bold'),
        axis.text= element_text(size=12), plot.title = element_text(hjust=.5),legend.text = element_text(size=12), 
        legend.title = element_text(size=12)) + xlab("\n Years of Experience") + ylab("Total Yearly Compensation\n") + 
  ggtitle("Compensation By Years of Experience")+ guides(colour = guide_legend(override.aes = list(size=6)))
ggsave("~/work/figures/Compensation_By_Years_of_Exp.png", plot=datapay);

dataedu <- salary_data %>% 
  filter(title== "Data Scientist")%>% 
  drop_na(Education) %>% 
  count(Education, sort= T) %>% 
  mutate(percent = n/sum(n))%>% 
  ggplot() + aes(x= reorder(Education, percent), y=percent) + geom_col(fill='#0E5E8E') + coord_flip() + 
  theme_fivethirtyeight(base_size=12) + theme(plot.title= element_text(hjust = .5), axis.title = element_text(size=15, face='bold'),
                                              axis.text= element_text(size=12)) + 
  ylab("\n Percent") + xlab("Education\n") + ggtitle("Education Makeup For Data Scientist Roles") + 
  scale_y_continuous(labels = scales::percent, breaks = pretty_breaks(8))

ggsave("~/work/figures/Education_Makeup_For_Data_Scientist_Roles.png", plot=dataedu);

#Compensation By Education
give.n <- function(x){
  return(c(y = median(x)*1.05, label = length(x))) 
  # experiment with the multiplier to find the perfect position
}
datatop <- salary_data %>% 
  filter(title== "Data Scientist")%>% 
  drop_na(Education) %>% 
  ggplot() + aes(x= reorder(Education, -totalyearlycompensation), y= totalyearlycompensation, group= Education, color= Education) + geom_boxplot(size=1.3) + 
  scale_y_continuous(labels=scales::dollar_format()) + theme_fivethirtyeight(base_size=12) + 
  theme(axis.title = element_text(size=15, face='bold'),
        axis.text= element_text(size=12), plot.title = element_text(hjust=.5),legend.position="none", plot.subtitle = element_text(hjust = 0.5, size= 14)) + 
  xlab("\n Education") + ylab("Total Yearly Compensation\n") + 
  ggtitle("Compensation For Data Scientists By Education", subtitle = "Distribution for each education level with a count of observations per group")+ guides(colour = guide_legend(override.aes = list(size=1.5)))+ 
  stat_summary(fun.data = give.n, geom = "text", fun = median,vjust = 0)

ggsave("~/work/figures/compensation_For_Data_Scientists_By_Education.png", plot=datatop);



companies <- salary_data %>% 
  filter(title== "Data Scientist")%>% 
  count(company, sort= T) %>%
  head(n=15)
companies <- companies$company

datacomptop <-salary_data %>% 
  filter(title== "Data Scientist")%>% 
  filter(company %in% companies) %>% 
  group_by(company) %>% 
  summarise(average_comp= mean(totalyearlycompensation))%>% 
  ggplot() + aes(x= reorder(company,average_comp), y= average_comp) + geom_col(size=2, fill='#0E5E8E') + coord_flip() + 
  scale_y_continuous(labels=scales::dollar_format()) + theme_fivethirtyeight(base_size=12) + 
  theme(axis.title = element_text(size=15, face='bold'),
        axis.text= element_text(size=12), plot.title = element_text(hjust=.5),legend.text = element_text(size=10), 
        legend.title = element_text(size=12)) + xlab("") + ylab("\nTotal Yearly Compensation") + 
  ggtitle("Avg Data Scientist Total Compensation")

ggsave("~/work/figures/avg_Data_Scientist_Total_Compensation.png", plot=datacomptop);

datacompdist <- salary_data %>% 
  filter(title== "Data Scientist")%>% 
  filter(company %in% companies) %>% 
  ggplot() + aes(x= reorder(company,totalyearlycompensation), y= totalyearlycompensation) + geom_boxplot(size=1, fill='#0E5E8E', color='black') + coord_flip() + 
  scale_y_continuous(labels=scales::dollar_format()) + theme_fivethirtyeight(base_size=12) + 
  theme(axis.title = element_text(size=15, face='bold'),
        axis.text= element_text(size=12), plot.title = element_text(hjust=.5),legend.text = element_text(size=10), 
        legend.title = element_text(size=12)) + xlab("") + ylab("\nTotal Yearly Compensation") + 
  ggtitle("Data Scientist Total Compensation Distribution")


ggsave("~/work/figures/Data_Scientist_Total_Compensation_Distribution.png", plot=datacompdist);


companies <- salary_data %>% 
  filter(title== "Software Engineer")%>% 
  count(company, sort= T) %>%
  head(n=15)
companies <- companies$company

sdecomp <- salary_data %>% 
  filter(title== "Software Engineer")%>% 
  filter(company %in% companies) %>% 
  group_by(company) %>% 
  summarise(average_comp= mean(totalyearlycompensation))%>% 
  ggplot() + aes(x= reorder(company,average_comp), y= average_comp) + geom_col(size=2, fill='#0E5E8E') + coord_flip() + 
  scale_y_continuous(labels=scales::dollar_format()) + theme_fivethirtyeight(base_size=12) + 
  theme(axis.title = element_text(size=15, face='bold'),
        axis.text= element_text(size=12), plot.title = element_text(hjust=.5),legend.text = element_text(size=10), 
        legend.title = element_text(size=12)) + xlab("") + ylab("\nTotal Yearly Compensation") + 
  ggtitle("Avg Software Engineer Total Compensation")



ggsave("~/work/figures/Avg_Software_Engineer_Total_Compensation.png", plot=sdecomp);


