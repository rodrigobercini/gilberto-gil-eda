Sys.setenv(language='english')
Sys.setenv(SPOTIFY_CLIENT_ID = '') # API KEY
Sys.setenv(SPOTIFY_CLIENT_SECRET = '') # API KEY

library(spotifyr) # Scrape
library(tidyverse) # Data manipulation
library(knitr) # Table presentation
library(ggplot2) # Plots
library(gganimate) # GIFs
library(ggdark) # Plots Themes
library(knitr) # Generate nice tables

#########################
# Data scrapíng
#########################
# Get features
# Commented out because we already have the file

#gil <- get_artist_audio_features('gilberto gil')
#df <- as.data.frame(apply(gil,2, as.character))
#gil_pop <- df
#for (i in 1:nrow(gil_pop)){
  #gil_pop[i,40] <- get_track(gil_pop$track_id[i])[13]
#}
#write.csv(gil_pop, 'Gilberto_Gil_Final.csv', row.names=FALSE)

# Read file
gil <- read.csv('Gilberto_Gil_Final.csv', check.names = FALSE)


######################
# Album Data
######################

### Most and least popular albums

pop_album <- gil %>%
  group_by(album_name,album_release_year, available_markets) %>%
  summarise(mean_pop = mean(popularity),
            nr_songs = n()) %>%
  arrange(desc(mean_pop))

head(pop_album,10)
tail(pop_album,10)

### Albums/Songs released by Year

album_year <- gil %>% 
  group_by(album_name, album_release_year) %>%
  summarise(songs = n())

album_year <- album_year %>%
  group_by(album_release_year) %>%
  summarise(nr_albums = n(),
            nr_songs = sum(songs)) %>%
  arrange(desc(nr_songs))

ggplot(album_year, aes(y=nr_albums, x=album_release_year, size=nr_songs, colour=nr_songs)) +
  geom_point()+ dark_theme_bw() +scale_colour_gradient(low="blue",high="red") +
  scale_size_continuous(range = c(3, 15)) +
  guides(color= guide_legend(), size=guide_legend()) +
  labs(title="Albums and Songs released by Year",
       subtitle="Songs available in Spotify",
       x = "Year", y = "Albums Released",
       colour = "Songs Released", size = "Songs Released") + 
  geom_line(color='white', size=0.2, alpha=0.2)+
  scale_x_continuous(breaks = seq(1960, 2020, by = 10))


### Mode ratio (how many songs are in Major by Album)

mode_ratio <- gil %>%
  group_by(album_name, album_release_year) %>%
  summarise(ratio=mean(mode),
            nr_songs=n()) %>%
  arrange(desc(ratio))

head(mode_ratio,10)
tail(mode_ratio,10)

######################
# Tracks Data
######################

### Popularity
# The popularity of a track is a value between 0 and 100, with 100 being the most popular.
# The popularity is calculated by algorithm and is based, in the most part,
# on the total number of plays the track has had and how recent those plays are.

pop_gil <- gil %>% 
  group_by(track_name, album_name, album_release_year, popularity) %>%
  summarise() %>%
  arrange(desc(popularity))

kable(head(pop_gil,10))

ggplot(gil, aes(x=key_mode, y=popularity, fill=key_name)) +
  geom_boxplot() + dark_theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Popularity by Key and Mode",
       x='Year', y='Popularity', fill='Key Name')

### Valence

gil_valence <- gil %>% 
  arrange(-valence) %>% 
  select(track_name, valence, popularity)

kable(head(gil_valence,10))
kable(tail(gil_valence,10))
ggplot(gil, aes(x=key_mode, y=valence, fill=key_name)) +
  geom_boxplot() + dark_theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Valence by Key and Mode",
       subtitle='Songs in minor keys tend to be less "positive"',
       x='Year', y='Valence', fill='Key Name')

### Mode (major/minor)
mode_gil <- gil %>% group_by(track_name, mode_name) %>%
  summarise()%>% group_by(mode_name) %>%
  count(mode_name, sort = TRUE)

head(mode_gil,10)

### Key and Mode
key_mode_gil <- gil %>% group_by(track_name, key_mode) %>%
  summarise()%>% group_by(key_mode) %>%
  count(key_mode, sort = TRUE)

head(key_mode_gil,10)

######################
# Features Evolution by Year
######################

#### Key

# Basic barplot:
ggplot(gil, aes(x=key_name, fill=key_name)) + geom_bar() +dark_theme_bw()

# Selecting columns
df <- select(gil, c('album_release_year', 'key_name'))
df$y <- 1
colnames(df) <- c('t', 'x', 'y')

# Feature engineering to get cumulative sum of songs by key per year
df2 <- df %>%
  group_by (t,x) %>%
  summarise(sum_y = sum(y))

df2$x <- as.character(df2$x)
df2$t <- as.numeric(df2$t)

df3 <- df2 %>%
  as.data.frame() %>%
  complete(t=1962:2019, nesting(x), fill=list(sum_y=0)) %>%
  arrange(t)%>%
  group_by(x)%>%
  mutate(y_cum = cumsum(sum_y))

# Plotting the GIF
pl <- ggplot(df3, aes(x=x, y=y_cum, fill=x)) +  geom_col() + 
  labs(x=NULL, y=NULL, fill=NULL, subtitle="{closest_state}",
       title="Timeline of Gilberto Gil's released songs by key") +
  dark_theme_bw() + theme(plot.title = element_text(size=18),
                          plot.subtitle = element_text(size=24),
                          legend.position = "none") +
  transition_states(t, transition_length = 0.5, state_length = 1) +
  enter_fade() + ease_aes('sine-in-out')

animate(pl, nframes = 200, fps = 10, end_pause = 50)

#### Popularity
ggplot(gil, aes(y=popularity, x=album_release_year)) +
  geom_point() + dark_theme_bw() + geom_smooth() +
  labs(title = "Popularity by year",
       subtitle = 'Each dot is a song',
       x='Year', y='Popularity') +
  scale_x_continuous(breaks = seq(1960, 2020, by = 10))

#### Valence

gil_valence_year <- gil %>% 
  group_by(album_release_year) %>%
  summarise(nr_songs = n(),
            valence = mean(valence))

ggplot(gil_valence_year, aes(y=valence, x=album_release_year,size=nr_songs)) +
  geom_point() + dark_theme_bw() + geom_smooth() +
  labs(title = "Valence by year",
       subtitle='Valence peaked betwen 80s and 00s (each dot is a year)',
       x='Year', y='Valence', size="Nr. of Songs") +
  scale_x_continuous(breaks = seq(1960, 2020, by = 10))

### Danceability

gil_dance_year <- gil %>% 
  group_by(album_release_year) %>%
  summarise(nr_songs = n(),
            danceability = mean(danceability))

ggplot(gil_dance_year, aes(y=danceability, x=album_release_year,size=nr_songs)) +
  geom_point() + dark_theme_bw() + geom_smooth() +
  labs(title = "Danceability by year ",
       subtitle='Rise in danceability in the 80s',
       x='Year', y='Danceability', size="Nr. of Songs") +
  scale_x_continuous(breaks = seq(1960, 2020, by = 10))
