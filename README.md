# Prometheus with Elixir

Setup:

- Start postgres, prometheus, and some other services with `docker-compose up`
- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint and the corresponding app that are going to get scraped with `mix phx.server`

Now you can visit [`localhost:3000`](http://localhost:3000) to view Grafana's dashboard, and [`localhost:9090`](http://localhost:9090) to interact with Prometheus.

## Learn more

- Official website: https://prometheus.io

## Notes

### How to achieve dynamic configs in a distributed env?

- One hack-y way would be to have a cronjob on the prometheus instance which requests the json file config from the elixir app, which keeps it in some CRDT-like datastructure (e.g. https://hex.pm/packages/delta_crdt) or in a centralized database (e.g. postgres)

- Consul. Just use consul
