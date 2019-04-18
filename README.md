# Prometheus with Elixir

Setup:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `cd assets && npm install`
- Start postgres, prometheus, and some other services with `docker-compose up`
- Start Phoenix endpoint and the corresponding app that are going to get scraped with `mix phx.server`

Now you can visit [`localhost:9090`](http://localhost:9090) to interact with Prometheus.

## Learn more

- Official website: https://prometheus.io
