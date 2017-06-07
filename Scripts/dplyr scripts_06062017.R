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

library(tidy)
download.file(url = c("http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0TAlJeCEzcGQ&output=xlsx", 
                      "http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0NpF2PTov2Cw&output=xlsx"), 
              destfile = c("Data/indicator undata total_fertility.xlsx", 
                           "Data/indicator gapminder infant_mortality.xlsx"))