# GlueFM

Chat app built for sharing music efficiently.

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
- Websocksets via ActionCable & Redis
- React for the web client

## Development

```sh
# stand up service containers
docker-compose up

# setup DB - http://nobrainer.io/docs/db_management/
rake nobrainer:sync_schema
rake nobrainer:seed

# run the server
bin/rails s
```

#### Playing with Web Sockets

```sh
npm install -g wscat
wscat -c "ws://localhost:3000/cable"
```

## Initial Implementation Plan:

1. Logout on User Icon
1. Initial template for a single channel.
1. Interface to write messages.
1. Track table, Link table + module to translate links between music providers.
1. Table for Listens (user-track listen state) + recording listens.
1. Export of playlists to music provider of choice.
1. Scripts for AWS deployment.
1. Multichannel
1. Design fixes.

## Useful resources
  - RailsAPI + WebSockets + React: https://medium.com/@dakota.lillie/using-action-cable-with-react-c37df065f296
  - RailsAPI + RethinkDB + WebSockets: https://www.youtube.com/watch?v=CwF44oMOvJs
  - RailsAPI + Cookie Auth + React: https://pragmaticstudio.com/tutorials/rails-session-cookies-for-api-authentication
  - Hybrid Client/Server OAuth: https://developers.google.com/identity/sign-in/web/server-side-flow
  - TODO (glue youtube link)

_Thank you to the authors!_
