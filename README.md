# GlueFM

Chat app geared towards music sharing.

## Features

- Channels
- Threads
- Automatic translation of links for the user's music platform of choice (Spotify, YouTube & SoundCloud supported).
- Export of automatic playlists:
    - all tracks in channel
    - unheard tracks

## Tech Stack

- RailsAPI
- RethinkDB
- Websocksets via ActionCable (+Redis)
- Redux + React

## Development

```sh
# stand up service containers
docker-compose up

# setup DB
bin/rails c
> NoBrainer.sync_schema
> NoBrainer.seed

# seed DB with test data
rake nobrainer:seed
```

## Initial Implementation Plan:

1. Create Messages table + seed DB file.
1. Display seed data via websocket (test with websocket CLI).
1. React display of seed data + initial template.
1. Interface to add data to messages table.
1. Tracks table.
1. Links table + module to translate links between music providers.
1. Home page + authentication (Google OAuth).
1. Table for Listens (user-track listen state) + recording listens.
1. Export of playlists to music provider of choice.
1. Scripts for AWS deployment.
1. Design fixes.
