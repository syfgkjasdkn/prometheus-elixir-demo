defmodule Metrics.Example do
  @moduledoc false
  use Prometheus.Metric

  @counter name: :hello_world_total, help: "Hello Worlds requests", labels: [:command]
  @gauge name: :hello_worlds_in_progress, help: "Number of Hello Worlds in progress"
  @gauge name: :hello_world_last_time_seconds, help: "The last time a Hello World was served"
end
