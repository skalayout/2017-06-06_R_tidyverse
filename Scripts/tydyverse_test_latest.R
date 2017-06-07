library("readxl")

raw_fert <- read_excel(path="Data/indicator undata total_fertility.xlsx",sheet="Data")
raw_infantMort <- read_excel(path="Data/indicator gapminder infant_mortality.xlsx",sheet="Data")

gapminder
raw_fert

fert<-raw_fert%>%
  rename(country=`Total fertility rate`)%>%
  gather(key=year,value=fert, -country)%>%
  mutate(years=as.integer(year))
fert


