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

- One hack-y way would be to have a cronjob on the prometheus instance which requests the [json file config](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#file_sd_config) from the elixir app, which keeps it in some CRDT-like datastructure (e.g. https://hex.pm/packages/delta_crdt) or in a centralized database (e.g. postgres)

- Consul with [consul_sd](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#consul_sd_config)

### Telegram-Alertmanager integration

To get basic alerts from prometheus via telegram, uncomment the alertmanager bits ([here](https://github.com/syfgkjasdkn/prometheus-elixir-demo/blob/a3de27eaaa944ab7b35ae3c4d53a3fab2824dcb1/docker-compose.yml#L38-L51) and [here](https://github.com/syfgkjasdkn/prometheus-elixir-demo/blob/a3de27eaaa944ab7b35ae3c4d53a3fab2824dcb1/prometheus/prometheus.yml#L6-L10)) and supply your telegram creds where necessary ([here](https://github.com/syfgkjasdkn/prometheus-elixir-demo/blob/a3de27eaaa944ab7b35ae3c4d53a3fab2824dcb1/prometheus_bot/config.yml#L1) and [here](https://github.com/syfgkjasdkn/prometheus-elixir-demo/blob/a3de27eaaa944ab7b35ae3c4d53a3fab2824dcb1/alertmanager/alertmanager.yml#L8)). It looks like this:

![Telegram-Alertmanager integration](https://github.com/syfgkjasdkn/prometheus-elixir-demo/blob/master/public/Screenshot%202019-04-22%20at%2013.33.08.png)
