defmodule Metrics.HelloWorldTotal do
  @moduledoc false
  use Prometheus.Metric

  @counter name: :hello_world_total, help: "Hello Worlds requests", labels: [:command]

  def command(command_label) do
    Counter.inc(
      name: :hello_world_total,
      labels: [command_label]
    )
  end
end
