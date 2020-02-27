#trying to figure out how to import stuff from spotify's API
rm(list = ls())

library(spotifyr)
library(ggplot2)
library(jpeg)
library(grid)
Sys.setenv(SPOTIFY_CLIENT_ID = 'f6820550957141d6944de1b897b9d388')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'f630c4928be64641a3424cc352834299')

access_token <- get_spotify_access_token()

album <- get_album("5LsyqeWryTmxsmda4xkm5a")
album_image <- album[["images"]][["url"]][1]
album_name <- album[["name"]]
track_names <- album[["tracks"]][["items"]][["name"]]

track_length <- album[["tracks"]][["items"]][["duration_ms"]]
track_length <- max(track_length) - track_length
album_df <- data.frame("track_length" = track_length, "track_names" = track_names)
album_cover <- jpeg::readJPEG("test.jpg")
