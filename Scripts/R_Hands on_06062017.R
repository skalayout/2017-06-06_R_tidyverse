#loading the tidyverse package

library("tidyverse")

gapminder <- read_csv(file = "Data/gapminder-FiveYearData.csv")



gapminder


ggplot(data=gapminder) +
  geom_point(mapping=aes(x=gdpPercap, y=lifeExp))

ggplot(data=gapminder) +
  geom_jitter(mapping=aes(x=gdpPercap, y=lifeExp,color=continent))

#colouring by several variable then we parameters
ggplot(data=gapminder) +
geom_point(mapping=aes(x=log(gdpPercap), y=lifeExp,color=continent,size=pop))


ggplot(data=gapminder) +
  geom_point(mapping=aes(x=log(gdpPercap), y=lifeExp),alpha=0.1, size=2, color="blue")



ggplot(data=gapminder) +
  geom_line(mapping=aes(x=year, y=lifeExp,group=country, color=continent))


ggplot(data=gapminder) +
  geom_boxplot(mapping=aes(x=continent, y=lifeExp))



ggplot(data=gapminder) +
  geom_jitter(mapping=aes(x=continent, y=lifeExp, color=continent))+
  geom_boxplot(mapping=aes(x=continent, y=lifeExp,color=continent))

ggplot(data=gapminder) +
  geom_boxplot(mapping=aes(x=continent, y=lifeExp,color=continent))+
  geom_jitter(mapping=aes(x=continent, y=lifeExp, color=continent))


gplot(data=gapminder) +
  geom_jitter(mapping=aes(x=continent, y=lifeExp, color=continent))+
  geom_boxplot(mapping=aes(x=continent, y=lifeExp,color=continent))


ggplot(data=gapminder, 
       mapping=aes(x=continent, y=lifeExp, color=continent))+
  geom_jitter()+
  geom_boxplot()

ggplot(data=gapminder, 
       mapping=aes(x=log(gdpPercap), y=lifeExp, color=continent))+
  geom_jitter(alpha=0.5)+
  geom_smooth(method="lm")

ggplot(data=gapminder, 
       mapping=aes(x=log(gdpPercap), y=lifeExp, color=continent))+
  geom_jitter(alpha=0.1)+
  geom_smooth(method="lm")


ggplot(data=gapminder, 
       mapping=aes(x=log(gdpPercap), y=lifeExp))+
  geom_jitter(mapping=aes(color=continent),alpha=0.5)+
  geom_smooth(method="lm")

ggplot(data=gapminder) +
  geom_boxplot(mapping=aes(x=year, y=lifeExp, color=continent))

ggplot(data=gapminder) +
  geom_boxplot(mapping=aes(x=lifeExp, y=year))
#challenge

ggplot(data=gapminder) +
  geom_boxplot(mapping=aes(x=lifeExp, y=year,color=continent))

ggplot(data=gapminder) +
  geom_boxplot(mapping=aes(x=as.factor(year), y=lifeExp))

ggplot(data=gapminder) +
  geom_boxplot(mapping=aes(x=as.factor(year), y=log(gdpPercap)))

ggplot(data=gapminder) +
  geom_density2d(mapping=aes(x=lifeExp, y=log(gdpPercap)))
#faceting by continent with
ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+
  geom_point()+
  geom_smooth()+
  scale_x_log10()+
  facet_wrap(~continent)

#faceting by year, keeping the linear smoother
ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+
  geom_point()+
  geom_smooth(method="lm")+
  scale_x_log10()+
  facet_wrap(~year)


ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+
  geom_point()+
  geom_smooth(method="lm")+
  scale_x_log10()+
  facet_wrap(~continent)

#to focus on a specific data point, example snapshot of the year 2007
filter(gapminder, year==2007)
ggplot(data=filter(gapminder,year==2007))+
  geom_bar(mapping = aes(x=continent))

#filter data by year and plot by country
#the term identity is a way of telling R that it should take the data source as is
filter(gapminder, year==2007, continent=="Oceania")
ggplot(data=filter(gapminder,year==2007, continent=="Oceania"))+
  geom_bar(mapping = aes(x=country, y=pop), stat="identity")

#replace continent by asia

filter(gapminder, year==2007, continent=="Oceania")
ggplot(data=filter(gapminder,year==2007, continent=="Asia"))+
  geom_col(mapping = aes(x=country, y=pop))

#flipping the coordinates

filter(gapminder, year==2007, continent=="Oceania")
ggplot(data=filter(gapminder,year==2007, continent=="Asia"))+
  geom_col(mapping = aes(x=country, y=pop))+
  coord_flip()


ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, col=continent))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)


ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, col=continent, size=pop/10^6))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)

#labeling
ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, col=continent, size=pop/10^6))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)+
  labs(title="Life Expectancy vs GDP per capital over time", subtitle="In the last 50 years, life expectancy has improved in most countries", caption="source:Gapminder foundation,gapminder.com")



ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, col=continent, size=pop/10^6))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)+
  labs(title="Life Expectancy vs GDP per capital over time", subtitle="In the last 50 years, life expectancy has improved in most countries", caption="source:Gapminder foundation,gapminder.com", 
x="GDP per capital, in 000 USD",
y="Life expectancy in years",
color="continent",
size="population, in millions")


#saving figures

ggsave("my_fancy_plot.png")


#data frame manipulation with dplyr
#use the dplyr to manipulate dataframe
#use select()to choose variables from data frame
#Use filter() to choose data based on values

gapminder<-read.csv("Data/gapminder-FiveYearData.csv")
#pipe comcept"|"

rep(" this is an example", times=3)


"this is an example"%>% rep(times=3)

year_country_gdp<-select(gapminder, year, country, gdpPercap)

year_country_gdp

year_country_gdp<-gapminder%>%select(year, country, gdpPercap)

head(year_country_gdp)

gapminder%>%
  filter(year==2002)%>%
  ggplot(mapping=aes(x=continent,y=pop))+
  geom_boxplot()


year_country_gdp_euro<-gapminder%>%
  filter(continent=="Europe") %>%
  select(year, country, gdpPercap)
head(year_country_gdp_euro)


country_lifeExp_Norway<-gapminder%>%
  filter(country=="Norway")%>%
  select(year,lifeExp,gdpPercap)


head(country_lifeExp_Norway)

gapminder%>%
  group_by(continent)


gapminder%>%
  group_by(continent)%>%
  summarize(mean_gdpPercap=mean(gdpPercap))

gapminder%>%
  summarize(mean_gdpPercap=mean(gdpPercap))

#pending code for challenge 1 of piping
gapminder%>%
  group_by(continent)%>%
  summarize(mean_gdpPercap=mean_gdpPercap)

#challenge nr2
#calculate the average life expectancy per countr in asia.
#Which has the longest and which has the shortest

gapminder%>%
  filter(continent=="Asia")%>%
  group_by(country)%>%
  summarize(mean_lifeExp=mean(lifeExp))%>%
 ggplot(mapping = aes(y=country,x=mean_lifeExp))+
  geom_point()+
  order()


gapminder%>%
  mutate(gdp_billion=gdpPercap*pop/10^9)%>%
  head()

gapminder%>%
  mutate(gdp_billion=gdpPercap*pop/10^9)%>%
  group_by(continent,year)%>%
  summarize(mean_gdp_billion=mean(gdp_billion))


#load a library called maps
#this is to show the average life expectancy per country on a map scale

gapminder_country_summary<- gapminder%>%
    group_by(country)%>%
  summarize(mean_lifeExp=mean(lifeExp))

library(maps)
map_data("world")%>%
rename(country=region)%>%
 left_join(gapminder_country_summary, by="country")%>%
  ggplot()+
  geom_polygon(aes(x=long, y=lat, group=group,fill=mean_lifeExp))+
  scale_fill_gradient(low = "blue", high = "red")+
  coord_equal()


download.file(url = c("http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0TAlJeCEzcGQ&output=xlsx", 
                      "http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0NpF2PTov2Cw&output=xlsx"), 
              destfile = c("Data/indicator undata total_fertility.xlsx", 
                           "Data/indicator gapminder infant_mortality.xlsx"))
