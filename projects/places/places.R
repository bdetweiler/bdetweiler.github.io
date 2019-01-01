library(tidyverse)
library(XML)
library(RCurl)
library(rlist)
#### XXX: This code is total spaghetti. Sorry, it got a little messy. :/

nullSafe <- function(x) {
  if (!exists(deparse(substitute(x))) || is.null(x)) {
    return(NA)
  } else {
    return(x)
  }
}

getStateFull <- function(state) {
  if (state == 'AL') {
    return('Alabama')
  } else if (state == 'AK') {
    return ('Alaska')
  } else if (state == 'AZ') {
    return ('Arizona')
  } else if (state == 'AR') {
    return ('Arkansas')
  } else if (state == 'CA') {
    return ('California')
  } else if (state == 'CO') {
    return ('Colorado')
  } else if (state == 'CT') {
    return ('Connecticut')
  } else if (state == 'DE') {
    return ('Delaware')
  } else if (state == 'DC') {
    return ('D.C.')
  } else if (state == 'FL') {
    return ('Florida')
  } else if (state == 'GA') {
    return ('Georgia')
  } else if (state == 'HI') {
    return ('Hawaii')
  } else if (state == 'ID') {
    return ('Idaho')
  } else if (state == 'IL') {
    return ('Illinois')
  } else if (state == 'IN') {
    return ('Indiana')
  } else if (state == 'IA') {
    return ('Iowa')
  } else if (state == 'KS') {
    return ('Kansas')
  } else if (state == 'KY') {
    return ('Kentucky')
  } else if (state == 'LA') {
    return ('Louisiana')
  } else if (state == 'ME') {
    return ('Maine')
  } else if (state == 'MD') {
    return ('Maryland')
  } else if (state == 'MA') {	
    return ('Massachusetts')
  } else if (state == 'MI') {
    return ('Michigan')
  } else if (state == 'MN') {
    return ('Minnesota')
  } else if (state == 'MS') {
    return ('Mississippi')
  } else if (state == 'MO') {
    return ('Missouri')
  } else if (state == 'MT') {
    return ('Montana')
  } else if (state == 'NE') {
    return ('Nebraska')
  } else if (state == 'NV') {
    return ('Nevada')
  } else if (state == 'NH') { 		
    return ('New Hampshire')
  } else if (state == 'NJ') {
    return ('New Jersey')
  } else if (state == 'NM') {
    return ('New Mexico')
  } else if (state == 'NY') {
    return ('New York')
  } else if (state == 'NC') {		
    return ('North Carolina')
  } else if (state == 'ND') {
    return ('North Dakota')
  } else if (state == 'OH') {
    return ('Ohio')
  } else if (state == 'OK') {	
    return ('Oklahoma')
  } else if (state == 'OR') {
    return ('Oregon')
  } else if (state == 'PA') {		
    return ('Pennsylvania')
  } else if (state == 'RI') {
    return ('Rhode Island')
  } else if (state == 'SC') {
    return ('South Carolina')
  } else if (state == 'SD') {
    return ('South Dakota')
  } else if (state == 'TN') {
    return ('Tennessee')
  } else if (state == 'TX') {		
    return ('Texas')
  } else if (state == 'UT') {
    return ('Utah')
  } else if (state == 'VT') {
    return ('Vermont')
  } else if (state == 'VA') {
    return ('Virginia')
  } else if (state == 'WA') {
    return ('Washington')
  } else if (state == 'WV') {
    return ('West Virginia')
  } else if (state == 'WI') {
    return ('Wisconsin')
  } else if (state == 'WY') {
    return ('Wyoming')
  }
}

getStateAbbr <- function(state) {
  if (state == 'Alabama') {
    return('AL')
  } else if (state == 'Alaska') {
    return ('AK')
  } else if (state == 'Arizona') {
    return ('AZ')
  } else if (state == 'Arkansas') {
    return ('AR')
  } else if (state == 'California') {
    return ('CA')
  } else if (state == 'Colorado') {
    return ('CO')
  } else if (state == 'Connecticut') {
    return ('CT')
  } else if (state == 'Delaware') {
    return ('DE')
  } else if (state == 'District of Columbia' || state == 'D.C.') {	
    return ('DC')
  } else if (state == 'Florida') {
    return ('FL')
  } else if (state == 'Georgia') {
    return ('GA')
  } else if (state == 'Hawaii') {
    return ('HI')
  } else if (state == 'Idaho') {
    return ('ID')
  } else if (state == 'Illinois') {
    return ('IL')
  } else if (state == 'Indiana') {
    return ('IN')
  } else if (state == 'Iowa') {
    return ('IA')
  } else if (state == 'Kansas') {
    return ('KS')
  } else if (state == 'Kentucky') {
    return ('KY')
  } else if (state == 'Louisiana') {
    return ('LA')
  } else if (state == 'Maine') {
    return ('ME')
  } else if (state == 'Maryland') {
    return ('MD')
  } else if (state == 'Massachusetts') {	
    return ('MA')
  } else if (state == 'Michigan') {
    return ('MI')
  } else if (state == 'Minnesota') {
    return ('MN')
  } else if (state == 'Mississippi') {
    return ('MS')
  } else if (state == 'Missouri') {
    return ('MO')
  } else if (state == 'Montana') {
    return ('MT')
  } else if (state == 'Nebraska') {
    return ('NE')
  } else if (state == 'Nevada') {
    return ('NV')
  } else if (state == 'New Hampshire') { 		
    return ('NH')
  } else if (state == 'New Jersey') {
    return ('NJ')
  } else if (state == 'New Mexico') {
    return ('NM')
  } else if (state == 'New York') {
    return ('NY')
  } else if (state == 'North Carolina') {		
    return ('NC')
  } else if (state == 'North Dakota') {
    return ('ND')
  } else if (state == 'Ohio') {
    return ('OH')
  } else if (state == 'Oklahoma') {	
    return ('OK')
  } else if (state == 'Oregon') {
    return ('OR')
  } else if (state == 'Pennsylvania') {		
    return ('PA')
  } else if (state == 'Rhode Island') {
    return ('RI')
  } else if (state == 'South Carolina') {
    return ('SC')
  } else if (state == 'South Dakota') {
    return ('SD')
  } else if (state == 'Tennessee') {
    return ('TN')
  } else if (state == 'Texas') {		
    return ('TX')
  } else if (state == 'Utah') {
    return ('UT')
  } else if (state == 'Vermont') {
    return ('VT')
  } else if (state == 'Virginia') {
    return ('VA')
  } else if (state == 'Washington') {
    return ('WA')
  } else if (state == 'West Virginia') {
    return ('WV')
  } else if (state == 'Wisconsin') {
    return ('WI')
  } else if (state == 'Wyoming') {
    return ('WY')
  }
}

proper <- function(x) {
  return(gsub("(?<=\\b)([a-z])", "\\U\\1", tolower(x), perl=TRUE))
}

cities.df <- read_csv('bdetweiler.github.io/projects/places/cities.csv')

places.df <- read_csv('bdetweiler.github.io/projects/places/merge.csv')

climate <- xmlParse('bdetweiler.github.io/projects/places/citylinks/climate.txt')

climate.list <- xmlToList(climate)

climate.df <- tibble(city=NA, 
                         state=NA,
                         high.jan=NA,
                         high.feb=NA,
                         high.mar=NA,
                         high.apr=NA,
                         high.may=NA,
                         high.jun=NA,
                         high.jul=NA,
                         high.aug=NA,
                         high.sep=NA,
                         high.oct=NA,
                         high.nov=NA,
                         high.dec=NA,
                         low.jan=NA,
                         low.feb=NA,
                         low.mar=NA,
                         low.apr=NA,
                         low.may=NA,
                         low.jun=NA,
                         low.jul=NA,
                         low.aug=NA,
                         low.sep=NA,
                         low.oct=NA,
                         low.nov=NA,
                         low.dec=NA,
                         avg.precip.jan=NA,
                         avg.precip.feb=NA,
                         avg.precip.mar=NA,
                         avg.precip.apr=NA,
                         avg.precip.may=NA,
                         avg.precip.jun=NA,
                         avg.precip.jul=NA,
                         avg.precip.aug=NA,
                         avg.precip.sep=NA,
                         avg.precip.oct=NA,
                         avg.precip.nov=NA,
                         avg.precip.dec=NA,
                         days.precip.jan=NA,
                         days.precip.feb=NA,
                         days.precip.mar=NA,
                         days.precip.apr=NA,
                         days.precip.may=NA,
                         days.precip.jun=NA,
                         days.precip.jul=NA,
                         days.precip.aug=NA,
                         days.precip.sep=NA,
                         days.precip.oct=NA,
                         days.precip.nov=NA,
                         days.precip.dec=NA,
                         hours.sun.jan=NA,
                         hours.sun.feb=NA,
                         hours.sun.mar=NA,
                         hours.sun.apr=NA,
                         hours.sun.may=NA,
                         hours.sun.jun=NA,
                         hours.sun.jul=NA,
                         hours.sun.aug=NA,
                         hours.sun.sep=NA,
                         hours.sun.oct=NA,
                         hours.sun.nov=NA,
                         hours.sun.dec=NA,
                         snow.jan=NA,
                         snow.feb=NA,
                         snow.mar=NA,
                         snow.apr=NA,
                         snow.may=NA,
                         snow.jun=NA,
                         snow.jul=NA,
                         snow.aug=NA,
                         snow.sep=NA,
                         snow.oct=NA,
                         snow.nov=NA,
                         snow.dec=NA)

climate.df

for (i in 1:length(climate.list)) {
  city <- gsub(climate.list[i]$entry$city[1], pattern = '(.*),(.*)', replacement = '\\1')
  state <- trimws(gsub(climate.list[i]$entry$city[1], pattern = '(.*),(.*)', replacement = '\\2'))
  
  print(paste0(city, ', ', state))
  
  high.jan <- climate.list[i]$entry$high_jan[1]
  high.feb <- climate.list[i]$entry$high_feb[1]
  high.mar <- climate.list[i]$entry$high_mar[1]
  high.apr <- climate.list[i]$entry$high_apr[1]
  high.may <- climate.list[i]$entry$high_may[1]
  high.jun <- climate.list[i]$entry$high_jun[1]
  high.jul <- climate.list[i]$entry$high_jul[1]
  high.aug <- climate.list[i]$entry$high_aug[1]
  high.sep <- climate.list[i]$entry$high_sep[1]
  high.oct <- climate.list[i]$entry$high_oct[1]
  high.nov <- climate.list[i]$entry$high_nov[1]
  high.dec <- climate.list[i]$entry$high_dec[1]
  
  low.jan <- climate.list[i]$entry$low_jan[1]
  low.feb <- climate.list[i]$entry$low_feb[1]
  low.mar <- climate.list[i]$entry$low_mar[1]
  low.apr <- climate.list[i]$entry$low_apr[1]
  low.may <- climate.list[i]$entry$low_may[1]
  low.jun <- climate.list[i]$entry$low_jun[1]
  low.jul <- climate.list[i]$entry$low_jul[1]
  low.aug <- climate.list[i]$entry$low_aug[1]
  low.sep <- climate.list[i]$entry$low_sep[1]
  low.oct <- climate.list[i]$entry$low_oct[1]
  low.nov <- climate.list[i]$entry$low_nov[1]
  low.dec <- climate.list[i]$entry$low_dec[1]
  
  avg.precip.jan <- climate.list[i]$entry$avg_precip_jan[1]
  avg.precip.feb <- climate.list[i]$entry$avg_precip_feb[1]
  avg.precip.mar <- climate.list[i]$entry$avg_precip_mar[1]
  avg.precip.apr <- climate.list[i]$entry$avg_precip_apr[1]
  avg.precip.may <- climate.list[i]$entry$avg_precip_may[1]
  avg.precip.jun <- climate.list[i]$entry$avg_precip_jun[1]
  avg.precip.jul <- climate.list[i]$entry$avg_precip_jul[1]
  avg.precip.aug <- climate.list[i]$entry$avg_precip_aug[1]
  avg.precip.sep <- climate.list[i]$entry$avg_precip_sep[1]
  avg.precip.oct <- climate.list[i]$entry$avg_precip_oct[1]
  avg.precip.nov <- climate.list[i]$entry$avg_precip_nov[1]
  avg.precip.dec <- climate.list[i]$entry$avg_precip_dec[1]
  
  days.precip.jan <- climate.list[i]$entry$days_precip_jan[1]
  days.precip.feb <- climate.list[i]$entry$days_precip_feb[1]
  days.precip.mar <- climate.list[i]$entry$days_precip_mar[1]
  days.precip.apr <- climate.list[i]$entry$days_precip_apr[1]
  days.precip.may <- climate.list[i]$entry$days_precip_may[1]
  days.precip.jun <- climate.list[i]$entry$days_precip_jun[1]
  days.precip.jul <- climate.list[i]$entry$days_precip_jul[1]
  days.precip.aug <- climate.list[i]$entry$days_precip_aug[1]
  days.precip.sep <- climate.list[i]$entry$days_precip_sep[1]
  days.precip.oct <- climate.list[i]$entry$days_precip_oct[1]
  days.precip.nov <- climate.list[i]$entry$days_precip_nov[1]
  days.precip.dec <- climate.list[i]$entry$days_precip_dec[1]
  
  hours.sun.jan <- climate.list[i]$entry$hours_sun_jan[1]
  hours.sun.feb <- climate.list[i]$entry$hours_sun_feb[1]
  hours.sun.mar <- climate.list[i]$entry$hours_sun_mar[1]
  hours.sun.apr <- climate.list[i]$entry$hours_sun_apr[1]
  hours.sun.may <- climate.list[i]$entry$hours_sun_may[1]
  hours.sun.jun <- climate.list[i]$entry$hours_sun_jun[1]
  hours.sun.jul <- climate.list[i]$entry$hours_sun_jul[1]
  hours.sun.aug <- climate.list[i]$entry$hours_sun_aug[1]
  hours.sun.sep <- climate.list[i]$entry$hours_sun_sep[1]
  hours.sun.oct <- climate.list[i]$entry$hours_sun_oct[1]
  hours.sun.nov <- climate.list[i]$entry$hours_sun_nov[1]
  hours.sun.dec <- climate.list[i]$entry$hours_sun_dec[1]
  
  snow.jan <- climate.list[i]$entry$snow_jan[1]
  snow.feb <- climate.list[i]$entry$snow_feb[1]
  snow.mar <- climate.list[i]$entry$snow_mar[1]
  snow.apr <- climate.list[i]$entry$snow_apr[1]
  snow.may <- climate.list[i]$entry$snow_may[1]
  snow.jun <- climate.list[i]$entry$snow_jun[1]
  snow.jul <- climate.list[i]$entry$snow_jul[1]
  snow.aug <- climate.list[i]$entry$snow_aug[1]
  snow.sep <- climate.list[i]$entry$snow_sep[1]
  snow.oct <- climate.list[i]$entry$snow_oct[1]
  snow.nov <- climate.list[i]$entry$snow_nov[1]
  snow.dec <- climate.list[i]$entry$snow_dec[1]
  
  climate.df <- add_row(climate.df,
                        city = nullSafe(city),
                        state = nullSafe(state),
  
                        high.jan = nullSafe(high.jan),
                        high.feb = nullSafe(high.feb),
                        high.mar = nullSafe(high.mar),
                        high.apr = nullSafe(high.apr),
                        high.may = nullSafe(high.may),
                        high.jun = nullSafe(high.jun),
                        high.jul = nullSafe(high.jul),
                        high.aug = nullSafe(high.aug),
                        high.sep = nullSafe(high.sep),
                        high.oct = nullSafe(high.oct),
                        high.nov = nullSafe(high.nov),
                        high.dec = nullSafe(high.dec),
                        
                        low.jan = nullSafe(low.jan),
                        low.feb = nullSafe(low.feb),
                        low.mar = nullSafe(low.mar),
                        low.apr = nullSafe(low.apr),
                        low.may = nullSafe(low.may),
                        low.jun = nullSafe(low.jun),
                        low.jul = nullSafe(low.jul),
                        low.aug = nullSafe(low.aug),
                        low.sep = nullSafe(low.sep),
                        low.oct = nullSafe(low.oct),
                        low.nov = nullSafe(low.nov),
                        low.dec = nullSafe(low.dec),
                        
                        avg.precip.jan = nullSafe(avg.precip.jan),
                        avg.precip.feb = nullSafe(avg.precip.feb),
                        avg.precip.mar = nullSafe(avg.precip.mar),
                        avg.precip.apr = nullSafe(avg.precip.apr),
                        avg.precip.may = nullSafe(avg.precip.may),
                        avg.precip.jun = nullSafe(avg.precip.jun),
                        avg.precip.jul = nullSafe(avg.precip.jul),
                        avg.precip.aug = nullSafe(avg.precip.aug),
                        avg.precip.sep = nullSafe(avg.precip.sep),
                        avg.precip.oct = nullSafe(avg.precip.oct),
                        avg.precip.nov = nullSafe(avg.precip.nov),
                        avg.precip.dec = nullSafe(avg.precip.dec),
                        
                        days.precip.jan = nullSafe(days.precip.jan),
                        days.precip.feb = nullSafe(days.precip.feb),
                        days.precip.mar = nullSafe(days.precip.mar),
                        days.precip.apr = nullSafe(days.precip.apr),
                        days.precip.may = nullSafe(days.precip.may),
                        days.precip.jun = nullSafe(days.precip.jun),
                        days.precip.jul = nullSafe(days.precip.jul),
                        days.precip.aug = nullSafe(days.precip.aug),
                        days.precip.sep = nullSafe(days.precip.sep),
                        days.precip.oct = nullSafe(days.precip.oct),
                        days.precip.nov = nullSafe(days.precip.nov),
                        days.precip.dec = nullSafe(days.precip.dec),
                       
                        hours.sun.jan = nullSafe(hours.sun.jan),
                        hours.sun.feb = nullSafe(hours.sun.feb),
                        hours.sun.mar = nullSafe(hours.sun.mar),
                        hours.sun.apr = nullSafe(hours.sun.apr),
                        hours.sun.may = nullSafe(hours.sun.may),
                        hours.sun.jun = nullSafe(hours.sun.jun),
                        hours.sun.jul = nullSafe(hours.sun.jul),
                        hours.sun.aug = nullSafe(hours.sun.aug),
                        hours.sun.sep = nullSafe(hours.sun.sep),
                        hours.sun.oct = nullSafe(hours.sun.oct),
                        hours.sun.nov = nullSafe(hours.sun.nov),
                        hours.sun.dec = nullSafe(hours.sun.dec),
                        
                        snow.jan = nullSafe(snow.jan),
                        snow.feb = nullSafe(snow.feb),
                        snow.mar = nullSafe(snow.mar),
                        snow.apr = nullSafe(snow.apr),
                        snow.may = nullSafe(snow.may),
                        snow.jun = nullSafe(snow.jun),
                        snow.jul = nullSafe(snow.jul),
                        snow.aug = nullSafe(snow.aug),
                        snow.sep = nullSafe(snow.sep),
                        snow.oct = nullSafe(snow.oct),
                        snow.nov = nullSafe(snow.nov),
                        snow.dec = nullSafe(snow.dec))
    
}

# Remove NA row
climate.df <- climate.df[-1,]
write_csv(climate.df, path = 'bdetweiler.github.io/projects/places/climate.csv')


# Weather averages
weather <- xmlParse('bdetweiler.github.io/projects/places/citylinks/weather.txt')
weather.list <- xmlToList(weather)

weather.df <- tibble(city=NA, 
                     state=NA,
                     annual.high=NA,
                     annual.low=NA,
                     avg.tmp=NA,
                     avg.annual.precip=NA,
                     annual.days.precip=NA,
                     annual.hours.sunshine=NA,
                     avg.snowfall=NA)
weather.df

for (i in 1:length(weather.list)) {
  city <- weather.list[i]$element$city[1]
  state <- weather.list[i]$element$state[1]
  
  print(paste0(city, ', ', state))
  
  annual.high <- weather.list[i]$element$annual_high[1]
  annual.low <- weather.list[i]$element$annual_low[1]
  avg.tmp <- weather.list[i]$element$avg_tmp[1]
  avg.annual.precip <- weather.list[i]$element$avg_annual_precip[1]
  annual.days.precip <- weather.list[i]$element$annual_days_precip[1]
  annual.hours.sunshine <- weather.list[i]$element$annual_hours_sunshine[1]
  avg.snowfall <- weather.list[i]$element$avg_snowfall[1]
  
  weather.df <- add_row(weather.df,
                        city = nullSafe(city),
                        state = nullSafe(state),
                        annual.high = nullSafe(annual.high),
                        annual.low = nullSafe(annual.low),
                        avg.tmp = nullSafe(avg.tmp),
                        avg.annual.precip = nullSafe(avg.annual.precip),
                        annual.days.precip = nullSafe(annual.days.precip),
                        annual.hours.sunshine = nullSafe(annual.hours.sunshine),
                        avg.snowfall = nullSafe(avg.snowfall))
}

weather.df <- weather.df[-1,]
weather.df

write_csv(weather.df, path = 'bdetweiler.github.io/projects/places/weather.csv')

####################

merged.df <- read_csv(file='bdetweiler.github.io/projects/places/merge.csv')

merged2.df <- merged.df %>% 
  mutate(key = proper(gsub("-", " ", gsub(pattern = 'https://www.usclimatedata.com/climate/(.*)/(.*)/united-states/.*', replacement = '\\1, \\2', x = Climate.URL))))

climate.df <- add_column(climate.df, key=paste0(climate.df$city, ", ",climate.df$state))
weather.df <- add_column(weather.df, key=paste0(weather.df$city, ", ", weather.df$state))

merged2.df$key %>% sort()
climate.df$key %>% sort()
new.merged.df <- left_join(merged2.df, climate.df, by="key", suffix=c('.x', '.y'))
final.merged.df <- left_join(new.merged.df, weather.df, by="key")

write_csv(final.merged.df, 'bdetweiler.github.io/projects/places/merge-ii.csv', na = '')

final.merged.df <- read_csv('bdetweiler.github.io/projects/places/merge-ii.csv')

final.merged.df <- final.merged.df %>% mutate(State.Abbr = unlist(lapply(final.merged.df$State, FUN = getStateAbbr)))


####### Get walk score
walkscore.URL <- 'https://www.walkscore.com'


walk.scores <- c()
bike.scores <- c()
transit.scores <- c()

for (i in 1:nrow(final.merged.df)) {
  
  print(paste0(final.merged.df[i,]$City, ', ', final.merged.df[i,]$State.Abbr)) 
  url.to.get <- paste0(walkscore.URL, '/', final.merged.df[i,]$State.Abbr, '/', gsub(' ', '_', final.merged.df[i,]$City, 'ALL')) 
  print(url.to.get)
  theurl <- getURL(url.to.get, .opts = list(ssl.verifypeer = FALSE) )

  walk.score <- 0
  bike.score <- 0
  transit.score <- 0
  
  if (sum(grep('^.*walk/score/([0-9]*)\\.png.*$', theurl) > 0) > 0) {
    walk.score <- as.integer(gsub('^.*walk/score/([0-9]*)\\.png.*$', '\\1', theurl))
  }
  print(paste0('walk.score: ', walk.score))
  walk.scores <- c(walk.scores, walk.score)
  
  if (sum(grep('^.*bike/score/([0-9]*)\\.png.*$', theurl) > 0) > 0) {
    bike.score <- as.integer(gsub('^.*bike/score/([0-9]*)\\.png.*$', '\\1', theurl))
  }
  print(paste0('bike.score: ', bike.score))
  bike.scores <- c(bike.scores, bike.score)
  
  if (sum(grep('^.*transit/score/([0-9]*)\\.png.*$', theurl) > 0) > 0) {
    transit.score <- as.integer(gsub('^.*transit/score/([0-9]*)\\.png.*$', '\\1', theurl))
  }
  print(paste0('transit.score: ', transit.score))
  transit.scores <- c(transit.scores, transit.score)

  Sys.sleep(as.integer(runif(1, 3, 10)))
}

final.df <- final.merged.df %>% 
  add_column(walk.score=walk.scores) %>%
  add_column(bike.score=bike.scores) %>%
  add_column(transit.score=transit.scores) 

write_csv(final.df, 'bdetweiler.github.io/projects/places/final.csv')

final.df <- read_csv('bdetweiler.github.io/projects/places/final.csv')


areavibes.URL <- 'https://www.areavibes.com/'
median.ages <- c()
mf.ratios <- c()
married.percentages <- c()
families.percentages <- c()

### Get Demographics
for (i in 1:nrow(final.df)) {
  
  print(paste0(final.df[i,]$City, ', ', final.df[i,]$State.Abbr)) 
  
  url.to.get <- paste0(areavibes.URL, gsub(' ', '+', tolower(final.df[i,]$City), 'ALL'), '-', tolower(final.df[i,]$State.Abbr), '/demographics/')
  
  print(url.to.get)
  
  theurl <- getURL(url.to.get, .opts = list(ssl.verifypeer = FALSE))

  median.age <- 0
  mf.ratio <- 0
  married <- 0
  families <- 0

  if (sum(grep('^.*Median age</td><td>[0-9.]*</td>.*$', theurl) > 0) > 0) {
    median.age <- as.double(gsub('^.*Median age</td><td>([0-9.]*)</td>.*$', '\\1', theurl))
  }
  
  print(paste0('median.age: ', median.age))
  
  median.ages <- c(median.ages, median.age)
  
  if (sum(grep('^.*Male/Female ratio</td><td>[0-9.:]*</td>.*$', theurl) > 0) > 0) {
    mf.ratio <- as.double(gsub('^.*Male/Female ratio</td><td>([0-9.]*):1</td>.*$', '\\1', theurl))
  }
  
  print(paste0('mf.ratio: ', mf.ratio))
  
  mf.ratios <- c(mf.ratios, mf.ratio)
 
  if (sum(grep('^.*Married <small>\\(15yrs &amp; older\\)</small></td><td>[0-9%]*.*$', theurl) > 0) > 0) {
    married <- gsub('^.*Married <small>\\(15yrs &amp; older\\)</small></td><td>([0-9%]*).*$', '\\1', theurl)
    married <- as.double(gsub('([0-9]*)%', '0.\\1', married))
  }
  
  print(paste0('married: ', married))
  
  married.percentages <- c(married.percentages, married)
  
  if (sum(grep('^.*Families w/ Kids under 18</td><td>[0-9%]*.*$', theurl) > 0) > 0) {
    families <- gsub('^.*Families w/ Kids under 18</td><td>([0-9%]*).*$', '\\1', theurl)
    families
    families <- as.double(gsub('([0-9]*)%', '0.\\1', families))
  }
  
  print(paste0('families: ', families))
  
  families.percentages <- c(families.percentages, families)

  Sys.sleep(as.integer(runif(1, 3, 10)))
}


final.demo.df <- final.df %>% 
  add_column(median.age=median.ages) %>%
  add_column(mf.ratio=mf.ratios) %>%
  add_column(married=married.percentages) %>%
  add_column(families=families.percentages) 

write_csv(final.demo.df, 'bdetweiler.github.io/projects/places/final.demo.csv')

final.demo.df <- read_csv('bdetweiler.github.io/projects/places/final.demo.csv')


areavibes.URL <- 'https://www.areavibes.com/'
cost.of.living.list <- c()

### Get Cost of Living
for (i in 1:nrow(final.df)) {

  print(paste0(final.df[i,]$City, ', ', final.df[i,]$State.Abbr)) 
  
  url.to.get <- paste0(areavibes.URL, gsub(' ', '+', tolower(final.df[i,]$City), 'ALL'), '-', tolower(final.df[i,]$State.Abbr), '/cost-of-living/')
  
  print(url.to.get)
  
  theurl <- getURL(url.to.get, .opts = list(ssl.verifypeer = FALSE))

  cost.of.living <- 0

  if (sum(grep('^.*Cost of living index</a></td><td>[0-9]*</td>.*$', theurl) > 0) > 0) {
    cost.of.living <- as.double(gsub('^.*Cost of living index</a></td><td>([0-9]*)</td>.*$', '\\1', theurl))
  }
  
  print(paste0('cost.of.living: ', cost.of.living))
  
  cost.of.living.list <- c(cost.of.living.list, cost.of.living)

  Sys.sleep(as.integer(runif(1, 3, 10)))
}


final.cost.of.living.df <- final.demo.df %>% 
  add_column(cost.of.living=cost.of.living.list)

write_csv(final.cost.of.living.df, 'bdetweiler.github.io/projects/places/final.cost.of.living.csv')

final.cost.of.living.df <- read_csv('bdetweiler.github.io/projects/places/final.cost.of.living.csv')

areavibes.URL <- 'https://www.areavibes.com/'
crime.list <- c()

### Get Crime Rate
for (i in 1:nrow(final.df)) {
  
  print(paste0(final.df[i,]$City, ', ', final.df[i,]$State.Abbr)) 
  
  url.to.get <- paste0(areavibes.URL, gsub(' ', '+', tolower(final.df[i,]$City), 'ALL'), '-', tolower(final.df[i,]$State.Abbr), '/crime/')
  
  print(url.to.get)
  
  theurl <- getURL(url.to.get, .opts = list(ssl.verifypeer = FALSE))

  crime <- 0
  
  if (sum(grep('^.*\\(estimate\\)</small></td><td>[0-9,]*.*Reported.*$', theurl) > 0) > 0) {
    crime <- as.double(gsub(',', '', gsub('^.*\\(estimate\\)</small></td><td>([0-9,]*).*Reported.*$', '\\1', theurl)))
  }

  print(paste0('crime: ', crime))
  
  crime.list <- c(crime.list, crime)

  Sys.sleep(as.integer(runif(1, 3, 5)))
}


final.crime.df <- final.cost.of.living.df %>% 
  add_column(crime=crime.list)

write_csv(final.crime.df, 'bdetweiler.github.io/projects/places/final.crime.csv')

final.crime.df <- read_csv('bdetweiler.github.io/projects/places/final.crime.csv')
final.df <- final.crime.df


# We're missing a bunch of weather data, so let's fill it in with Area Vibes

areavibes.URL <- 'https://www.areavibes.com/'
jan.avg.list <- c()
feb.avg.list <- c()
mar.avg.list <- c()
apr.avg.list <- c()
may.avg.list <- c()
jun.avg.list <- c()
jul.avg.list <- c()
aug.avg.list <- c()
sep.avg.list <- c()
oct.avg.list <- c()
nov.avg.list <- c()
dec.avg.list <- c()

jan.precip.list <- c()
feb.precip.list <- c()
mar.precip.list <- c()
apr.precip.list <- c()
may.precip.list <- c()
jun.precip.list <- c()
jul.precip.list <- c()
aug.precip.list <- c()
sep.precip.list <- c()
oct.precip.list <- c()
nov.precip.list <- c()
dec.precip.list <- c()

air.quality.list <- c()

### Get Crime Rate
for (i in 1:nrow(final.df)) {
  
  print(paste0(final.df[i,]$City, ', ', final.df[i,]$State.Abbr)) 
  
  url.to.get <- paste0(areavibes.URL, gsub(' ', '+', tolower(final.df[i,]$City), 'ALL'), '-', tolower(final.df[i,]$State.Abbr), '/weather/')
  
  print(url.to.get)
  
  theurl <- getURL(url.to.get, .opts = list(ssl.verifypeer = FALSE))

  jan.avg <- NA
  feb.avg <- NA
  mar.avg <- NA
  apr.avg <- NA
  may.avg <- NA
  jun.avg <- NA
  jul.avg <- NA
  aug.avg <- NA
  sep.avg <- NA
  oct.avg <- NA
  nov.avg <- NA
  dec.avg <- NA
  
  jan.precip <- NA
  feb.precip <- NA
  mar.precip <- NA
  apr.precip <- NA
  may.precip <- NA
  jun.precip <- NA
  jul.precip <- NA
  aug.precip <- NA
  sep.precip <- NA
  oct.precip <- NA
  nov.precip <- NA
  dec.precip <- NA
  
  air.quality <- NA

  # Full disclosure: This was a mistake - It should have looked two more columns over for the Average temp. 
  # Instead, it is getting the Min temp. 
  
  if (sum(grep('^.*<td>January</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    jan.avg <- as.double(gsub(',', '', gsub('^.*<td>January</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>February</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    feb.avg <- as.double(gsub(',', '', gsub('^.*<td>February</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>March</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    mar.avg <- as.double(gsub(',', '', gsub('^.*<td>March</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>April</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    apr.avg <- as.double(gsub(',', '', gsub('^.*<td>April</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>May</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    may.avg <- as.double(gsub(',', '', gsub('^.*<td>May</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>June</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    jun.avg <- as.double(gsub(',', '', gsub('^.*<td>June</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>July</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    jul.avg <- as.double(gsub(',', '', gsub('^.*<td>July</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>August</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    aug.avg <- as.double(gsub(',', '', gsub('^.*<td>August</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>September</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    sep.avg <- as.double(gsub(',', '', gsub('^.*<td>September</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>October</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    oct.avg <- as.double(gsub(',', '', gsub('^.*<td>October</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>November</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    nov.avg <- as.double(gsub(',', '', gsub('^.*<td>November</td><td>([0-9.]*).*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>December</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    dec.avg <- as.double(gsub(',', '', gsub('^.*<td>December</td><td>([0-9.]*).*$', '\\1', theurl)))
  }

  print(paste0('jan.avg: ', jan.avg))
  print(paste0('feb.avg: ', feb.avg))
  print(paste0('mar.avg: ', mar.avg))
  print(paste0('apr.avg: ', apr.avg))
  print(paste0('may.avg: ', may.avg))
  print(paste0('jun.avg: ', jun.avg))
  print(paste0('jul.avg: ', jul.avg))
  print(paste0('aug.avg: ', aug.avg))
  print(paste0('sep.avg: ', sep.avg))
  print(paste0('oct.avg: ', oct.avg))
  print(paste0('nov.avg: ', nov.avg))
  print(paste0('dec.avg: ', dec.avg))
  
  if (sum(grep('^.*<td>January</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    jan.precip <- as.double(gsub(',', '', gsub('^.*<td>January</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Feb.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>February</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    feb.precip <- as.double(gsub(',', '', gsub('^.*<td>February</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Mar.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>March</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    mar.precip <- as.double(gsub(',', '', gsub('^.*<td>March</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Apr.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>April</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    apr.precip <- as.double(gsub(',', '', gsub('^.*<td>April</td>.*<td>([0-9.]*)\"</td></tr><tr><td>May.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>May</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    may.precip <- as.double(gsub(',', '', gsub('^.*<td>May</td>.*<td>([0-9.]*)\"</td></tr><tr><td>June.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>June</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    jun.precip <- as.double(gsub(',', '', gsub('^.*<td>June</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Jul.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>July</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    jul.precip <- as.double(gsub(',', '', gsub('^.*<td>July</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Aug.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>August</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    aug.precip <- as.double(gsub(',', '', gsub('^.*<td>August</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Sep.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>September</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    sep.precip <- as.double(gsub(',', '', gsub('^.*<td>September</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Oct.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>October</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    oct.precip <- as.double(gsub(',', '', gsub('^.*<td>October</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Nov.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>November</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    nov.precip <- as.double(gsub(',', '', gsub('^.*<td>November</td>.*<td>([0-9.]*)\"</td></tr><tr><td>Dec.*$', '\\1', theurl)))
  }
  if (sum(grep('^.*<td>December</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    dec.precip <- as.double(gsub(',', '', gsub('^.*<td>December</td>.*<td>([0-9.]*)\"</td></tr>.*$', '\\1', theurl)))
  }
  print(paste0('jan.precip: ', jan.precip))
  print(paste0('feb.precip: ', feb.precip))
  print(paste0('mar.precip: ', mar.precip))
  print(paste0('apr.precip: ', apr.precip))
  print(paste0('may.precip: ', may.precip))
  print(paste0('jun.precip: ', jun.precip))
  print(paste0('jul.precip: ', jul.precip))
  print(paste0('aug.precip: ', aug.precip))
  print(paste0('sep.precip: ', sep.precip))
  print(paste0('oct.precip: ', oct.precip))
  print(paste0('nov.precip: ', nov.precip))
  print(paste0('dec.precip: ', dec.precip))
 
  #<td>Air quality index</td><td>53</td> 
  if (sum(grep('^.*<td>Air quality index</td><td>[0-9]*.*$', theurl) > 0) > 0) {
    air.quality <- as.double(gsub(',', '', gsub('^.*<td>Air quality index</td><td>([0-9]*)</td>.*$', '\\1', theurl)))
  }
  print(paste0('air.quality: ', air.quality))
  
  jan.avg.list <- c(jan.avg.list, jan.avg)
  feb.avg.list <- c(feb.avg.list, feb.avg)
  mar.avg.list <- c(mar.avg.list, mar.avg)
  apr.avg.list <- c(apr.avg.list, apr.avg)
  may.avg.list <- c(may.avg.list, may.avg)
  jun.avg.list <- c(jun.avg.list, jun.avg)
  jul.avg.list <- c(jul.avg.list, jul.avg)
  aug.avg.list <- c(aug.avg.list, aug.avg)
  sep.avg.list <- c(sep.avg.list, sep.avg)
  oct.avg.list <- c(oct.avg.list, oct.avg)
  nov.avg.list <- c(nov.avg.list, nov.avg)
  dec.avg.list <- c(dec.avg.list, dec.avg)
  
  jan.precip.list <- c(jan.precip.list, jan.precip)
  feb.precip.list <- c(feb.precip.list, feb.precip)
  mar.precip.list <- c(mar.precip.list, mar.precip)
  apr.precip.list <- c(apr.precip.list, apr.precip)
  may.precip.list <- c(may.precip.list, may.precip)
  jun.precip.list <- c(jun.precip.list, jun.precip)
  jul.precip.list <- c(jul.precip.list, jul.precip)
  aug.precip.list <- c(aug.precip.list, aug.precip)
  sep.precip.list <- c(sep.precip.list, sep.precip)
  oct.precip.list <- c(oct.precip.list, oct.precip)
  nov.precip.list <- c(nov.precip.list, nov.precip)
  dec.precip.list <- c(dec.precip.list, dec.precip)
  
  air.quality.list <- c(air.quality.list, air.quality)
  
  Sys.sleep(as.integer(runif(1, 3, 5)))
}

final.weather.df <- final.crime.df %>%
  select(-Rank,
         -Census.2010,
         -Land.Area.2016.km2,
         -Population.Density.2016.km2,
         -Location.Lon,
         -Location.Lat,
         -Climate.URL,
         -city.x,
         -state.x,
         -high.jan,
         -high.feb,
         -high.mar,
         -high.apr,
         -high.may,
         -high.jun,
         -high.jul,
         -high.aug,
         -high.sep,
         -high.oct,
         -high.nov,
         -high.dec,
         -low.jan,
         -low.feb,
         -low.mar,
         -low.apr,
         -low.may,
         -low.jun,
         -low.jul,
         -low.aug,                     
         -low.sep,
         -low.oct,
         -low.nov,
         -low.dec,
         -avg.precip.jan,
         -avg.precip.feb,
         -avg.precip.mar,
         -avg.precip.apr,
         -avg.precip.may,
         -avg.precip.jun,
         -avg.precip.jul,
         -avg.precip.aug,
         -avg.precip.sep,
         -avg.precip.oct,
         -avg.precip.nov,
         -avg.precip.dec,
         -days.precip.jan,
         -days.precip.feb,
         -days.precip.mar,
         -days.precip.apr,
         -days.precip.may,
         -days.precip.jun,
         -days.precip.jul,
         -days.precip.aug,
         -days.precip.sep,
         -days.precip.oct,
         -days.precip.nov,
         -days.precip.dec,
         -hours.sun.jan,
         -hours.sun.feb,
         -hours.sun.mar,
         -hours.sun.apr,
         -hours.sun.may,
         -hours.sun.jun,
         -hours.sun.jul,
         -hours.sun.aug,
         -hours.sun.sep,
         -hours.sun.oct,
         -hours.sun.nov,
         -hours.sun.dec,
         -snow.jan,
         -snow.feb,
         -snow.mar,
         -snow.apr,
         -snow.may,
         -snow.jun,
         -snow.jul,
         -snow.aug,
         -snow.sep,
         -snow.oct,
         -snow.nov,
         -snow.dec,
         -city.y,
         -state.y,
         -annual.high,
         -annual.low,
         -avg.tmp,
         -avg.annual.precip,
         -annual.days.precip,
         -annual.hours.sunshine,
         -avg.snowfall
         -State.Abbr)

final.weather.df <- final.weather.df %>% 
  add_column(jan.avg=jan.avg.list) %>%
  add_column(feb.avg=feb.avg.list) %>%
  add_column(mar.avg=mar.avg.list) %>%
  add_column(apr.avg=apr.avg.list) %>%
  add_column(may.avg=may.avg.list) %>%
  add_column(jun.avg=jun.avg.list) %>%
  add_column(jul.avg=jul.avg.list) %>%
  add_column(aug.avg=aug.avg.list) %>%
  add_column(sep.avg=sep.avg.list) %>%
  add_column(oct.avg=oct.avg.list) %>%
  add_column(nov.avg=nov.avg.list) %>%
  add_column(dec.avg=dec.avg.list) %>%
  add_column(jan.precip=jan.precip.list) %>%
  add_column(feb.precip=feb.precip.list) %>%
  add_column(mar.precip=mar.precip.list) %>%
  add_column(apr.precip=apr.precip.list) %>%
  add_column(may.precip=may.precip.list) %>%
  add_column(jun.precip=jun.precip.list) %>%
  add_column(jul.precip=jul.precip.list) %>%
  add_column(aug.precip=aug.precip.list) %>%
  add_column(sep.precip=sep.precip.list) %>%
  add_column(oct.precip=oct.precip.list) %>%
  add_column(nov.precip=nov.precip.list) %>%
  add_column(dec.precip=dec.precip.list) %>%
  add_column(air.quality=air.quality.list)

  
write_csv(final.crime.df, 'bdetweiler.github.io/projects/places/final.weather.csv')

final.weather.df <- read_csv('bdetweiler.github.io/projects/places/final.weather.csv')

clean <- function(x) {
  gsub('[.;:\'"()]','',x)
}
# Get Loudwire listed concerts in last year 
wordCountSimple <- function(lines) {
  chunks <- strsplit(clean(lines),'\\s')
  words <- do.call(c, chunks)
  table(words)
}

concert.cities <- read_csv('bdetweiler.github.io/projects/places/concerts.csv')
concert.count.table <- wordCountSimple(paste0(gsub(' ', '_', concert.cities$City), ',', concert.cities$State))

city.names <- attr(concert.count.table, 'dimnames')
city.names <- gsub(',', ', ', gsub('_', ' ', city.names$words))
concert.freqs <- as.vector(concert.count.table)

concert.df <- tibble(City=NA, State=NA, Concert.Count=NA, key=NA)
for (i in 1:length(concert.freqs)) {
  city <- strsplit(city.names[i], ',')[[1]][1]
  state <- getStateFull(trimws(strsplit(city.names[i], ',')[[1]][2]))
  state
  print(city)
  print(state)
  concert.df <- add_row(concert.df, City=city, State=state, Concert.Count=concert.freqs[i], key=paste0(City, ', ', state))
}
final.concerts.df <- left_join(final.weather.df, concert.df, by="key", suffix=c('.x', '.y'))

write_csv(final.concerts.df, 'bdetweiler.github.io/projects/places/final.concerts.csv')

final.concerts.df <- read_csv('bdetweiler.github.io/projects/places/final.concerts.csv')
final.df <- final.concerts.df %>% select(-City.y, -State.y, -avg.snowfall, -State.Abbr, -key)
final.df <- final.df %>% select(city=City.x, 
                    state=State.x,
                    pop2017=Population.2017,
                    pop.change=Change,
                    area.sq.mi=Land.Area.2016.sqmi,
                    pop.density=Population.Density.2016.sqmi,
                    walk.score,
                    bike.score,
                    transit.score,
                    median.age,
                    mf.ratio,
                    married,
                    families,
                    cost.of.living,
                    crime,
                    concerts=Concert.Count,
                    jan.avg,
                    feb.avg,
                    mar.avg,
                    apr.avg,
                    may.avg,
                    jun.avg,
                    jul.avg,
                    aug.avg,
                    sep.avg,
                    oct.avg,
                    nov.avg,
                    dec.avg,
                    jan.precip,
                    feb.precip,
                    mar.precip,
                    apr.precip,
                    may.precip,
                    jun.precip,
                    jul.precip,
                    aug.precip,
                    sep.precip,
                    oct.precip,
                    nov.precip,
                    dec.precip,
                    air.quality)

# Fix missed values
final.df[which(final.df$city == 'Washington'),]$walk.score <- 53
final.df[which(final.df$city == 'Washington'),]$bike.score <- 99
final.df[which(final.df$city == 'Washington'),]$transit.score <- 67

final.df[which(final.df$city == 'Nashville'),]$walk.score <- 91
final.df[which(final.df$city == 'Nashville'),]$bike.score <- 61
final.df[which(final.df$city == 'Nashville'),]$transit.score <- 0

final.df[which(final.df$city == 'Louisville'),]$walk.score <- 96
final.df[which(final.df$city == 'Louisville'),]$bike.score <- 65
final.df[which(final.df$city == 'Louisville'),]$transit.score <- 74

final.df[which(final.df$city == 'Lexington'),]$walk.score <- 85
final.df[which(final.df$city == 'Lexington'),]$bike.score <- 85
final.df[which(final.df$city == 'Lexington'),]$transit.score <- 0
final.df[which(final.df$city == 'Lexington'),]$cost.of.living <- 95
final.df[which(final.df$city == 'Lexington'),]$crime <- 4133
final.df[which(final.df$city == 'Lexington'),]$mf.ratio <- 1.0
final.df[which(final.df$city == 'Lexington'),]$married <- 0.48
final.df[which(final.df$city == 'Lexington'),]$families <- 0.46
final.df[which(final.df$city == 'Lexington'),]$median.age <- 34.1
# Full disclosure: These are average temps. The data collected was Min temp. Therefore, there is a discrepency. However, I don't think
# I'm going to actually consider any of these cities so I'm just going to leave it as-is. 
final.df[which(final.df$city == 'Lexington'),]$jan.avg <- 34
final.df[which(final.df$city == 'Lexington'),]$feb.avg <- 35
final.df[which(final.df$city == 'Lexington'),]$mar.avg <- 46
final.df[which(final.df$city == 'Lexington'),]$apr.avg <- 57
final.df[which(final.df$city == 'Lexington'),]$may.avg <- 65
final.df[which(final.df$city == 'Lexington'),]$jun.avg <- 74
final.df[which(final.df$city == 'Lexington'),]$jul.avg <- 76
final.df[which(final.df$city == 'Lexington'),]$aug.avg <- 76
final.df[which(final.df$city == 'Lexington'),]$sep.avg <- 69
final.df[which(final.df$city == 'Lexington'),]$oct.avg <- 57
final.df[which(final.df$city == 'Lexington'),]$nov.avg <- 46
final.df[which(final.df$city == 'Lexington'),]$dec.avg <- 38
final.df[which(final.df$city == 'Lexington'),]$jan.precip <- 4.2
final.df[which(final.df$city == 'Lexington'),]$feb.precip <- 3.4
final.df[which(final.df$city == 'Lexington'),]$mar.precip <- 4.1
final.df[which(final.df$city == 'Lexington'),]$apr.precip <- 5.7
final.df[which(final.df$city == 'Lexington'),]$may.precip <- 5.0
final.df[which(final.df$city == 'Lexington'),]$jun.precip <- 5.2
final.df[which(final.df$city == 'Lexington'),]$jul.precip <- 6.1
final.df[which(final.df$city == 'Lexington'),]$aug.precip <- 4.7
final.df[which(final.df$city == 'Lexington'),]$sep.precip <- 3.9
final.df[which(final.df$city == 'Lexington'),]$oct.precip <- 4.0
final.df[which(final.df$city == 'Lexington'),]$nov.precip <- 3.0
final.df[which(final.df$city == 'Lexington'),]$dec.precip <- 5.2
final.df[which(final.df$city == 'Lexington'),]$air.quality <- 42

final.df[which(final.df$city == 'Saint Paul'),]$walk.score
final.df[which(final.df$city == 'Saint Paul'),]$walk.score <- 84
final.df[which(final.df$city == 'Saint Paul'),]$bike.score <- 59
final.df[which(final.df$city == 'Saint Paul'),]$transit.score <- 0
final.df[which(final.df$city == 'Saint Paul'),]$cost.of.living <- 101
final.df[which(final.df$city == 'Saint Paul'),]$crime <- 4216
final.df[which(final.df$city == 'Saint Paul'),]$mf.ratio <- 1.0
final.df[which(final.df$city == 'Saint Paul'),]$married <- 0.43
final.df[which(final.df$city == 'Saint Paul'),]$families <- 0.53
final.df[which(final.df$city == 'Saint Paul'),]$median.age <- 31.4
final.df[which(final.df$city == 'Saint Paul'),]$jan.avg <- 17
final.df[which(final.df$city == 'Saint Paul'),]$feb.avg <- 20
final.df[which(final.df$city == 'Saint Paul'),]$mar.avg <- 34
final.df[which(final.df$city == 'Saint Paul'),]$apr.avg <- 48
final.df[which(final.df$city == 'Saint Paul'),]$may.avg <- 59
final.df[which(final.df$city == 'Saint Paul'),]$jun.avg <- 70
final.df[which(final.df$city == 'Saint Paul'),]$jul.avg <- 75
final.df[which(final.df$city == 'Saint Paul'),]$aug.avg <- 72
final.df[which(final.df$city == 'Saint Paul'),]$sep.avg <- 64
final.df[which(final.df$city == 'Saint Paul'),]$oct.avg <- 50
final.df[which(final.df$city == 'Saint Paul'),]$nov.avg <- 37
final.df[which(final.df$city == 'Saint Paul'),]$dec.avg <- 21
final.df[which(final.df$city == 'Saint Paul'),]$jan.precip <- 0.5 
final.df[which(final.df$city == 'Saint Paul'),]$feb.precip <- 0.7
final.df[which(final.df$city == 'Saint Paul'),]$mar.precip <- 1.6
final.df[which(final.df$city == 'Saint Paul'),]$apr.precip <- 3.9
final.df[which(final.df$city == 'Saint Paul'),]$may.precip <- 4.5
final.df[which(final.df$city == 'Saint Paul'),]$jun.precip <- 5.7
final.df[which(final.df$city == 'Saint Paul'),]$jul.precip <- 4.4
final.df[which(final.df$city == 'Saint Paul'),]$aug.precip <- 5.8
final.df[which(final.df$city == 'Saint Paul'),]$sep.precip <- 3.4
final.df[which(final.df$city == 'Saint Paul'),]$oct.precip <- 3.2
final.df[which(final.df$city == 'Saint Paul'),]$nov.precip <- 1.4
final.df[which(final.df$city == 'Saint Paul'),]$dec.precip <- 1.2
final.df[which(final.df$city == 'Saint Paul'),]$air.quality <- 44

final.df[which(final.df$city == 'Winston–Salem'),]$city <- 'Winston-Salem'
final.df[which(final.df$city == 'Winston-Salem'),]$walk.score <- 83
final.df[which(final.df$city == 'Winston-Salem'),]$bike.score <- 74
final.df[which(final.df$city == 'Winston-Salem'),]$transit.score <- 25
final.df[which(final.df$city == 'Winston-Salem'),]$cost.of.living <- 95
final.df[which(final.df$city == 'Winston-Salem'),]$crime <- 4179
final.df[which(final.df$city == 'Winston-Salem'),]$mf.ratio <- 0.9
final.df[which(final.df$city == 'Winston-Salem'),]$married <- 0.48
final.df[which(final.df$city == 'Winston-Salem'),]$families <- 0.48
final.df[which(final.df$city == 'Winston-Salem'),]$median.age <- 35.0
final.df[which(final.df$city == 'Winston-Salem'),]$jan.avg <- 40
final.df[which(final.df$city == 'Winston-Salem'),]$feb.avg <- 42
final.df[which(final.df$city == 'Winston-Salem'),]$mar.avg <- 51
final.df[which(final.df$city == 'Winston-Salem'),]$apr.avg <- 60
final.df[which(final.df$city == 'Winston-Salem'),]$may.avg <- 67
final.df[which(final.df$city == 'Winston-Salem'),]$jun.avg <- 76
final.df[which(final.df$city == 'Winston-Salem'),]$jul.avg <- 78
final.df[which(final.df$city == 'Winston-Salem'),]$aug.avg <- 77
final.df[which(final.df$city == 'Winston-Salem'),]$sep.avg <- 71
final.df[which(final.df$city == 'Winston-Salem'),]$oct.avg <- 60
final.df[which(final.df$city == 'Winston-Salem'),]$nov.avg <- 50
final.df[which(final.df$city == 'Winston-Salem'),]$dec.avg <- 44
final.df[which(final.df$city == 'Winston-Salem'),]$jan.precip <- 3.6
final.df[which(final.df$city == 'Winston-Salem'),]$feb.precip <- 2.5
final.df[which(final.df$city == 'Winston-Salem'),]$mar.precip <- 3.5
final.df[which(final.df$city == 'Winston-Salem'),]$apr.precip <- 4.3
final.df[which(final.df$city == 'Winston-Salem'),]$may.precip <- 4.5
final.df[which(final.df$city == 'Winston-Salem'),]$jun.precip <- 4.0
final.df[which(final.df$city == 'Winston-Salem'),]$jul.precip <- 4.1
final.df[which(final.df$city == 'Winston-Salem'),]$aug.precip <- 4.8
final.df[which(final.df$city == 'Winston-Salem'),]$sep.precip <- 3.9
final.df[which(final.df$city == 'Winston-Salem'),]$oct.precip <- 3.8
final.df[which(final.df$city == 'Winston-Salem'),]$nov.precip <- 3.6
final.df[which(final.df$city == 'Winston-Salem'),]$dec.precip <- 3.8
final.df[which(final.df$city == 'Winston-Salem'),]$air.quality <- 41

final.df[which(final.df$city == 'Boise'),]$walk.score
final.df[which(final.df$city == 'Boise'),]$walk.score <- 87
final.df[which(final.df$city == 'Boise'),]$bike.score <- 97
final.df[which(final.df$city == 'Boise'),]$transit.score <- 0 
  
final.df[which(final.df$city == 'Augusta'),]$walk.score
final.df[which(final.df$city == 'Augusta'),]$walk.score <- 68
final.df[which(final.df$city == 'Augusta'),]$bike.score <- 47
final.df[which(final.df$city == 'Augusta'),]$transit.score <- 0
  
final.df[which(final.df$city == 'Mckinney'),]$walk.score
final.df[which(final.df$city == 'Mckinney'),]$city <- 'McKinney'
final.df[which(final.df$city == 'McKinney'),]$walk.score <- 61
final.df[which(final.df$city == 'McKinney'),]$bike.score <- 0
final.df[which(final.df$city == 'McKinney'),]$transit.score <- 0
  
final.df[which(final.df$city == 'Mcallen'),]$walk.score
final.df[which(final.df$city == 'Mcallen'),]$city <- 'McAllen'
final.df[which(final.df$city == 'McAllen'),]$walk.score <- 77
final.df[which(final.df$city == 'McAllen'),]$bike.score <- 61
final.df[which(final.df$city == 'McAllen'),]$transit.score <- 0
  
final.df[which(final.df$city == 'Athens'),]$walk.score
final.df[which(final.df$city == 'Athens'),]$walk.score <- 45
final.df[which(final.df$city == 'Athens'),]$bike.score <- 32
final.df[which(final.df$city == 'Athens'),]$transit.score <- 0
  
final.df[which(final.df$city == 'Ventura'),]$walk.score
final.df[which(final.df$city == 'Ventura'),]$walk.score <- 82
final.df[which(final.df$city == 'Ventura'),]$bike.score <- 56
final.df[which(final.df$city == 'Ventura'),]$transit.score <- 0
  
final.df[which(final.df$city == 'Jurupa Valley'),]$walk.score
final.df[which(final.df$city == 'Jurupa Valley'),]$walk.score <- 46
final.df[which(final.df$city == 'Jurupa Valley'),]$bike.score <- 40
final.df[which(final.df$city == 'Jurupa Valley'),]$transit.score <- 21 
  
final.df[which(final.df$city == 'Edison'),]$walk.score
final.df[which(final.df$city == 'Edison'),]$walk.score <- 52
final.df[which(final.df$city == 'Edison'),]$bike.score <- 52
final.df[which(final.df$city == 'Edison'),]$transit.score <- 0
  
final.df[which(final.df$city == 'Clinton'),]$walk.score
final.df[which(final.df$city == 'Clinton'),]$walk.score <- 44
final.df[which(final.df$city == 'Clinton'),]$bike.score <- 46
final.df[which(final.df$city == 'Clinton'),]$transit.score <- 0

final.df[which(final.df$city == 'Macon'),]$cost.of.living <- 84
final.df[which(final.df$city == 'Macon'),]$crime <- 5212
final.df[which(final.df$city == 'Macon'),]$mf.ratio <- 0.9
final.df[which(final.df$city == 'Macon'),]$married <- 0.47
final.df[which(final.df$city == 'Macon'),]$families <- 0.43
final.df[which(final.df$city == 'Macon'),]$median.age <- 35.8
final.df[which(final.df$city == 'Macon'),]$jan.avg <- 47
final.df[which(final.df$city == 'Macon'),]$feb.avg <- 49
final.df[which(final.df$city == 'Macon'),]$mar.avg <- 57
final.df[which(final.df$city == 'Macon'),]$apr.avg <- 64
final.df[which(final.df$city == 'Macon'),]$may.avg <- 72
final.df[which(final.df$city == 'Macon'),]$jun.avg <- 79
final.df[which(final.df$city == 'Macon'),]$jul.avg <- 81
final.df[which(final.df$city == 'Macon'),]$aug.avg <- 80
final.df[which(final.df$city == 'Macon'),]$sep.avg <- 75
final.df[which(final.df$city == 'Macon'),]$oct.avg <- 64
final.df[which(final.df$city == 'Macon'),]$nov.avg <- 54
final.df[which(final.df$city == 'Macon'),]$dec.avg <- 50
final.df[which(final.df$city == 'Macon'),]$jan.precip <- 4.1
final.df[which(final.df$city == 'Macon'),]$feb.precip <- 4.5
final.df[which(final.df$city == 'Macon'),]$mar.precip <- 3.4
final.df[which(final.df$city == 'Macon'),]$apr.precip <- 4.5
final.df[which(final.df$city == 'Macon'),]$may.precip <- 2.5
final.df[which(final.df$city == 'Macon'),]$jun.precip <- 4.7
final.df[which(final.df$city == 'Macon'),]$jul.precip <- 5.2
final.df[which(final.df$city == 'Macon'),]$aug.precip <- 4.7
final.df[which(final.df$city == 'Macon'),]$sep.precip <- 3.6
final.df[which(final.df$city == 'Macon'),]$oct.precip <- 2.3
final.df[which(final.df$city == 'Macon'),]$nov.precip <- 3.2
final.df[which(final.df$city == 'Macon'),]$dec.precip <- 6.4
final.df[which(final.df$city == 'Macon'),]$air.quality <- 41


final.df[which(final.df$city == 'Ventura'),]$cost.of.living <- 144
final.df[which(final.df$city == 'Ventura'),]$crime <- 3725
final.df[which(final.df$city == 'Ventura'),]$mf.ratio <- 1.0
final.df[which(final.df$city == 'Ventura'),]$married <- 0.54
final.df[which(final.df$city == 'Ventura'),]$families <- 0.43
final.df[which(final.df$city == 'Ventura'),]$median.age <- 38.9
final.df[which(final.df$city == 'Ventura'),]$jan.avg <- 56
final.df[which(final.df$city == 'Ventura'),]$feb.avg <- 56
final.df[which(final.df$city == 'Ventura'),]$mar.avg <- 57
final.df[which(final.df$city == 'Ventura'),]$apr.avg <- 58
final.df[which(final.df$city == 'Ventura'),]$may.avg <- 60
final.df[which(final.df$city == 'Ventura'),]$jun.avg <- 63
final.df[which(final.df$city == 'Ventura'),]$jul.avg <- 65
final.df[which(final.df$city == 'Ventura'),]$aug.avg <- 65
final.df[which(final.df$city == 'Ventura'),]$sep.avg <- 65
final.df[which(final.df$city == 'Ventura'),]$oct.avg <- 64
final.df[which(final.df$city == 'Ventura'),]$nov.avg <- 60
final.df[which(final.df$city == 'Ventura'),]$dec.avg <- 55
final.df[which(final.df$city == 'Ventura'),]$jan.precip <- 3.1
final.df[which(final.df$city == 'Ventura'),]$feb.precip <- 2.7
final.df[which(final.df$city == 'Ventura'),]$mar.precip <- 1.4
final.df[which(final.df$city == 'Ventura'),]$apr.precip <- 1.0
final.df[which(final.df$city == 'Ventura'),]$may.precip <- 0.2
final.df[which(final.df$city == 'Ventura'),]$jun.precip <- 0.0
final.df[which(final.df$city == 'Ventura'),]$jul.precip <- 0.0
final.df[which(final.df$city == 'Ventura'),]$aug.precip <- 0.0
final.df[which(final.df$city == 'Ventura'),]$sep.precip <- 0.1
final.df[which(final.df$city == 'Ventura'),]$oct.precip <- 0.5
final.df[which(final.df$city == 'Ventura'),]$nov.precip <- 0.6
final.df[which(final.df$city == 'Ventura'),]$dec.precip <- 2.1
final.df[which(final.df$city == 'Ventura'),]$air.quality <- 48

final.df[which(final.df$city == 'Edison'),]$cost.of.living <- 125
final.df[which(final.df$city == 'Edison'),]$crime <- 1995
final.df[which(final.df$city == 'Edison'),]$mf.ratio <- 1.0
final.df[which(final.df$city == 'Edison'),]$married <- 0.69
final.df[which(final.df$city == 'Edison'),]$families <- 0.42
final.df[which(final.df$city == 'Edison'),]$median.age <- 41.3
final.df[which(final.df$city == 'Edison'),]$jan.avg <- 34
final.df[which(final.df$city == 'Edison'),]$feb.avg <- 32
final.df[which(final.df$city == 'Edison'),]$mar.avg <- 40
final.df[which(final.df$city == 'Edison'),]$apr.avg <- 55
final.df[which(final.df$city == 'Edison'),]$may.avg <- 65
final.df[which(final.df$city == 'Edison'),]$jun.avg <- 73
final.df[which(final.df$city == 'Edison'),]$jul.avg <- 78
final.df[which(final.df$city == 'Edison'),]$aug.avg <- 75
final.df[which(final.df$city == 'Edison'),]$sep.avg <- 70
final.df[which(final.df$city == 'Edison'),]$oct.avg <- 62
final.df[which(final.df$city == 'Edison'),]$nov.avg <- 46
final.df[which(final.df$city == 'Edison'),]$dec.avg <- 39
final.df[which(final.df$city == 'Edison'),]$jan.precip <- 6.3
final.df[which(final.df$city == 'Edison'),]$feb.precip <- 4.9
final.df[which(final.df$city == 'Edison'),]$mar.precip <- 7.3
final.df[which(final.df$city == 'Edison'),]$apr.precip <- 5.0
final.df[which(final.df$city == 'Edison'),]$may.precip <- 9.9
final.df[which(final.df$city == 'Edison'),]$jun.precip <- 8.3
final.df[which(final.df$city == 'Edison'),]$jul.precip <- 8.3
final.df[which(final.df$city == 'Edison'),]$aug.precip <- 7.8
final.df[which(final.df$city == 'Edison'),]$sep.precip <- 4.9
final.df[which(final.df$city == 'Edison'),]$oct.precip <- 6.3
final.df[which(final.df$city == 'Edison'),]$nov.precip <- 5.9
final.df[which(final.df$city == 'Edison'),]$dec.precip <- 5.8
final.df[which(final.df$city == 'Edison'),]$air.quality <- 53

final.df[which(is.na(final.df$transit.score)),]$transit.score <- 0
final.df[which(is.na(final.df$walk.score)),]$walk.score <- 0
final.df[which(is.na(final.df$bike.score)),]$bike.score <- 0
 
final.df[which(is.na(final.df$concerts)),]$concerts <- 0
final.df %>% print(n=311)

final.df %>% filter(is.na(jan.avg))


# Cleaning the data
write_csv(final.df, 'bdetweiler.github.io/projects/places/final.csv')

# Final final final finally!
final.df <- read_csv('bdetweiler.github.io/projects/places/final.csv')

# Scale the data
weather.avg <-  rowMeans(data.frame(scale(abs(final.df$jan.avg - 78))[,1], 
                                    scale(abs(final.df$feb.avg - 78))[,1],
                                    scale(abs(final.df$mar.avg - 78))[,1],
                                    scale(abs(final.df$apr.avg - 78))[,1],
                                    scale(abs(final.df$may.avg - 78))[,1],
                                    scale(abs(final.df$jun.avg - 78))[,1],
                                    scale(abs(final.df$jul.avg - 78))[,1],
                                    scale(abs(final.df$aug.avg - 78))[,1],
                                    scale(abs(final.df$sep.avg - 78))[,1],
                                    scale(abs(final.df$oct.avg - 78))[,1],
                                    scale(abs(final.df$nov.avg - 78))[,1],
                                    scale(abs(final.df$dec.avg - 78))[,1]))
                
precip.avg <-  rowMeans(data.frame(scale(final.df$jan.precip)[,1], 
                                    scale(final.df$feb.precip)[,1],
                                    scale(final.df$mar.precip)[,1],
                                    scale(final.df$apr.precip)[,1],
                                    scale(final.df$may.precip)[,1],
                                    scale(final.df$jun.precip)[,1],
                                    scale(final.df$jul.precip)[,1],
                                    scale(final.df$aug.precip)[,1],
                                    scale(final.df$sep.precip)[,1],
                                    scale(final.df$oct.precip)[,1],
                                    scale(final.df$nov.precip)[,1],
                                    scale(final.df$dec.precip)[,1]))
                    

scaled.df <- tibble(city=final.df$city, 
                    state=final.df$state,
                    pop2017=-scale(final.df$pop2017)[,1],
                    area.sq.mi=-scale(final.df$area.sq.mi)[,1],
                    pop.density=-scale(final.df$pop.density)[,1],
                    walk.score=-scale(final.df$walk.score)[,1],
                    bike.score=-scale(final.df$bike.score)[,1],
                    transit.score=-scale(final.df$transit.score)[,1],
                    median.age=scale(final.df$median.age)[,1],
                    mf.ratio=scale(final.df$mf.ratio)[,1],
                    married=scale(final.df$married)[,1],
                    families=scale(final.df$families)[,1],
                    cost.of.living=(scale(final.df$cost.of.living)[,1] * 5),
                    crime=scale(final.df$crime)[,1],
                    concerts=-scale(final.df$concerts)[,1],
                    weather.avg=weather.avg,
                    precip.avg=precip.avg,
                    air.quality=scale(final.df$air.quality)[,1])

results <- scaled.df %>% select(-city, -state) %>% rowSums()
scaled.df <- add_column(scaled.df, results=results)
scaled.df
rank <- 1:311
scaled.df <- add_column(scaled.df, rank.by.size=rank)
scaled.df <- scaled.df %>% arrange(results) %>% add_column(rank.by.score=rank)

write_csv(scaled.df, 'bdetweiler.github.io/projects/places/rankings.csv')

#rank.by.score <- scaled.df %>% arrange(pop2017) %>% select(rank.by.score)

results <- scaled.df %>% arrange(pop2017) %>% select(results)

weather.averages <- data.frame(final.df$jan.avg,
                               final.df$feb.avg,
                               final.df$mar.avg,
                               final.df$apr.avg,
                               final.df$may.avg,
                               final.df$jun.avg,
                               final.df$jul.avg,
                               final.df$aug.avg,
                               final.df$sep.avg,
                               final.df$oct.avg,
                               final.df$nov.avg,
                               final.df$dec.avg) %>% rowMeans()

precip.averages <- data.frame(final.df$jan.precip,
                               final.df$feb.precip,
                               final.df$mar.precip,
                               final.df$apr.precip,
                               final.df$may.precip,
                               final.df$jun.precip,
                               final.df$jul.precip,
                               final.df$aug.precip,
                               final.df$sep.precip,
                               final.df$oct.precip,
                               final.df$nov.precip,
                               final.df$dec.precip) %>% rowMeans()

final.df <- final.df %>% select(-results, -weather.averages, -precip.averages)
final.df
results
final.df <- final.df %>% add_column(results=results$results)
final.df <- final.df %>% add_column(weather.averages=weather.averages)
final.df <- final.df %>% add_column(precip.averages=precip.averages)

final.df <-  final.df %>% 
  arrange(results) %>%
  add_column(rank.by.score=rank)

write_csv(final.df, 'bdetweiler.github.io/projects/places/final.csv')

