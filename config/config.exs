# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :metr,
  ecto_repos: [Repo]

# Configures the endpoint
config :metr, Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4DgbVkOlvGWc5B4ckP9jGWpG7dLf4kod7TmUDyEl8S2LSDQn5uFTgqrgsRYNkCBd",
  render_errors: [view: Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Metr.PubSub, adapter: Phoenix.PubSub.PG2],
  instrumenters: [Web.Instrumenter.Phoenix]

config :prometheus, Web.Instrumenter.Phoenix,
  controller_call_labels: [:controller, :action],
  # TODO https://github.com/deadtrickster/prometheus-phoenix/issues/11
  channel_join_labels: [:channel, :topic, :transport],
  registry: :default,
  duration_unit: :microseconds,
  duration_buckets: [
    10,
    100,
    1000,
    10_000,
    100_000,
    1_000_000,
    10_000_000
  ]

config :prometheus, Web.Instrumenter.Pipeline,
  labels: [:status_class, :method, :host, :scheme, :request_path],
  registry: :default,
  duration_unit: :microseconds,
  duration_buckets: [
    10,
    100,
    1000,
    10_000,
    100_000,
    1_000_000,
    10_000_000
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
