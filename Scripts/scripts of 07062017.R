download.file(url = "https://raw.githubusercontent.com/dmi3kno/SWC-tidyverse/master/data/gapminder_plus.csv", 
              destfile = "Data/gapminder_plus.csv")

library("tidyverse")
gapminder_plus <- read.csv(file="Data/gapminder_plus.csv")
gapminder_plus

#filter continent Africa
#filter seven countries with over two millions infant death in 2007  

gapminder_plus%>%
  filter(continent=="Africa",year==2007)%>%
  mutate(babiesDead=infantMort*pop/10^3)%>%
  filter(babiesDead>2e6)%>%
  select(country)%>%
  left_join(gapminder_plus)%>%
  mutate(babiesDead=infantMort*pop/10^3,gdp_bln=gdpPercap*pop/1e9, pop_mln=pop/1e6)%>%
  select(-c(continent,pop,babiesDead))%>%
  gather(key=variables,value=values,-c(country,year))%>%
  ggplot()+
  geom_text(data=.%>% filter(year==2007)%>% group_by(variables) %>% 
              mutate(max_value=max(values))%>%
              filter(values==max_value),
            aes(x=year,y=values, label=country, color=country))+
  geom_line(mapping=aes(x=year,y=values,color=country))+
  facet_wrap(~variables,scales="free_y")+
  labs(title="Key parameters for African countries", subtitle="In 2007, infant mortality", caption="source:Gapminder foundation,gapminder.com", 
       x="Year",
       y=NULL)+theme_bw()+theme(legend.position = "none")

 
#Saving figures
ggsave("Keyparameters for African countries in 2007.png")



#figure out when you need "left_join", right_join

  